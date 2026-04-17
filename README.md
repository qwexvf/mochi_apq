> **Active development** — breaking changes may be pushed to `main` at any time.


# mochi_apq

Automatic Persisted Queries (APQ) for mochi GraphQL.

Reduces bandwidth by sending a SHA-256 hash of the query instead of the full query string. On cache miss the client retries with the full query to prime the cache.

## Installation

```toml
# gleam.toml
[dependencies]
mochi_apq = { git = "https://github.com/qwexvf/mochi_apq", ref = "main" }
```

## Usage

```gleam
import mochi_apq/persisted_queries

let cache = persisted_queries.new()

persisted_queries.get(cache, hash)
persisted_queries.store(cache, hash, query)
```

## License

Apache-2.0

---
Built with the help of [Claude Code](https://claude.ai/code).