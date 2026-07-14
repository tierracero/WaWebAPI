# Architecture Overview

WaWebAPI uses a layered adapter architecture:

```text
Consumer code
    ↓
Application/Request.wawebapi
    ↓
WaWebAPI.profile(...) → API
    ↓
Endpoint family classes and extension methods
    ↓
Central POST transport
    ↓
Token cache + PostgreSQL token lookup
    ↓
waweb.tierracero.co API
```

Persistence models and migrations form a parallel package responsibility and support token/account/instance management.

## Architecture Chunks

| Chunk | Scope |
|---|---|
| [architecture/PACKAGE_AND_PUBLIC_API.md](architecture/PACKAGE_AND_PUBLIC_API.md) | Package manifest, dependencies, facade, compatibility |
| [architecture/ENDPOINT_AND_TRANSPORT.md](architecture/ENDPOINT_AND_TRANSPORT.md) | Endpoint families, request flow, routing, async transport |
| [architecture/PERSISTENCE_AND_SECURITY.md](architecture/PERSISTENCE_AND_SECURITY.md) | Database models, migrations, token cache, secrets and HMAC |
| [architecture/TESTING_AND_RELEASES.md](architecture/TESTING_AND_RELEASES.md) | Verification, test isolation, dependency and release checks |

Use [ARCH_INDEX.md](ARCH_INDEX.md) for rule ownership and task routing.
