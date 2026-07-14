# Persistence Migration Skill

Checklist for table, enum, migration, token, and cache work.

## Scope

- [ ] Identify every table, enum, query, initializer, projection, and response affected.
- [ ] Determine migration ordering and compatibility with existing data.
- [ ] Confirm whether the change requires a data backfill.

## Schema Agreement

- [ ] Column name matches `@Column` name.
- [ ] SQL type matches Swift type.
- [ ] Nullability matches optionality.
- [ ] Defaults are valid for decoded Swift values.
- [ ] Persisted enum migration matches the model enum.
- [ ] `prepare` and `revert` are deliberate and safe.

## Token and Cache Rules

- [ ] PostgreSQL remains durable authority.
- [ ] Cache key selection is unambiguous.
- [ ] Rotation/revocation/expiry invalidates stale cached values.
- [ ] Actor/global state is concurrency-safe.
- [ ] No secret-bearing query or record is printed.

## Verification

- [ ] Test clean migration.
- [ ] Test upgrade from the supported previous schema when applicable.
- [ ] Test decoding and representative queries.
- [ ] Test revert only when reversion is supported and safe.
- [ ] Run `swift test` and `swift build` when dependencies/configuration allow.

## Documentation

- [ ] Update persistence architecture and technical debt.
- [ ] Record irreversible or deployment-sequencing requirements.
