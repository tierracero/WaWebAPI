# Architecture Index

Authoritative rule ownership and routing index.

## Rule Ownership

| ID | Owning chunk | Summary |
|---|---|---|
| `PKG-001` | [PACKAGE_AND_PUBLIC_API](architecture/PACKAGE_AND_PUBLIC_API.md) | Package manifest is build/dependency authority |
| `DEP-001` | [PACKAGE_AND_PUBLIC_API](architecture/PACKAGE_AND_PUBLIC_API.md) | WaWebAPICore owns shared endpoint/domain contracts |
| `PUBLIC-001` | [PACKAGE_AND_PUBLIC_API](architecture/PACKAGE_AND_PUBLIC_API.md) | Public API changes require compatibility review |
| `CONFIG-001` | [PACKAGE_AND_PUBLIC_API](architecture/PACKAGE_AND_PUBLIC_API.md) | Runtime configuration has one explicit source of truth |
| `API-001` | [ENDPOINT_AND_TRANSPORT](architecture/ENDPOINT_AND_TRANSPORT.md) | Facade is profile-scoped |
| `API-002` | [ENDPOINT_AND_TRANSPORT](architecture/ENDPOINT_AND_TRANSPORT.md) | Endpoint families own endpoint-specific methods |
| `HTTP-001` | [ENDPOINT_AND_TRANSPORT](architecture/ENDPOINT_AND_TRANSPORT.md) | Shared HTTP behavior remains centralized |
| `HTTP-002` | [ENDPOINT_AND_TRANSPORT](architecture/ENDPOINT_AND_TRANSPORT.md) | EndpointControler and API version compose routes |
| `ASYNC-001` | [ENDPOINT_AND_TRANSPORT](architecture/ENDPOINT_AND_TRANSPORT.md) | EventLoops must not be blocked |
| `ERROR-001` | [ENDPOINT_AND_TRANSPORT](architecture/ENDPOINT_AND_TRANSPORT.md) | Errors retain useful redacted context |
| `DB-001` | [PERSISTENCE_AND_SECURITY](architecture/PERSISTENCE_AND_SECURITY.md) | `wawebapi` schema and migrations are coordinated |
| `DB-002` | [PERSISTENCE_AND_SECURITY](architecture/PERSISTENCE_AND_SECURITY.md) | Swift model and migration types must agree |
| `CACHE-001` | [PERSISTENCE_AND_SECURITY](architecture/PERSISTENCE_AND_SECURITY.md) | Token cache is non-authoritative optimization |
| `SEC-001` | [PERSISTENCE_AND_SECURITY](architecture/PERSISTENCE_AND_SECURITY.md) | Secrets and private payloads must not be logged |
| `SEC-002` | [PERSISTENCE_AND_SECURITY](architecture/PERSISTENCE_AND_SECURITY.md) | HMAC signs exact encoded payload bytes |
| `TEST-001` | [TESTING_AND_RELEASES](architecture/TESTING_AND_RELEASES.md) | New behavior requires focused tests when feasible |
| `TEST-002` | [TESTING_AND_RELEASES](architecture/TESTING_AND_RELEASES.md) | Default tests are isolated from production systems |
| `REL-001` | [TESTING_AND_RELEASES](architecture/TESTING_AND_RELEASES.md) | Build/release changes validate supported consumers |

## Task Routing

| Task type | Primary chunk | Supporting chunks |
|---|---|---|
| Package manifest or dependency change | PACKAGE_AND_PUBLIC_API | TESTING_AND_RELEASES |
| Public facade or accessor change | PACKAGE_AND_PUBLIC_API | ENDPOINT_AND_TRANSPORT |
| Add or modify an endpoint | ENDPOINT_AND_TRANSPORT | PACKAGE_AND_PUBLIC_API, TESTING_AND_RELEASES |
| Transport, headers, URL, decoding, or errors | ENDPOINT_AND_TRANSPORT | PERSISTENCE_AND_SECURITY, TESTING_AND_RELEASES |
| Token lookup or cache | PERSISTENCE_AND_SECURITY | ENDPOINT_AND_TRANSPORT |
| Table, enum, or migration change | PERSISTENCE_AND_SECURITY | TESTING_AND_RELEASES |
| Secret handling or logging | PERSISTENCE_AND_SECURITY | ENDPOINT_AND_TRANSPORT |
| Tests, CI, or release process | TESTING_AND_RELEASES | Relevant implementation chunk |

## Default Context Budget

Load one primary chunk and no more than two supporting chunks unless the task genuinely crosses more boundaries. See [CONTEXT_BUDGET.md](CONTEXT_BUDGET.md).
