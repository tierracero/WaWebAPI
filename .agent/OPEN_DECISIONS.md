# Open Decisions

Unresolved architecture and compatibility questions. These entries are not approved implementation plans.

## DEC-CONFIG-001 — Configuration and Environment Key Authority

- **Status**: Open
- **Owner**: `PACKAGE_AND_PUBLIC_API.md`
- **Evidence**: `Configuration.environment` reads `WAAPI_TOKEN`, while `profile(_:)` reads `WAWEBAPI_TOKEN`; the stored configuration is not used by that profile path.
- **Question**: Which key and configuration flow are authoritative?
- **Constraints**: Preserve compatibility for existing deployments; never print the resolved token.

## DEC-TRANSPORT-001 — Configurable Base URL and API Version

- **Status**: Open
- **Owner**: `PACKAGE_AND_PUBLIC_API.md`, supported by `ENDPOINT_AND_TRANSPORT.md`
- **Evidence**: Transport and profile conversion contain hardcoded `waweb.tierracero.co` URLs.
- **Question**: Should host, API version, and webhook base be explicit configuration values?
- **Constraints**: Defaults may preserve current production behavior; test environments need isolation.

## DEC-PUBLIC-001 — Correcting `API.instace`

- **Status**: Open
- **Owner**: `PACKAGE_AND_PUBLIC_API.md`
- **Evidence**: The public facade exposes `instace` rather than `instance`.
- **Question**: Add `instance` and deprecate `instace`, or defer to a breaking release?
- **Constraints**: Do not silently remove the existing symbol.

## DEC-TEST-001 — Deterministic Transport and Database Test Seams

- **Status**: Open
- **Owner**: `TESTING_AND_RELEASES.md`
- **Evidence**: Current tests are placeholders and request flow directly uses `Application.client` plus configured PostgreSQL.
- **Question**: Which injectable protocols/clients should enable route, encoding, token, and decoding tests without production infrastructure?
- **Constraints**: Avoid excessive abstraction; preserve Vapor integration.

## DEC-SCHEMA-001 — WaWebInstances Status Type

- **Status**: Open
- **Owner**: `PERSISTENCE_AND_SECURITY.md`
- **Evidence**: `CreateWaWebInstances` defines the `status` column from `BasicStatus`, while `WaWebInstances.status` is `WaWebInstancesStatus`.
- **Question**: Which persisted enum is authoritative, and what migration is required for existing data?
- **Constraints**: Verify deployed schema/data before changing the migration.

## DEC-CACHE-001 — Token Cache Invalidation and Isolation

- **Status**: Open
- **Owner**: `PERSISTENCE_AND_SECURITY.md`
- **Evidence**: Token records are cached indefinitely by instance/token key; singleton backing storage is declared outside actor isolation.
- **Question**: How are rotation, revocation, expiry, and Swift 6 concurrency requirements handled?
- **Constraints**: PostgreSQL remains authority; request latency should remain reasonable.

## Resolution Rules

When resolving an entry:

1. Record the decision, rationale, compatibility impact, and date.
2. Update the owning architecture chunk.
3. Add an approved task if implementation is required.
4. Keep this file as the decision index; create a separate ADR only when detailed alternatives/consequences justify it.
