# Reference Projects and Dependencies

Routing guidance for external code needed to understand WaWebAPI.

## WaWebAPICore — Primary Contract Reference

Repository declared by `Package.swift`:

```text
git@github.com:tierracero/WaWebAPICore.git
```

Inspect it before changing:

- Endpoint component base classes.
- `EndpointControler` routes.
- Request/response payloads.
- WhatsApp domain structures.
- Serialization expectations.

Do not duplicate these contracts in WaWebAPI merely to avoid a dependency change.

## Tierra Cero Shared Packages

- `TCFoundation` — shared foundations, errors, and utilities.
- `TCFundamentals` — shared protocols/domain utilities.

Verify behavior in the dependency source before assuming helper semantics.

## Persistence Stack

- `VaporBridges`
- `PostgresBridge`
- `SwifQL`

Use their current source/docs for migration builders, property wrappers, query operators, decoding, and EventLoop behavior.

## Vapor and SwiftNIO

Use official Vapor and SwiftNIO documentation/source for HTTP client, Content encoding, EventLoop, and future behavior. Avoid inventing framework conventions locally.

## Loading Rule

Inspect a dependency only when the task touches its contract. Prefer the exact resolved SwiftPM checkout or accessible repository version used by this package. Record any mismatch between the inspected revision and the package's resolved revision.
