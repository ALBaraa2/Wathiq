from app.config import settings
from app.providers.base import EmbeddingProvider, LLMProvider
from app.providers.fake import FakeEmbeddingProvider, FakeLLMProvider

__all__ = ["get_llm_provider", "get_embedding_provider", "LLMProvider", "EmbeddingProvider"]


def get_llm_provider() -> LLMProvider:
    if not settings.openrouter_api_key:
        return FakeLLMProvider()
    from openai import AsyncOpenAI

    from app.providers.openai_compatible import OpenAICompatibleLLMProvider

    client = AsyncOpenAI(api_key=settings.openrouter_api_key, base_url=settings.openrouter_base_url)
    return OpenAICompatibleLLMProvider(client, settings.chat_model)


def get_embedding_provider() -> EmbeddingProvider:
    if not settings.deepinfra_api_key:
        return FakeEmbeddingProvider(settings.embedding_dimensions)
    from openai import AsyncOpenAI

    from app.providers.openai_compatible import OpenAICompatibleEmbeddingProvider

    client = AsyncOpenAI(api_key=settings.deepinfra_api_key, base_url=settings.deepinfra_base_url)
    return OpenAICompatibleEmbeddingProvider(client, settings.embedding_model, settings.embedding_dimensions)
