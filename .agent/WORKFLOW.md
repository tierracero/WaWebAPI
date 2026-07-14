# Workflow

Mandatory workflow for WaWebAPI work.

## PLAN → IMPLEMENT → AUDIT

### 1. Plan

For non-trivial work, record:

- Goal and completion criteria.
- Approved files and directories.
- Relevant architecture IDs from [ARCH_INDEX.md](ARCH_INDEX.md).
- Public API, wire-contract, database, security, and compatibility risks.
- Focused verification commands.

If the task is active and approved, add it to [TASKS.md](TASKS.md).

### 2. Implement

- Read [SOURCE_MAP.md](SOURCE_MAP.md) and the owning source files.
- Follow the relevant skill from [SKILL_INDEX.md](SKILL_INDEX.md).
- Keep endpoint-specific behavior separate from shared transport.
- Reuse WaWebAPICore contracts instead of creating parallel DTOs.
- Stop and revise the plan when a material assumption is disproved.

### 3. Audit

- Review the complete diff.
- Confirm no secret-bearing diagnostics were added.
- Run the smallest relevant verification, then broader checks when available.
- Confirm only approved files changed.
- Synchronize architecture, source maps, memory, open decisions, and debt records when affected.
- Move completed tracked work to [TASKS_ARCHIVE.md](TASKS_ARCHIVE.md).

## Verification Order

Use the smallest meaningful check first:

1. Targeted source review or focused test.
2. `swift test --filter <TestName>` when a focused test exists.
3. `swift test`.
4. `swift build` in the required configuration.

Do not use live production credentials or production WhatsApp instances for default tests.

## Documentation-Only Changes

Documentation-only changes may skip a formal task entry when they do not alter architecture or runtime behavior, but they still require:

- Link and consistency review.
- Git scope review.
- A clear statement that runtime tests were not required or not available.
