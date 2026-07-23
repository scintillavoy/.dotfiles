# Agent instructions

## Maintainability

Ensure the codebase remains highly maintainable and friendly to human developers.

- **Design for human readers:** Except for strictly automated, machine-managed files (such as compiled build artifacts), all AI-generated files must be human-maintainable. It should always be immediately obvious what a file is for, where specific logic lives, and where a developer should look to make changes.
- **Write concise code:** Avoid typical AI verbosity, redundant helper functions, excessive nesting, or over-engineered abstractions. Prioritize simplicity, readability, and high information density. Keep code straightforward, lean, and easy for a human to audit.
- **Respect line limits:** Keep lines under 100 characters by default, wrapping lines that exceed this limit. Treat this as a flexible guideline rather than a rigid law; always prioritize consistency by aligning with the established formatting conventions of the existing codebase.

## Git workflow

Do not stage or unstage any changes unless explicitly instructed otherwise. Preserve the Git index exactly as you found it.

If you need to undo a previous modification, do so by editing the file rather than using Git. Any such undo must be reflected as an unstaged modification.

## Tool management

Tools are managed via `mise`. Discover installed tool paths and environment metadata using `mise ls --json`.

## Documentation

Write clean, high-impact documentation. Avoid typical AI verbosity, repetitive explanations, or filler text.

- **Write concisely:** Keep descriptions, comments, and documentation brief and to the point. Prioritize information density and readability over word count.
- **Link, don't duplicate:** Reference existing documentation, symbols, or files using links or cross-references instead of repeating explanations across multiple places. Maintain a single source of truth.
- **Use sentence-case for headings:** Default to sentence-like capitalization for all headings, titles, and section headers. Only capitalize the first word and proper nouns.
- **Format comments as sentences:** Write all comments—including doc comments, inline notes, and TODOs—as sentences. Capitalize the first word (unless it is a case-sensitive identifier) and end with a terminal punctuation mark (`.`, `?`, or `!`), even for sentence fragments.
- **One-sentence doc summaries:** Start every doc comment with a brief, user-centric summary (a sentence fragment is often sufficient) ending with a period to quickly orient the reader.
- **Separate summary paragraphs:** Place a blank line after that first summary sentence. Put any additional context or details in subsequent paragraphs.
- **Prefer code examples:** Consider including clear, practical code examples in documentation to demonstrate usage and resolve potential ambiguity.

## Parse, don't validate

Apply the ["Parse, don't validate"](https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/) pattern where structural integrity at boundaries is critical. **Treat this as a strong guiding principle rather than a rigid law.** Balance the guarantee of type safety against the practical overhead of boilerplate and development speed.

- **Parse at boundaries:** Parse requests, configuration, database values, and external responses before they enter business logic. Reject malformed inputs immediately with typed errors.
- **Use domain types:** Represent constrained values with dedicated types such as `EmailAddress`, `TicketTitle`, or `Age`, rather than raw strings or integers. Represent a closed set of states with an enum or discriminated union.
- **Make invalid construction impossible:** Keep unchecked constructors and internal representation private. Expose parsing or factory functions that return either a valid domain value or an explicit error.
- **Preserve parsed values:** Pass the parsed domain type onward. Do not fall back to raw primitives or duplicate validation checks downstream.
- **Enforce invariants at the right level:** A field type should enforce invariants local to that field. If an invariant spans multiple fields, enforce it in the constructor for the enclosing aggregate and prevent callers from bypassing that constructor.
- **Separate parsing from business rules:** Parsing proves structural validity. Dynamic rules (permissions, state, time) belong in distinct domain operations.

For example, prefer `TicketTitle.parse(raw) -> Result<TicketTitle, TicketTitleError>` over `validateTitle(raw) -> boolean`. Once a `TicketTitle` exists, the rest of the application should be able to rely on it being non-empty and within its allowed length.

## Rust-inspired engineering principles

Mirror Rust's safety, clarity, and explicit design philosophy to write robust, predictable code. **These are defaults to strive for, not dogmatic constraints.** Adapt these principles dynamically depending on the language's native idioms and the project's complexity.

- **Explicit errors over exceptions:** Represent expected failures with a typed `Result`-like return value and handle each outcome explicitly. Reserve exceptions for genuinely exceptional failures when the language or framework requires them.
- **Explicit optionality:** Do not use null, nil, or undefined as an undocumented sentinel. Make genuine absence explicit with `Option`, `Maybe`, or the language's equivalent, and keep required values non-optional after parsing.
- **Always-valid construction:** Instantiate domain objects atomically in a fully valid state. Avoid public setters and partially initialized domain objects. If complex, step-by-step assembly is necessary, use a temporary builder type that only yields a valid domain object (or a `Result`) upon final execution.
- **Intentional ownership:** Make ownership and mutation boundaries clear. Prefer immutable references or read-only views, avoid mutable aliasing, and copy or clone only when independent ownership is required.
- **Immutability by default:** Default to immutable variables and parameters. Isolate necessary mutation locally and prefer pure transformations.
- **Enums over primitives:** Use enums, sealed types, or discriminated unions instead of strings, integers, or flags to represent states.
- **Exhaustive handling:** Match every enum variant or result outcome explicitly. Avoid catch-all blocks that silently swallow future additions.
- **Narrow visibility:** Expose the minimal public API. Keep internal helpers and representations private to prevent bypasses or tight coupling.
