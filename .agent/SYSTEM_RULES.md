# System Rules

Global invariants for WaWebAPI development.

## Verified Facts Only

- Stable documents describe current code or explicitly approved boundaries.
- Planned work is labeled **Planned**, **Candidate**, or **Open**.
- Unresolved design questions belong in [OPEN_DECISIONS.md](OPEN_DECISIONS.md).
- Transient logs, command output, and debugging notes are not stable architecture authority.

## One Authority Per Concern

- Each architecture rule has one owning document and one rule ID.
- Indexes summarize and link; they do not redefine rules.
- Dependency-owned contracts remain authoritative in their dependency repositories.

## Public Library Discipline

- Treat every `public` declaration as a compatibility surface.
- Do not silently rename, remove, narrow, or behaviorally repurpose public API.
- Breaking changes require explicit approval and a migration strategy.

## Transport and Authentication Discipline

- HTTP request construction, route composition, token headers, HMAC generation, response decoding, and transport errors must remain centralized.
- Endpoint methods describe endpoint-specific payloads and response types; they must not reimplement authentication or transport behavior.
- Tokens and secrets must be resolved through the approved token boundary.

## Security Invariants

- Never log raw tokens, secrets, HMAC keys, authorization headers, complete private message payloads, media content, or unredacted sensitive responses.
- Do not place production secrets in tests, fixtures, documentation, source code, or commits.
- Error context must be useful but redacted.

## Async and EventLoop Invariants

- Do not block Vapor/NIO EventLoops.
- Preserve EventLoop ownership when composing futures.
- Use async bridges deliberately; avoid detached work that loses request/application lifecycle context.
- Shared caches are optimizations, not authoritative persistence.

## Persistence Invariants

- Database models, migrations, enum migrations, and decoded Swift types must agree.
- Schema changes require forward and revert behavior plus migration-order review.
- The `wawebapi` schema is the current persistence namespace.

## Scope Discipline

- Modify only approved task-scope paths.
- Preserve unrelated staged, unstaged, and untracked work.
- Prefer focused patches over speculative rewrites.
