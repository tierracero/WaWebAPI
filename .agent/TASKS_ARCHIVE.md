# Task Archive

Completed and verified tracked work.

## AGENT-DOC-001 — Agent Governance Bootstrap

- **Completed**: 2026-07-14
- **Status**: Completed
- **Scope**: `AGENTS.md`, `.agent/**`
- **Result**: Created project-specific governance, architecture routing, source maps, operational skills, open decisions, technical debt, and task templates based on the supplied reference archive and verified WaWebAPI source.
- **Runtime source changes**: None
- **Validation**:
  - Clean repository baseline captured before work.
  - Documentation paths reviewed after creation.
  - Git diff/status reviewed to confirm only documentation files changed.
  - Runtime build/test not required for documentation-only source-neutral changes; package build remains dependent on private SSH dependencies and environment configuration.
- **Architecture IDs established**: `PKG-001`, `DEP-001`, `PUBLIC-001`, `CONFIG-001`, `API-001`, `API-002`, `HTTP-001`, `HTTP-002`, `ASYNC-001`, `ERROR-001`, `DB-001`, `DB-002`, `CACHE-001`, `SEC-001`, `SEC-002`, `TEST-001`, `TEST-002`, `REL-001`

## PERSIST-001 — Add WaWeb message-manager persistence

- **Completed**: 2026-07-16
- **Status**: Completed
- **Scope**: `Sources/WaWebAPI/Structures/WaWebMessageManager.swift`, `Sources/WaWebAPI/Enums/WaWebMessageManager*.swift`, `Tests/WaWebAPITests/WaWebAPITests.swift`, and stable repository maps/memory.
- **Result**: Added the `WaWebMessageManager` table/model and table migration, plus enum migrations for priority, status, and endpoint type. The model follows WaWebAPICore `main` revision `44d4b22`, including `reqId`, `lid`, `wid`, and nullable `file`.
- **Migration order**: Create `WaWebMessageManagerPriority`, `WaWebMessageManagerStatus`, and `WaWebMessageManagerType` before `WaWebMessageManager`; revert in reverse order.
- **Validation**:
  - Focused `WaWebAPITests` run passed 2 tests with 0 failures.
  - Full `swift test` passed 2 tests with 0 failures.
  - `swift build` completed successfully.
  - Schema columns, model properties, initializer, and Core-item projection were audited field-by-field against `WaWebMessageManagerProtocable`.
  - A live PostgreSQL migration cycle was not run because no test database is configured in this package environment.
- **Architecture IDs**: `DEP-001`, `PUBLIC-001`, `DB-001`, `DB-002`, `TEST-001`, `TEST-002`
