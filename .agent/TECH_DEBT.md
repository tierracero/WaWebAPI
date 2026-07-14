# Technical Debt

Verified stable debt in the current codebase. This file records facts; it does not authorize changes.

## Sensitive Unconditional Logging

- **Status**: Verified, high priority
- **Locations**: `WaWebAPI.swift`, `Functions/post.swift`, token/account query helpers
- **Evidence**: Current code prints environment token values, stored secrets, HMAC values, encoded payloads, response bodies, URLs, and SQL/debug banners.
- **Risk**: Credential disclosure, private-message leakage, log retention exposure.
- **Related rules**: `SEC-001`, `ERROR-001`

## Placeholder Test Suite

- **Status**: Verified
- **Location**: `Tests/WaWebAPITests/WaWebAPITests.swift`
- **Evidence**: Only generated XCTest comments; no assertions.
- **Risk**: Route, encoding, decoding, caching, and migration regressions lack automated detection.

## Configuration Key/Usage Inconsistency

- **Status**: Verified
- **Location**: `WaWebAPI.swift`
- **Evidence**: `WAAPI_TOKEN` and `WAWEBAPI_TOKEN` are both referenced; stored `Configuration` is bypassed by `profile(_:)`.
- **Related decision**: `DEC-CONFIG-001`

## Hardcoded Service and Webhook URLs

- **Status**: Verified
- **Locations**: `Functions/post.swift`, `Structures/WaWebInstances.swift`
- **Risk**: Difficult isolated testing, staging, migration, and regional/service-version changes.
- **Related decision**: `DEC-TRANSPORT-001`

## Duplicated Transport Logic

- **Status**: Verified
- **Location**: `Functions/post.swift`
- **Evidence**: Multiple overloads repeat endpoint-case path composition, header creation, URL creation, and decoding/error handling.
- **Risk**: Behavioral drift among payload/no-payload overloads.

## Swallowed and Redundant Error Handling

- **Status**: Verified
- **Locations**: `Functions/post.swift`, many endpoint methods
- **Evidence**: Empty `catch` blocks and `try?` suppress encoding errors; many methods catch only to rethrow unchanged.
- **Risk**: Lost diagnostics and unnecessary code.

## Obsolete Commented Transport Block

- **Status**: Verified
- **Location**: lower portion of `Functions/post.swift`
- **Evidence**: Large commented duplicate implementation remains in the production source file.
- **Risk**: Confusion about active behavior and maintenance overhead.

## Public Naming Defects

- **Status**: Verified
- **Examples**: `API.instace`; `Client+GetCommonGroups.swift` exposes `getChatsByLabelId`; copy/paste spelling such as `Groops`/`Controler` in file/type names.
- **Risk**: Consumer confusion; correction requires compatibility planning.
- **Related decision**: `DEC-PUBLIC-001`

## Instance Status Migration/Model Mismatch

- **Status**: Verified, requires deployed-schema investigation
- **Location**: `Structures/WaWebInstances.swift`
- **Evidence**: Migration uses `BasicStatus`; model property uses `WaWebInstancesStatus`.
- **Risk**: Migration/decoding inconsistency.
- **Related decision**: `DEC-SCHEMA-001`

## Token Cache Invalidation Gap

- **Status**: Verified design gap
- **Location**: `Functions/getWaWebTokens.swift`
- **Evidence**: Cached token records have no explicit expiry/rotation/revocation invalidation path.
- **Risk**: Stale authorization and evolving concurrency warnings.
- **Related decision**: `DEC-CACHE-001`

## Branch-Based Private Dependencies

- **Status**: Verified
- **Location**: `Package.swift`
- **Evidence**: Several private dependencies track `main` rather than a tagged/exact version.
- **Risk**: Non-reproducible dependency drift between resolves.
