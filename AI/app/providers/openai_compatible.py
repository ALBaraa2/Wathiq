from openai import AsyncOpenAI

from app.providers.base import EmbeddingProvider, LLMProvider


class OpenAICompatibleLLMProvider(LLMProvider):
    """Works against any OpenAI-Chat-Completions-compatible endpoint —
    OpenRouter today (deepseek/deepseek-v4-pro), swap base_url/model to change."""

    def __init__(self, client: AsyncOpenAI, model: str):
        self._client = client
        self._model = model

    async def chat(self, system: str, user: str) -> str:
        response = await self._client.chat.completions.create(
            model=self._model,
            messages=[
                {"role": "system", "content": system},
                {"role": "user", "content": user},
            ],
        )
        return response.choices[0].message.content or ""


class OpenAICompatibleEmbeddingProvider(EmbeddingProvider):
    """Works against any OpenAI-Embeddings-compatible endpoint — DeepInfra
    today (Qwen/Qwen3-Embedding-8B, truncated to 1536 via `dimensions`)."""

    def __init__(self, client: AsyncOpenAI, model: str, dimensions: int):
        self._client = client
        self._model = model
        self.dimensions = dimensions

    async def embed(self, texts: list[str]) -> list[list[float]]:
        response = await self._client.embeddings.create(
            model=self._model, input=texts, dimensions=self.dimensions
        )
        return [item.embedding for item in response.data]
