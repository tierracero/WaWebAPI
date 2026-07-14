# Source Map

Targeted navigation guide for source-touching tasks.

## Entry and Configuration

| Path | Purpose |
|---|---|
| `Package.swift` | Package platforms, products, dependencies, targets |
| `Sources/WaWebAPI/WaWebAPI.swift` | `WaWebAPI`, configuration storage, `Application`/`Request` extensions |
| `Sources/WaWebAPI/Endpoints/API.swift` | Profile-scoped facade and endpoint-family accessors |

## Shared Request Flow

| Path | Purpose |
|---|---|
| `Sources/WaWebAPI/Functions/post.swift` | URL/path composition, headers, HMAC, HTTP POST, decode/error flow |
| `Sources/WaWebAPI/Functions/getWaWebTokens.swift` | Actor cache and PostgreSQL token lookup |
| `Sources/WaWebAPI/Functions/getWaWebAccounts.swift` | Account lookup helper |

## Endpoint Families

Each family has a base class file plus operation extensions:

| Path | Family |
|---|---|
| `Sources/WaWebAPI/Endpoints/AuthEndpoint/` | Auth |
| `Sources/WaWebAPI/Endpoints/CallEndpoint/` | Calls |
| `Sources/WaWebAPI/Endpoints/ChatEndpoint/` | Chats |
| `Sources/WaWebAPI/Endpoints/ClientEndpoint/` | Client-wide operations |
| `Sources/WaWebAPI/Endpoints/ContactEndpoint/` | Contacts |
| `Sources/WaWebAPI/Endpoints/InstanceEndpoint/` | Instance lifecycle |
| `Sources/WaWebAPI/Endpoints/LabelEndpoint/` | Labels |
| `Sources/WaWebAPI/Endpoints/MessagesEndpoint/` | Messages |

## Persistence

| Path | Purpose |
|---|---|
| `Sources/WaWebAPI/Structures/WaWebAccounts.swift` | Account table and migration |
| `Sources/WaWebAPI/Structures/WaWebInstances.swift` | Instance table, migration, profile adapter |
| `Sources/WaWebAPI/Structures/WaWebTokens.swift` | Token table and migration |
| `Sources/WaWebAPI/Structures/WaWebWebhookEventControler.swift` | Webhook event table and migration |
| `Sources/WaWebAPI/Structures/APIResponse.swift` | Common response envelopes |
| `Sources/WaWebAPI/Enums/WaWebAccountRelation.swift` | Relation enum migration |
| `Sources/WaWebAPI/Enums/WaWebInstancesStatus.swift` | Instance-status enum migration |
| `Sources/WaWebAPI/Enums/WebhookEvents.swift` | Webhook-event enum migration |

## Tests

| Path | Purpose |
|---|---|
| `Tests/WaWebAPITests/WaWebAPITests.swift` | XCTest target; currently generated placeholder |

## Files Outside Agent Scope by Default

- `.git/**`
- `.swiftpm/**`
- `.build/**`
- `xcuserdata/**`
- `.DS_Store`
- `Package.resolved`, unless dependency resolution is explicitly in scope

## Before Editing

1. Read the owning architecture chunk.
2. Read the target operation plus its endpoint base class.
3. For endpoint contracts, inspect WaWebAPICore.
4. For transport changes, inspect all active `post` overloads.
5. For persistence changes, inspect the model, migration, enum migration, and every query that decodes it.
