# Product Scope

Authoritative verified scope for WaWebAPI.

## Package Identity

- **Name**: `WaWebAPI`
- **Type**: Swift Package library
- **Swift tools version**: 5.7
- **Declared platforms**: macOS 11+, iOS 13+
- **Primary integration**: Vapor `Application` and `Request`
- **Current remote service base**: `https://waweb.tierracero.co/api/v1/`
- **Current database schema**: `wawebapi`

## Current Responsibilities

- Expose `Application.wawebapi` and `Request.wawebapi` entry points.
- Scope API calls to a `WaWebInstances` profile.
- Provide endpoint families for authentication, calls, chats, clients, contacts, instances, labels, and messages.
- Resolve WaWeb tokens from PostgreSQL with an in-process cache.
- Build authenticated POST requests, optionally signing payloads with HMAC-SHA256.
- Decode common `WAResponse` and `WAResponsePayload<T>` envelopes.
- Define Bridges/SwifQL persistence models and migrations for accounts, instances, tokens, webhook events, and related enums.

## Dependency Boundary

WaWebAPICore owns many endpoint component bases, request/response payloads, route controllers, and WhatsApp domain types. WaWebAPI adapts those contracts to Vapor transport and persistence; it must not become a competing source of truth for dependency-owned types.

## Current Non-Goals

- Reimplementing WhatsApp Web behavior in this package.
- Duplicating WaWebAPICore endpoint contracts.
- Providing a UI.
- Running a standalone executable or server target.
- Treating the in-memory token cache as durable authority.
- Using live production instances as the default test environment.

## Compatibility Position

This is a library consumed by other Swift code. Public declarations, serialized payloads, route strings, header names, schema names, and database columns are compatibility-sensitive even when no formal semantic-version policy is documented.

## Known Scope Questions

Configuration keys, host configurability, the misspelled public `instace` accessor, and several modernization choices remain unresolved. See [OPEN_DECISIONS.md](OPEN_DECISIONS.md).
