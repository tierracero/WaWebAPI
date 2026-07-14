# Style Guidelines

Project-specific documentation and Swift conventions.

## Documentation

- Use concise Markdown and descriptive headings.
- Distinguish **Verified**, **Rule**, **Open**, **Candidate**, and **Resolved** statements.
- Link to the owning rule instead of duplicating it.
- Do not create empty placeholder documents.
- Update source maps and architecture indexes when files or ownership boundaries move.

## Swift Organization

- Use UpperCamelCase for types/protocols and lowerCamelCase for methods, properties, parameters, locals, and enum cases.
- Preserve existing public names for compatibility; introduce corrected aliases and deprecations rather than silent breaking renames.
- Keep each endpoint method in the matching endpoint-family folder.
- Prefer one focused endpoint operation per file, following the existing `Family+Operation.swift` convention.
- Keep Vapor `Content` conformances close to the adapter that needs them.
- Do not add duplicate imports.

## Endpoint Methods

- Document the HTTP operation, route, important parameters, and decoded result.
- Use request/response DTOs from WaWebAPICore.
- Delegate to centralized transport.
- Avoid redundant `do { return try ... } catch { throw error }` wrappers in new code.
- Do not add debug emoji banners or unconditional `print` statements.

## Transport and Errors

- Prefer small helpers for repeated route, header, encoding, and decoding logic.
- Never swallow encoding/cryptographic errors with empty `catch` blocks.
- Preserve underlying errors and add safe operation context.
- Redact secrets and private payloads.
- Do not decode solely from a response abstraction when status/body validation is required; keep behavior consistent across overloads.

## Async Code

- Compose `EventLoopFuture` values without blocking.
- Use the application's/EventLoopGroup's futures consistently.
- Keep actor and EventLoop boundaries explicit.
- Do not introduce global mutable state outside isolation.

## Persistence

- Keep migration columns ordered consistently with model properties when practical.
- Match nullability, defaults, enum types, and Swift property types.
- Give migrations clear names; correct obvious copy/paste names in a compatibility-safe migration change.
- Add comments only where they explain a non-obvious invariant or wire/schema requirement.

## Tests

- Name tests by behavior, such as `testSendTextUsesMessageRoute()`.
- Use Arrange–Act–Assert structure when it improves clarity.
- Keep fixtures minimal and synthetic.
- Never place real phone numbers, customer content, tokens, secrets, or production endpoints in fixtures unless explicitly redacted and safe.
