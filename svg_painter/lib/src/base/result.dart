import 'package:meta/meta.dart';

/// A discriminated union that represents either a success or a failure.
sealed class Result<T> {
  const Result();

  /// Maps the success value using [transform], returning a new [Result].
  ///
  /// If this [Result] is a [Failure], the failure is propagated.
  R fold<R>(R Function(Failure<T> failure) onFailure, R Function(T value) onSuccess);

  /// Maps the success value to a new [Result] using [transform].
  ///
  /// If this [Result] is a [Failure], the failure is propagated.
  Result<R> map<R>(R Function(T value) transform) {
    return fold(
      (Failure<T> failure) => Failure<R>(failure.message), // Propagate failure
      (T value) => Success<R>(transform(value)),
    );
  }

  /// Maps the success value to a new [Result] using an asynchronous [transform].
  ///
  /// If this [Result] is a [Failure], the failure is propagated.
  Future<Result<R>> mapAsync<R>(Future<R> Function(T value) transform) async {
    return fold(
      (Failure<T> failure) =>
          Future<Result<R>>.value(Failure<R>(failure.message)), // Propagate failure with Future
      (T value) async => Success<R>(await transform(value)),
    );
  }

  /// Transforms the success value into a new [Result], potentially changing its type.
  ///
  /// This is useful for chaining operations that might also fail.
  /// If this [Result] is a [Failure], the failure is propagated.
  Result<R> flatMap<R>(Result<R> Function(T value) transform) {
    return fold(
      (Failure<T> failure) => Failure<R>(failure.message), // Propagate failure
      (T value) => transform(value),
    );
  }

  /// Transforms the success value into a new [Result], potentially changing its type, asynchronously.
  ///
  /// This is useful for chaining asynchronous operations that might also fail.
  /// If this [Result] is a [Failure], the failure is propagated.
  Future<Result<R>> flatMapAsync<R>(Future<Result<R>> Function(T value) transform) async {
    return fold(
      (Failure<T> failure) =>
          Future<Result<R>>.value(Failure<R>(failure.message)), // Propagate failure with Future
      (T value) => transform(value),
    );
  }
}

/// Represents a successful outcome with a [value].
@immutable
final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;

  @override
  R fold<R>(R Function(Failure<T> failure) onFailure, R Function(T value) onSuccess) {
    return onSuccess(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Success<T> && runtimeType == other.runtimeType && value == other.value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Success($value)';
}

/// Represents a failed outcome with a [message] explaining the error.
@immutable
final class Failure<T> extends Result<T> {
  const Failure(this.message);

  final String message;

  @override
  R fold<R>(R Function(Failure<T> failure) onFailure, R Function(T value) onSuccess) {
    return onFailure(this);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Failure<T> && runtimeType == other.runtimeType && message == other.message);

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'Failure($message)';
}

/// Extensions for aggregating [Result]s.
extension ResultListExtension<T> on Iterable<Result<List<T>>> {
  /// Combines an iterable of `Result<List<T>>` into a single `Result<List<T>>`.
  ///
  /// If any [Result] is a [Failure], the first [Failure] is returned.
  Result<List<T>> combine() {
    final List<T> combined = <T>[];
    for (final Result<List<T>> result in this) {
      if (result is Failure<List<T>>) {
        return Failure<List<T>>(result.message);
      }
      combined.addAll((result as Success<List<T>>).value);
    }
    return Success<List<T>>(combined);
  }
}

/// Extensions for aggregating single [Result]s into lists.
extension ResultIterableExtension<T> on Iterable<Result<T>> {
  /// Combines an iterable of `Result<T>` into a `Result<List<T>>`.
  ///
  /// If any [Result] is a [Failure], the first [Failure] is returned.
  Result<List<T>> combine() {
    final List<T> combined = <T>[];
    for (final Result<T> result in this) {
      if (result is Failure<T>) {
        return Failure<List<T>>(result.message);
      }
      combined.add((result as Success<T>).value);
    }
    return Success<List<T>>(combined);
  }
}
