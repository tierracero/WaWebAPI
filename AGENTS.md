# WaWebAPI — Agent Governance

## Repository Identity

WaWebAPI is a Swift Package that exposes a Vapor-integrated client for Tierra Cero's WaWeb API and persistence models for WaWeb accounts, instances, tokens, and webhook events.

The package manifest currently declares Swift tools 5.7, macOS 11+, and iOS 13+. The library depends on WaWebAPICore, TCFoundation, TCFundamentals, Vapor, VaporBridges, PostgresBridge, and SwifQL.

## Authority Hierarchy

1. [`.agent/SYSTEM_RULES.md`](.agent/SYSTEM_RULES.md) — global invariants
2. [`.agent/WORKFLOW.md`](.agent/WORKFLOW.md) — mandatory work sequence
3. [`.agent/COMMIT_RULES.md`](.agent/COMMIT_RULES.md) — repository safety
4. [`.agent/PRODUCT_SCOPE.md`](.agent/PRODUCT_SCOPE.md) — verified product and package scope
5. [`.agent/ARCH_INDEX.md`](.agent/ARCH_INDEX.md) — architecture rule ownership and routing
6. [`.agent/architecture/*.md`](.agent/architecture) — authoritative boundary rules
7. [`.agent/OPEN_DECISIONS.md`](.agent/OPEN_DECISIONS.md) — unresolved design questions
8. [`.agent/MODULES.md`](.agent/MODULES.md) and [`.agent/SOURCE_MAP.md`](.agent/SOURCE_MAP.md) — repository navigation
9. [`.agent/STYLE_GUIDELINES.md`](.agent/STYLE_GUIDELINES.md) — code and documentation conventions
10. [`.agent/SKILL_INDEX.md`](.agent/SKILL_INDEX.md) — task-specific operational checklists
11. [`.agent/TASKS.md`](.agent/TASKS.md) — active approved work only
12. [`.agent/TECH_DEBT.md`](.agent/TECH_DEBT.md) and [`.agent/TODO.md`](.agent/TODO.md) — verified debt and candidate work

## Mandatory Workflow

Use **PLAN → IMPLEMENT → AUDIT** for every non-trivial change.

- Define exact path scope before mutation.
- Read the owning architecture chunk and targeted source files.
- Preserve public API compatibility unless a breaking change is explicitly approved.
- Start verification with the smallest focused build or test.
- Update stable documentation when implementation facts or boundaries change.

## Context Loading

1. Read [`.agent/SKILL_INDEX.md`](.agent/SKILL_INDEX.md).
2. Route through [`.agent/ARCH_INDEX.md`](.agent/ARCH_INDEX.md).
3. Load one primary architecture chunk and at most two supporting chunks by default.
4. Read [`.agent/SOURCE_MAP.md`](.agent/SOURCE_MAP.md) before source changes.
5. Inspect WaWebAPICore before introducing or duplicating endpoint DTOs, component bases, or route definitions.

## Critical Safety Rules

- Never print, persist in artifacts, or expose API tokens, instance secrets, HMAC keys, authorization headers, or private message/media payloads.
- Do not bypass the centralized transport and token-resolution flow without an approved architecture change.
- Do not block an EventLoop with `.wait()` or synchronous network/database work.
- Never edit dependency-owned generated or user-local files.
- Never commit unless explicitly requested.

## Verification

No work is complete without concrete evidence. Prefer:

```bash
swift build
swift test
```

Private SSH dependencies and required environment/database configuration may prevent a clean build in an isolated environment. Report the exact limitation rather than claiming success.
