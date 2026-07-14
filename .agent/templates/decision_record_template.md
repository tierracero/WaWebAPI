# Decision Record Template

Create a separate ADR only when the compact entry in `OPEN_DECISIONS.md` is insufficient.

```markdown
# [DEC-ID] — [Title]

## Status

Resolved / Superseded

## Date

YYYY-MM-DD

## Owner

[Architecture chunk]

## Context

[Verified problem and constraints]

## Decision

[Chosen approach]

## Alternatives

### [Option]

- Benefits:
- Costs:

## Compatibility and Security Impact

[Public API, wire, schema, secrets, migration]

## Consequences

- [Resulting rule/work]

## Related Tasks

- [TASK-ID]
```

Update `OPEN_DECISIONS.md`, the owning architecture chunk, and any implementation task when an ADR is created.
