# Active Tasks

This file contains approved, executable work only.

## Current State

## PERSIST-001 — Add WaWeb message-manager persistence

- **Status**: Approved
- **Goal**: Add a Bridges table/model for `WaWebMessageManagerProtocable` and PostgreSQL enum migrations for its priority, status, and endpoint types.
- **Path scope**: `Sources/WaWebAPI/Structures/WaWebMessageManager.swift`, `Sources/WaWebAPI/Enums/WaWebMessageManager*.swift`, `Tests/WaWebAPITests/WaWebAPITests.swift`, `.agent/{TASKS.md,TASKS_ARCHIVE.md,SOURCE_MAP.md,MODULES.md,PRODUCT_SCOPE.md,PROJECT_MEMORY.md}`
- **Architecture IDs**: `DEP-001`, `PUBLIC-001`, `DB-001`, `DB-002`, `TEST-001`, `TEST-002`
- **Dependencies**: WaWebAPICore `main` containing `WaWebMessageManagerProtocable` and its three enums.
- **Open decisions**: None
- **Compatibility risks**: New public migrations and model establish persistent enum raw values and a new table schema; enum migrations must run before the table migration.
- **Completion criteria**:
  - Table columns, Swift properties, nullability, and enum types agree with the Core protocol.
  - Priority, status, and type migrations use stable lowercase raw values.
  - Focused model/projection and enum mapping tests pass.
- **Verification**:
  - `swift test --filter WaWebAPITests`
  - `swift test`
  - `swift build`
- **Documentation sync**: `SOURCE_MAP.md`, `MODULES.md`, `PRODUCT_SCOPE.md`, `PROJECT_MEMORY.md`, `TASKS_ARCHIVE.md`

## Adding a Task

Use [templates/task_template.md](templates/task_template.md). Every task must include:

- Stable task ID and title.
- Exact path scope.
- Relevant architecture IDs.
- Dependencies and open decisions.
- Concrete completion criteria.
- Verification commands/evidence.
- Documentation synchronization requirements.

Candidate work belongs in [TODO.md](TODO.md), not here.
