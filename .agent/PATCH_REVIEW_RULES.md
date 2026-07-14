# Patch Review Rules

Review policy for WaWebAPI changes.

## Severity

### Blocker

- Secret/token/private payload exposure.
- Breaking public API without approval or migration.
- Wrong route/authentication behavior likely to affect all calls.
- Blocking an EventLoop in request paths.
- Destructive or incompatible migration without deployment plan.

### High

- Migration/model type mismatch.
- HMAC computed from bytes that may differ from the transmitted body.
- Stale token cache can retain revoked credentials.
- Dependency-owned contract duplicated or diverged.
- Production system required for default tests.

### Medium

- Missing focused tests for behavior changes.
- Repeated transport logic or swallowed errors.
- Unclear public documentation or misleading error context.
- Naming/copy-paste defect that does not immediately break compatibility.

### Low

- Localized style, comment, or organization issue with no behavioral impact.

## Verdicts

- **Approved**: no unresolved blocker/high findings; verification is sufficient.
- **Approved with follow-up**: only bounded medium/low debt remains and is recorded.
- **Needs revision**: behavior, security, compatibility, or verification is incomplete.
- **Blocked**: required contract, credentials, dependency source, or environment is unavailable and correctness cannot be established.

## Evidence

A review should name:

- Files inspected.
- Architecture IDs implicated.
- Commands/tests run.
- Any environment limitation.
- Findings with severity and exact source location.
