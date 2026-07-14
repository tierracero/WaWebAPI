# Endpoint and Transport Boundaries

Architecture rules for the public API facade, endpoint methods, routing, HTTP behavior, errors, and async execution.

## Verified Current Facts

- `API` stores a Vapor `Application`, a token string, and a `WaWebInstances` profile.
- Endpoint families are exposed as computed properties and implemented as WaWebAPICore component subclasses.
- Endpoint methods live in family-specific extension files and generally return `EventLoopFuture<WAResponse...>`.
- `Functions/post.swift` constructs URLs, headers, optional HMAC values, sends POST requests, and decodes responses.
- Token records are loaded before each transport operation through `getWaWebTokens`.

## Stable Rules

### API-001 — Profile-Scoped Facade

**Owner**: this document.

Endpoint execution is scoped to a `WaWebInstances` profile. The instance ID, owning account, token lookup, and secret selection must derive from that profile or an explicitly approved equivalent context.

### API-002 — Endpoint Family Ownership

**Owner**: this document.

Each endpoint family owns its endpoint-specific methods:

- `AuthEndpoint`
- `CallEndpoint`
- `ChatEndpoint`
- `ClientEndpoint`
- `ContactEndpoint`
- `InstanceEndpoint`
- `LabelEndpoint`
- `MessageEndpoint`

New methods belong in the matching folder and should use dependency-owned request/response contracts. Cross-family duplication requires review.

### HTTP-001 — Central Shared Transport

**Owner**: this document.

Shared behavior belongs in the transport layer, including:

- Base URL and API-version composition.
- Standard headers.
- Token resolution.
- HMAC creation.
- Request encoding.
- HTTP client invocation.
- Response envelope decoding.
- Common error translation and redaction.

Endpoint files must not independently reproduce these behaviors.

### HTTP-002 — Route Composition

**Owner**: this document.

Routes are composed from the API base/version and `EndpointControler` path/case data. Route changes are wire-contract changes and must be checked against WaWebAPICore and the server implementation or documentation.

### ASYNC-001 — EventLoop Safety

**Owner**: this document.

- Never call `.wait()` in library request paths.
- Do not perform blocking database, file, cryptographic, or network work on an EventLoop.
- Preserve futures and failures rather than converting them into hidden side effects.
- When bridging actors/async tasks to futures, retain clear lifecycle and EventLoop ownership.

### ERROR-001 — Redacted Diagnostic Context

**Owner**: this document.

Errors should identify the operation, URL path, status/decoding failure, and safe response metadata. They must not expose tokens, secrets, HMAC keys, private message bodies, media, or other sensitive payload data.

## Endpoint Implementation Pattern

For a new endpoint:

1. Confirm the request/response contract in WaWebAPICore.
2. Add `Content` conformance locally only when Vapor encoding requires it.
3. Add one focused public method in the correct endpoint family.
4. Call the centralized `api.post` transport.
5. Add focused encoding/route/decoding tests when a test seam exists.

See [../skills/endpoint_change_skill.md](../skills/endpoint_change_skill.md).
