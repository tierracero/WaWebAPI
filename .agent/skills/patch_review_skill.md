# Patch Review Skill

Checklist for reviewing WaWebAPI changes.

## Scope and Git

- [ ] Baseline status was captured.
- [ ] Only approved paths changed.
- [ ] No generated/user-local files changed.
- [ ] No unrelated work was staged or overwritten.

## Contract and Compatibility

- [ ] Public API changes are intentional and migration-safe.
- [ ] WaWebAPICore ownership was respected.
- [ ] Routes, payloads, headers, and response decoding match the server contract.
- [ ] Database migration/model types agree.

## Security and Async

- [ ] No secrets or private payloads are logged or embedded.
- [ ] HMAC uses the exact transmitted bytes.
- [ ] EventLoops are not blocked.
- [ ] Cache/global state is concurrency-safe and non-authoritative.

## Quality and Verification

- [ ] No empty catches or redundant rethrow wrappers were introduced.
- [ ] Focused tests cover the changed behavior.
- [ ] Broader build/tests were run or limitations were reported exactly.
- [ ] Documentation is synchronized.

See [../PATCH_REVIEW_RULES.md](../PATCH_REVIEW_RULES.md) for review severity and verdict rules.
