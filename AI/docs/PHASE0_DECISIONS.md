# Phase 0 — AI Integration Contract

> Exit artifact for `WATHIQ_AI_SPRINT_PLAN.md` Catch-Up Sprint, Phase 0. Resolves
> the six Phase 0 items and open decisions #1/#2/#3 from `AI_IMPLEMENTATION_PLAN.md` §6.

## 1. Embedding model

**Qwen3-Embedding-8B** (Alibaba/Qwen, open-weight), via **DeepInfra**'s
OpenAI-compatible API. Default output is 4096-d — truncate to **1536** with the
`dimensions` request parameter to match `knowledge.chunks.embedding vector(1536)`
already migrated (no schema edit, no re-embed risk). Chosen over
`text-embedding-3-small`/`-large` (OpenAI) after comparing DeepInfra's catalog:
same or lower price per token as every other viable multilingual option there,
best multilingual benchmark score of the group, and a 32k context window (vs
OpenAI's 8k / Cohere-tier alternatives' 512) so a full law article chunks
without truncating. Arabic quality is still unverified in production — the
autoretrieval golden-set harness (plan §1B′, Sprint 5) is the gate before this
is load-bearing; revisit here and in `000601_*` if it scores badly.

## 2. LLM provider

**DeepSeek-V4-Pro** (DeepSeek AI), via **OpenRouter** (model id
`deepseek/deepseek-v4-pro`) — cheaper on OpenRouter than DeepSeek's own direct
API at time of writing, plus automatic failover across the ~17 backend
providers OpenRouter routes it through. Chosen over Azure OpenAI (GPT-4o/5.5)
and Claude for cost: it's the cheapest model found that's actually
reasoning-tuned (needed for `analyze_contract`'s multi-step finding logic, not
just lookup), with a 1M-token context that fits a full contract plus every
retrieved citation in one call. SRS names "Microsoft Copilot (replaceable)" —
this is the swapped-in replacement; the `LLMProvider` interface (see
`AI/app/providers/base.py`) keeps it swappable again if needed.

**Trade-off accepted:** this drops the earlier Azure-only data-residency
story (§4 below still holds for the *database*, but LLM calls now leave Azure).
No data-residency requirement has been raised against DeepSeek/OpenRouter
specifically — revisit if one is.

**Not decided yet — OCR for scanned documents (KYC IDs, deeds, legacy paper
contracts):** this is Phase-3-and-later scope (`AI_IMPLEMENTATION_PLAN.md`
"Beyond current scope"), not blocking Phase 1. Researched candidates:
GLM-OCR (cheap, managed API, but **does not support Arabic** — confirmed,
official 8-language list excludes it and real-world testing shows it fails on
Arabic input) and QARI-OCR (Qwen2-VL/Qwen3-VL fine-tune, purpose-built for
Arabic, open weights — but **no managed hosting exists anywhere**, would need
self-hosting). User wants the accurate/professional option when this is
built, not the cheap managed one — so QARI-OCR (self-hosted) is the leading
candidate, not GLM-OCR. Left open since nothing here blocks current sprint
work; revisit when OCR ingestion actually gets scheduled.

## 3. Stack

**Python + FastAPI + LangGraph, pgvector (no HNSW at launch).** All three were
already implied by the schema/SRS — this line ratifies them in writing, per the
sprint plan's ask. Package manager: `uv`.

## 4. AI service DB role

**Already done** — `wathiq_ai` role + grants exist in
[`Back-end/wathiq/database/migrations/2026_08_04_990000_grant_wathiq_privileges.php`](../../Back-end/wathiq/database/migrations/2026_08_04_990000_grant_wathiq_privileges.php)
(`knowledge.*` full access, narrow `app.jurisdictions`/`app.countries`/`app.ai_jobs`
slice, explicit `revoke` on `app.contracts` and friends). Nothing to build here;
`app.assert_privilege_invariants()` already asserts the boundary in CI.

## 5. Wire contract

See [`AI/openapi.yaml`](../openapi.yaml) — `POST /v1/jobs` (Laravel → AI service),
`POST /v1/jobs/{id}/callback` (AI service → Laravel webhook), shared schemas for
`generate_contract`/`analyze_contract` request/response.

**HMAC scheme:** outbound callback signed as
`HMAC-SHA256(webhook_secret, timestamp + "." + raw_body)`, sent as
`X-Wathiq-Signature: t=<timestamp>,v1=<hex digest>`. Laravel rejects if the
timestamp is >5 minutes old (replay defense, backed by `ops.webhook_deliveries`'
unique index on request id). Inbound (Laravel → AI service) uses a static
`X-API-Key` header checked against `AI_SERVICE_API_KEY` — fine for a single
internal caller; revisit if a second caller ever needs the AI service directly.

## 6. Shared config

See `.env.example` (repo root) and `AI/.env.example`. Both sides read the same
`AI_SERVICE_URL` / `AI_WEBHOOK_SECRET` / `AI_SERVICE_API_KEY` values — keep them
in sync manually until there's a shared secrets store.

---

**Status:** all six Phase 0 items resolved 2026-08-23; provider choice revised
same day to DeepInfra (embeddings) + OpenRouter (LLM), see §1/§2 above.
Embedding dimension final (1536, truncated from Qwen3's native 4096). 1A
(service skeleton) can start.
