# Contributing to Daphnia

## Development Principles

We adhere strictly to the following software engineering principles to maintain a high-quality, maintainable codebase:

1.  **SOLID**:
    *   **S**ingle Responsibility Principle: Each class or module should have one, and only one, reason to change.
    *   **O**pen/Closed Principle: Entities should be open for extension but closed for modification.
    *   **L**iskov Substitution Principle: Objects of a superclass shall be replaceable with objects of its subclasses without breaking the application.
    *   **I**nterface Segregation Principle: No client should be forced to depend on methods it does not use.
    *   **D**ependency Inversion Principle: Depend upon abstractions, [not] concretions.

2.  **DRY (Don't Repeat Yourself)**:
    *   Avoid duplication of knowledge or logic. abstract common functionality into reusable components.

3.  **YAGNI (You Aren't Gonna Need It)**:
    *   Do not add functionality until it is necessary. Focus on the current requirements (e.g., The Circle, then The Daphnia).

4.  **KISS (Keep It Simple, Stupid)**:
    *   Keep complexity to a minimum. Simple code is easier to read, understand, and maintain.

## Code Style & Standards

*   We follow the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).
*   We use the `analysis_options.yaml` from the official Flutter SDK (v3.38.5) with strict linting rules enabled.
*   All public APIs must be documented.

### Error Handling

*   **User-Friendly Errors**: When errors occur, the message must be clear to the developer using our package. It should answer:
    *   **What** went wrong?
    *   **Where** did it go wrong?
    *   **Why** did it go wrong?
    *   **How** can it be fixed? (Preferably with a suggestion).
*   **No Exceptions**: We avoid throwing exceptions for expected failure states. Instead, functions should return a result type indicating success or failure (similar to `Either<Left, Right>`).
    *   Since we aim for minimal dependencies, we will implement a lightweight `Result` type within our package rather than importing a heavy functional programming library.

### Null Safety

*   **Avoid the Bang Operator (`!`)**: The use of `!` to force non-nullability is strictly discouraged. It implies the developer is 100% sure a value is not null, which is often a source of runtime errors.
    *   **Exception**: It is only allowed in truly exceptional situations where the logic guarantees non-nullability but the type system cannot infer it. These cases must be documented with a comment explaining why it is safe.

### Pattern Matching

*   **Sealed Classes**: Use `sealed` classes for class hierarchies where the set of subclasses is known and fixed.
*   **Exhaustive Matching**: Always use exhaustive matching (e.g., `switch` expressions) when working with sealed classes to ensure all cases are handled.

### Function Parameters

*   **1 Parameter**: Positional is allowed.
*   **2 Parameters**:
    *   Positional is allowed **if and only if** the parameters are closely related (e.g., `from` and `to`, `x` and `y`).
    *   Otherwise, use named parameters.
*   **3 or More Parameters**: Must **always** use named parameters.

## Version Control

*   **FVM**: This project uses Flutter Version Management. Please use `fvm flutter` for all flutter commands.
    *   Flutter Version: 3.38.5
*   **Gitignore**: We use the official Flutter SDK `.gitignore`.