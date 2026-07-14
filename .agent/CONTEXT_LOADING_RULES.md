# Context Loading Rules

Progressive context strategy for WaWebAPI.

## Default Sequence

1. Read root [`AGENTS.md`](../AGENTS.md).
2. Select a skill from [SKILL_INDEX.md](SKILL_INDEX.md).
3. Route architecture through [ARCH_INDEX.md](ARCH_INDEX.md).
4. Load one primary architecture chunk.
5. Load at most two supporting chunks when required.
6. Read [SOURCE_MAP.md](SOURCE_MAP.md).
7. Read only the target source files.
8. Inspect dependency source only when the task crosses a dependency contract.

## Endpoint Change Context

Load:

- `architecture/ENDPOINT_AND_TRANSPORT.md`
- Target endpoint base and operation files
- Shared transport only when shared behavior is implicated
- Matching WaWebAPICore request/response/route contract
- Focused tests

## Persistence Change Context

Load:

- `architecture/PERSISTENCE_AND_SECURITY.md`
- Model and migration file
- Related enum migration
- Queries and projections decoding the type
- Migration tests or verification harness

## Public API or Dependency Change Context

Load:

- `architecture/PACKAGE_AND_PUBLIC_API.md`
- `Package.swift`
- Public declarations affected
- Relevant consumer/dependency contract
- `architecture/TESTING_AND_RELEASES.md`

## Avoid

- Bulk-reading every endpoint file for a single endpoint task.
- Loading all dependency repositories by default.
- Treating old commented code as active architecture.
- Re-reading files already loaded unless they changed.
