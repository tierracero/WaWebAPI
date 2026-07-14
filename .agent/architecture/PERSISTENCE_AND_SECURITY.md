# Persistence and Security Boundaries

Architecture rules for database models, migrations, token caching, secrets, and HMAC behavior.

## Verified Current Facts

- Persistence uses Bridges/PostgresBridge/SwifQL.
- Models use the `wawebapi` schema.
- Table models and migration types currently share source files.
- Token lookup queries `WaWebTokens` by account/instance or token ID.
- An actor-backed in-process dictionary caches token records.
- Payload requests may include an `x-wawebapi-hmac` header generated with HMAC-SHA256 and the stored secret.

## Stable Rules

### DB-001 — Coordinated Schema Ownership

**Owner**: this document.

The package owns its `wawebapi` tables and enums through explicit migration types. A schema change must update all affected:

- Enum migration order.
- Table migration definition.
- Swift property wrapper/type.
- Initializers and projections.
- Queries and decoding.
- Revert behavior.
- Tests or migration verification.

### DB-002 — Migration/Model Type Agreement

**Owner**: this document.

A column's migration type, nullability, default, enum type, and Swift property type must agree. Existing mismatches are debt to resolve deliberately, not patterns to copy.

### CACHE-001 — Cache Is an Optimization

**Owner**: this document.

PostgreSQL is the durable source of token records. The in-memory token cache:

- May avoid repeated reads.
- Must not authorize a token beyond its persisted validity.
- Requires an invalidation strategy when tokens rotate, expire, change instance scope, or are revoked.
- Must not expose mutable shared state outside its isolation boundary.

### SEC-001 — Secret and Payload Redaction

**Owner**: this document.

The following must never appear in logs, thrown error strings, tests, fixtures, docs, or commits:

- API/auth tokens.
- Instance secrets or webhook secrets.
- Raw HMAC keys.
- Full authentication headers.
- Private message/media payloads.
- Unredacted sensitive response bodies.

Use identifiers, operation names, byte counts, status codes, and redacted hashes only when necessary.

### SEC-002 — HMAC Byte Integrity

**Owner**: this document.

HMAC must be generated from the same encoded payload bytes sent over the wire. Avoid independently encoding a logically equivalent payload twice when encoder configuration could diverge. Any change to encoding strategy requires server compatibility verification.

## Open Decisions

- `DEC-SCHEMA-001`: instance status migration/model mismatch.
- `DEC-CACHE-001`: token-cache invalidation and Swift concurrency model.

See [../OPEN_DECISIONS.md](../OPEN_DECISIONS.md).
