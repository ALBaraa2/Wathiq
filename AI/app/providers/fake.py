import hashlib

from app.providers.base import EmbeddingProvider, LLMProvider


class FakeLLMProvider(LLMProvider):
    """Deterministic stand-in for tests — no network call, same input -> same output."""

    async def chat(self, system: str, user: str) -> str:
        return f"[fake:{hashlib.sha256((system + user).encode()).hexdigest()[:8]}] {user}"


class FakeEmbeddingProvider(EmbeddingProvider):
    def __init__(self, dimensions: int = 1536):
        self.dimensions = dimensions

    async def embed(self, texts: list[str]) -> list[list[float]]:
        vectors = []
        for text in texts:
            digest = hashlib.sha256(text.encode()).digest()
            # Repeat the digest bytes to fill `dimensions`, scale to [-1, 1].
            raw = (digest * (self.dimensions // len(digest) + 1))[: self.dimensions]
            vectors.append([(b - 128) / 128 for b in raw])
        return vectors
