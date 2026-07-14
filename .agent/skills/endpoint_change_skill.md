# Endpoint Change Skill

Checklist for endpoint additions and corrections.

## Contract

- [ ] Identify the correct endpoint family.
- [ ] Inspect the matching WaWebAPICore component, request, response, and route contract.
- [ ] Confirm HTTP route spelling and API version against an authoritative server contract.
- [ ] Confirm whether the operation is public API and compatibility-sensitive.

## Implementation

- [ ] Add or edit the focused `Family+Operation.swift` file.
- [ ] Reuse dependency-owned DTOs.
- [ ] Add Vapor `Content` conformance only where required.
- [ ] Delegate authentication, URL construction, HMAC, sending, and decoding to shared transport.
- [ ] Avoid redundant do/catch rethrows and debug prints.
- [ ] Preserve `EventLoopFuture` failure semantics.

## Security

- [ ] No raw token, secret, HMAC key, message body, media, or sensitive response logging.
- [ ] Error details are useful and redacted.

## Verification

- [ ] Test payload encoding.
- [ ] Test selected route/path.
- [ ] Test response decoding and failure behavior.
- [ ] Run focused tests, then `swift test` when available.
- [ ] Review public API diff.

## Documentation

- [ ] Update SOURCE_MAP/MODULES only if structure changed.
- [ ] Update architecture/open decisions/debt when a boundary or known issue changed.
