# Modules

Repository module map.

## Swift Package Targets

| Target | Path | Responsibility |
|---|---|---|
| `WaWebAPI` | `Sources/WaWebAPI/` | Public library, endpoint adapters, transport, persistence |
| `WaWebAPITests` | `Tests/WaWebAPITests/` | XCTest target; currently placeholder only |

## WaWebAPI Source Areas

| Area | Responsibility |
|---|---|
| `WaWebAPI.swift` | Vapor `Application`/`Request` entry points and configuration storage |
| `Endpoints/API.swift` | Profile-scoped endpoint facade |
| `Endpoints/AuthEndpoint/` | Authentication endpoint family |
| `Endpoints/CallEndpoint/` | Call operations |
| `Endpoints/ChatEndpoint/` | Chat state, messages, labels, mute/pin/archive operations |
| `Endpoints/ClientEndpoint/` | Client-wide account/contact/chat/group operations |
| `Endpoints/ContactEndpoint/` | Contact-specific operations |
| `Endpoints/InstanceEndpoint/` | Instance lifecycle operations |
| `Endpoints/LabelEndpoint/` | Label operations |
| `Endpoints/MessagesEndpoint/` | Message send/edit/reply/media/info/reaction operations |
| `Functions/post.swift` | Shared HTTP POST transport and decoding |
| `Functions/getWaWebTokens.swift` | Token cache and database token lookup |
| `Functions/getWaWebAccounts.swift` | Account lookup helpers |
| `Structures/` | Response envelopes, database tables, migrations |
| `Enums/` | Persisted enum migrations and enum extensions |

## Direct Dependency Roles

| Dependency | Role in this package |
|---|---|
| WaWebAPICore | Endpoint components, DTOs, route/domain contracts |
| TCFoundation / TCFundamentals | Shared Tierra Cero utilities and protocols |
| Vapor | Application, Request, HTTP client, Content, NIO futures |
| VaporBridges / PostgresBridge / Bridges | Database integration and migrations |
| SwifQL | Typed PostgreSQL query construction |

## Ownership Rule

Before adding a new source area, decide whether it belongs to:

- WaWebAPICore as a transport-independent contract.
- WaWebAPI as Vapor/PostgreSQL adaptation.
- Another package as shared infrastructure.

Do not solve unclear ownership by duplicating the type in multiple packages.
