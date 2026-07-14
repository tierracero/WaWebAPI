# Package and Public API Boundaries

Architecture rules for package identity, dependencies, configuration, and public compatibility.

## Verified Current Facts

- `Package.swift` declares one library target and one XCTest target.
- The target imports Vapor plus Tierra Cero and SwifQL ecosystem packages.
- `Application` and `Request` expose `wawebapi` computed properties.
- `WaWebAPI.profile(_:)` and `profile(token:profile:)` return a profile-scoped `API` facade.
- The package contains numerous public endpoint methods and persistence models.

## Stable Rules

### PKG-001 — Manifest Authority

**Owner**: this document.

`Package.swift` is authoritative for supported platforms, products, targets, and direct dependencies. Documentation must not claim platform or dependency support that the manifest does not declare.

Dependency edits must review:

- Minimum Swift tools compatibility.
- Private SSH dependency access.
- Branch-based dependency drift.
- Consumer platform compatibility.
- Whether `Package.resolved` should intentionally change despite being ignored.

### DEP-001 — Dependency Contract Ownership

**Owner**: this document.

WaWebAPICore owns shared endpoint component classes, request/response DTOs, route controller types, and WhatsApp domain models imported by WaWebAPI. Before adding a parallel type, inspect WaWebAPICore and extend or adapt the existing contract when appropriate.

TCFoundation, TCFundamentals, Bridges, PostgresBridge, VaporBridges, SwifQL, and Vapor remain authoritative for their own APIs and conventions.

### PUBLIC-001 — Public Compatibility

**Owner**: this document.

Every `public` symbol is compatibility-sensitive. A public rename or removal requires one of:

- A non-breaking overload or alias.
- A deprecation period with a replacement.
- An explicitly approved breaking release and migration instructions.

This includes currently misspelled API such as `API.instace`; do not silently correct it in place.

### CONFIG-001 — Configuration Authority

**Owner**: this document.

Runtime values such as API token source, base URL, API version, database selection, and webhook base URL must have one explicit source of truth. Do not add another environment key or hardcoded host without resolving how it relates to existing configuration.

## Open Decisions

- `DEC-CONFIG-001`: environment key mismatch and unused stored configuration.
- `DEC-TRANSPORT-001`: configurable service base URL/version.
- `DEC-PUBLIC-001`: migration path for `instace`.

See [../OPEN_DECISIONS.md](../OPEN_DECISIONS.md).
