# Testing and Release Boundaries

Architecture rules for verification, isolation, dependencies, and compatibility checks.

## Verified Current Facts

- `WaWebAPITests` exists but contains only the generated placeholder test.
- The package uses private SSH dependencies tracking `main` branches.
- Runtime behavior can depend on PostgreSQL configuration, environment values, and a remote WaWeb service.

## Stable Rules

### TEST-001 — Focused Test Coverage

**Owner**: this document.

New or corrected behavior should add the smallest focused automated test that can verify it. Priority areas:

- Request payload encoding.
- Endpoint path selection.
- Response envelope decoding.
- Error redaction.
- Token-cache behavior and invalidation.
- Migration/model agreement.

When the current design prevents testing without live infrastructure, record that as a design limitation and avoid pretending a live manual call is sufficient regression coverage.

### TEST-002 — Production Isolation

**Owner**: this document.

Default tests must not require or mutate:

- Production PostgreSQL data.
- Production API tokens or secrets.
- Real customer WhatsApp accounts or instances.
- The production `waweb.tierracero.co` service.

Integration tests must use explicit opt-in configuration, isolated credentials, and disposable data.

### REL-001 — Consumer Compatibility

**Owner**: this document.

Before a release or dependency update:

- Build the package with available supported toolchains.
- Run the full test suite.
- Review all public API changes.
- Review payload, route, header, and schema compatibility.
- Record private dependency branches/commits used for validation.
- Verify that no secrets or generated user state are included.

## Standard Commands

```bash
swift package resolve
swift build
swift test
```

Use `swift package resolve` only when dependency resolution is intentionally in scope. SSH access to private repositories may be required.

## Open Decision

`DEC-TEST-001` tracks the transport/database seams needed for deterministic tests.
