# Context Budget

Token-efficient working rules.

## Default Limits

| Category | Default |
|---|---|
| Architecture chunks | 1 primary + up to 2 supporting |
| Operational skills | 1 primary skill |
| Endpoint operation files | Target operation + base class |
| Dependency repositories | 0 unless contract verification is needed |
| Persistence files | Model/migration + directly related enum/query files |

## Escalate When

- A change modifies shared transport used by many endpoint families.
- A public API change requires consumer compatibility review.
- A schema change affects multiple tables/enums/queries.
- A dependency contract is unclear or appears inconsistent.
- Security or concurrency behavior crosses layers.

Record why broader context was required in the task audit.

## Stop Reading When

- The owning rule is identified.
- The exact implementation path is known.
- Dependency ownership is clear.
- Completion criteria and verification are concrete.
