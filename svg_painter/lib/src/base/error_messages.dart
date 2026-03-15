/// A collection of standardized error messages and conventions.
library;

/// Standardized prefix for error messages when an untreatable [Error] is caught in a defensive catch-all block.
///
/// **Convention**: Every defensive `catch (e)` block that handles untreatable Errors (where all
/// expected Exceptions are already caught explicitly) MUST:
/// 1. Use this prefix in the failure message.
/// 2. Include the exact comment: `// Defensive catch-all for untreatable Errors (all expected Exceptions are handled explicitly).`
/// Add `// coverage:ignore-line` to the return/throw statement.
const String untreatableErrorPrefix = 'An untreatable Error occurred';

/// Standardized prefix for warning messages when an unsupported SVG feature (e.g., unknown tag) is encountered.
const String unsupportedFeaturePrefix = 'Unsupported SVG feature encountered';
