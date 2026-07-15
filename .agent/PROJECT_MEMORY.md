# Project Memory

Durable verified state for WaWebAPI.

## Identity

- Swift Package library named `WaWebAPI`.
- Swift tools 5.7.
- Manifest declares macOS 11+ and iOS 13+.
- Integrates with Vapor `Application` and `Request`.

## Current Architecture

- `WaWebAPI.profile(...)` creates a profile-scoped `API` facade.
- Endpoint families adapt WaWebAPICore contracts to Vapor requests.
- Shared POST transport targets the WaWeb API and decodes response envelopes.
- Tokens are loaded from PostgreSQL and cached in-process.
- Payload requests may use HMAC-SHA256 authentication.
- Persistence models/migrations use the `wawebapi` schema.
- Message-manager persistence adapts the WaWebAPICore protocol and enums into a queue table plus PostgreSQL enum migrations.

## Current Quality State

- The test target has focused message-manager projection and enum raw-value assertions, but still lacks transport and database-integration coverage.
- Sensitive debug logging and transport duplication are documented debt.
- Several configuration, naming, schema, and cache questions remain open.

## Governance State

- Agent governance bootstrap completed on 2026-07-14.
- Root authority: [`AGENTS.md`](../AGENTS.md).
- Architecture routing: [ARCH_INDEX.md](ARCH_INDEX.md).
- Verified debt: [TECH_DEBT.md](TECH_DEBT.md).
- Open questions: [OPEN_DECISIONS.md](OPEN_DECISIONS.md).
- No runtime Swift files were changed by the governance bootstrap.
