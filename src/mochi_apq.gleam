//// Automatic Persisted Queries (APQ) for mochi GraphQL.
////
//// Reduces bandwidth by letting clients send a query hash instead of the
//// full query string. On cache miss the client resends the full query.
////
//// ## Usage
////
//// ```gleam
//// import mochi_apq
////
//// let store = mochi_apq.new()
////
//// // Register a query
//// let #(store, hash) = mochi_apq.register(store, "{ users { id name } }")
////
//// // Look up by hash
//// case mochi_apq.lookup(store, hash) {
////   Some(query) -> execute(query)
////   None -> Error("query not found")
//// }
//// ```

import gleam/option.{type Option}
import mochi_apq/persisted_queries.{type PersistedQueryStore}

pub fn new() -> PersistedQueryStore {
  persisted_queries.new()
}

pub fn register(
  store: PersistedQueryStore,
  query: String,
) -> #(PersistedQueryStore, String) {
  persisted_queries.register(store, query)
}

pub fn lookup(store: PersistedQueryStore, hash: String) -> Option(String) {
  persisted_queries.lookup(store, hash)
}

pub fn size(store: PersistedQueryStore) -> Int {
  persisted_queries.size(store)
}

pub fn hash_query(query: String) -> String {
  persisted_queries.hash_query(query)
}
