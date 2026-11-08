# Active Tasks

This file contains approved, executable work only.

## Current State

### SWIFT6-SENDABILITY-001 — WaWebAPI concurrency and table-value boundaries

- Approved scope: local `WaWebAPI`/`WaWebAPICore` sources and manifests needed for the SkylineServer Swift 6 build. Keep request/response fields, table columns, schema names, query keys, cache keys, and cache lookup behavior unchanged.
- Architecture: WaWebAPI `DB-001`, `DB-002`, `CACHE-001`, `SEC-001`; WaWebAPICore `MODEL-004`, `DEP-003`.
- Plan: use local linked package sources and the local PostgresBridge/Bridges graph under `LIBS_DEVELOPMENT=1`; remove transport `Payloadable` from mutable table classes/protocols while keeping it on `*Item` values; make constant schema/config metadata immutable/sendable; isolate account/token cache maps in actors and cache/send `*Item` snapshots; build the server graph and address further compiler diagnostics without editing `.build/checkouts`.
- Completion: local package sources compile in the full SkylineServer graph; API and persisted data shapes stay the same; relevant docs/status/diffs reviewed; no commit.

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
