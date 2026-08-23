from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """Loaded from env vars / .env — see WATHIQ_AI_SPRINT_PLAN.md's Phase 0 section."""

    model_config = SettingsConfigDict(env_file=".env", extra="ignore")

    ai_service_api_key: str = ""
    ai_webhook_secret: str = ""
    laravel_callback_url: str = "http://localhost:8000/api/ai/callback"

    # DeepInfra — embeddings. OpenAI-compatible endpoint.
    deepinfra_api_key: str = ""
    deepinfra_base_url: str = "https://api.deepinfra.com/v1/openai"
    embedding_model: str = "Qwen/Qwen3-Embedding-8B"
    embedding_dimensions: int = 1536  # truncated from the model's native 4096

    # OpenRouter — LLM. Also OpenAI-compatible.
    openrouter_api_key: str = ""
    openrouter_base_url: str = "https://openrouter.ai/api/v1"
    chat_model: str = "deepseek/deepseek-v4-pro"


settings = Settings()
