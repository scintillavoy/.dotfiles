# AGENTS.md

## Git workflow

Do not stage or unstage any changes unless explicitly instructed otherwise. Leave all modifications as unstaged changes.

## Parse, don't validate

Apply the ["Parse, don't validate"](https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/) pattern. Convert untrusted input into domain types at boundaries. Do not pass validated primitives downstream; parsing must yield a type that structurally guarantees its own invariants.

- **Parse at boundaries:** Parse requests, configuration, database values, and external responses before they enter business logic. Reject malformed inputs immediately with typed errors.
- **Use domain types:** Represent constrained values with dedicated types such as `EmailAddress`, `TicketTitle`, or `Age`, rather than raw strings or integers. Represent a closed set of states with an enum or discriminated union.
- **Make invalid construction impossible:** Keep unchecked constructors and internal representation private. Expose parsing or factory functions that return either a valid domain value or an explicit error.
- **Preserve parsed values:** Pass the parsed domain type onward. Do not fall back to raw primitives or duplicate validation checks downstream.
- **Enforce invariants at the right level:** A field type should enforce invariants local to that field. If an invariant spans multiple fields, enforce it in the constructor for the enclosing aggregate and prevent callers from bypassing that constructor.
- **Separate parsing from business rules:** Parsing proves structural validity. Dynamic rules (permissions, state, time) belong in distinct domain operations.

For example, prefer `TicketTitle.parse(raw) -> Result<TicketTitle, TicketTitleError>` over `validateTitle(raw) -> boolean`. Once a `TicketTitle` exists, the rest of the application should be able to rely on it being non-empty and within its allowed length.

## Rust-inspired engineering principles

Mirror Rust's safety, clarity, and explicit design philosophy, regardless of the target language.

- **Explicit errors over exceptions:** Represent expected failures with a typed `Result`-like return value and handle each outcome explicitly. Reserve exceptions for genuinely exceptional failures when the language or framework requires them.
- **Explicit optionality:** Do not use null, nil, or undefined as an undocumented sentinel. Make genuine absence explicit with `Option`, `Maybe`, or the language's equivalent, and keep required values non-optional after parsing.
- **Always-valid construction:** Instantiate domain objects atomically in a fully valid state. Avoid public setters and partially initialized domain objects. If complex, step-by-step assembly is necessary, use a temporary builder type that only yields a valid domain object (or a `Result`) upon final execution.
- **Intentional ownership:** Make ownership and mutation boundaries clear. Prefer immutable references or read-only views, avoid mutable aliasing, and copy or clone only when independent ownership is required.
- **Immutability by default:** Default to immutable variables and parameters. Isolate necessary mutation locally and prefer pure transformations.
- **Enums over primitives:** Use enums, sealed types, or discriminated unions instead of strings, integers, or flags to represent states.
- **Exhaustive handling:** Match every enum variant or result outcome explicitly. Avoid catch-all blocks that silently swallow future additions.
- **Narrow visibility:** Expose the minimal public API. Keep internal helpers and representations private to prevent bypasses or tight coupling.
