import 'package:svg_painter/src/base/result.dart';
import 'package:test/test.dart';

void main() {
  group('Result', () {
    group('Success', () {
      test('fold should call onSuccess with value', () {
        // Arrange
        const Success<int> success = Success<int>(42);

        // Act
        final String result = success.fold(
          (Failure<int> f) => 'failure',
          (int v) => 'success $v',
        );

        // Assert
        expect(result, 'success 42');
      });

      test('equality and hashCode should work correctly', () {
        // Arrange
        const Success<int> s1 = Success<int>(1);
        const Success<int> s2 = Success<int>(1);
        const Success<int> s3 = Success<int>(2);

        // Act & Assert
        expect(s1, equals(s2));
        expect(s1.hashCode, equals(s2.hashCode));
        expect(s1, isNot(equals(s3)));
      });

      test('toString should return correct string', () {
        // Arrange
        const Success<int> success = Success<int>(42);

        // Act & Assert
        expect(success.toString(), 'Success(42)');
      });
    });

    group('Failure', () {
      test('fold should call onFailure with failure', () {
        // Arrange
        const Failure<int> failure = Failure<int>('error');

        // Act
        final String result = failure.fold(
          (Failure<int> f) => 'failure ${f.message}',
          (int v) => 'success',
        );

        // Assert
        expect(result, 'failure error');
      });

      test('equality and hashCode should work correctly', () {
        // Arrange
        const Failure<int> f1 = Failure<int>('err');
        const Failure<int> f2 = Failure<int>('err');
        const Failure<int> f3 = Failure<int>('other');

        // Act & Assert
        expect(f1, equals(f2));
        expect(f1.hashCode, equals(f2.hashCode));
        expect(f1, isNot(equals(f3)));
      });

      test('toString should return correct string', () {
        // Arrange
        const Failure<int> failure = Failure<int>('error');

        // Act & Assert
        expect(failure.toString(), 'Failure(error)');
      });
    });

    group('map', () {
      test('should transform value when Success', () {
        // Arrange
        const Result<int> result = Success<int>(10);

        // Act
        final Result<String> mapped = result.map((int v) => 'val: $v');

        // Assert
        expect(mapped, isA<Success<String>>());
        expect((mapped as Success<String>).value, 'val: 10');
      });

      test('should propagate failure when Failure', () {
        // Arrange
        const Result<int> result = Failure<int>('error');

        // Act
        final Result<String> mapped = result.map((int v) => 'val: $v');

        // Assert
        expect(mapped, isA<Failure<String>>());
        expect((mapped as Failure<String>).message, 'error');
      });
    });

    group('mapAsync', () {
      test('should transform value asynchronously when Success', () async {
        // Arrange
        const Result<int> result = Success<int>(10);

        // Act
        final Result<String> mapped = await result.mapAsync(
          (int v) async => Future<String>.value('val: $v'),
        );

        // Assert
        expect(mapped, isA<Success<String>>());
        expect((mapped as Success<String>).value, 'val: 10');
      });

      test('should propagate failure asynchronously when Failure', () async {
        // Arrange
        const Result<int> result = Failure<int>('error');

        // Act
        final Result<String> mapped = await result.mapAsync(
          (int v) async => Future<String>.value('val: $v'),
        );

        // Assert
        expect(mapped, isA<Failure<String>>());
        expect((mapped as Failure<String>).message, 'error');
      });
    });

    group('flatMap', () {
      test('should return transformed result when Success', () {
        // Arrange
        const Result<int> result = Success<int>(10);

        // Act
        final Result<String> mapped = result.flatMap((int v) => Success<String>('val: $v'));

        // Assert
        expect(mapped, isA<Success<String>>());
        expect((mapped as Success<String>).value, 'val: 10');
      });

      test('should return failure from transform when Success', () {
        // Arrange
        const Result<int> result = Success<int>(10);

        // Act
        final Result<String> mapped = result.flatMap((int v) => const Failure<String>('fail'));

        // Assert
        expect(mapped, isA<Failure<String>>());
        expect((mapped as Failure<String>).message, 'fail');
      });

      test('should propagate initial failure when Failure', () {
        // Arrange
        const Result<int> result = Failure<int>('initial error');

        // Act
        final Result<String> mapped = result.flatMap((int v) => Success<String>('val: $v'));

        // Assert
        expect(mapped, isA<Failure<String>>());
        expect((mapped as Failure<String>).message, 'initial error');
      });
    });

    group('flatMapAsync', () {
      test('should return transformed result asynchronously when Success', () async {
        // Arrange
        const Result<int> result = Success<int>(10);

        // Act
        final Result<String> mapped = await result.flatMapAsync(
          (int v) async => Future<Result<String>>.value(Success<String>('val: $v')),
        );

        // Assert
        expect(mapped, isA<Success<String>>());
        expect((mapped as Success<String>).value, 'val: 10');
      });

      test('should return failure from transform asynchronously when Success', () async {
        // Arrange
        const Result<int> result = Success<int>(10);

        // Act
        final Result<String> mapped = await result.flatMapAsync(
          (int v) async => Future<Result<String>>.value(const Failure<String>('fail')),
        );

        // Assert
        expect(mapped, isA<Failure<String>>());
        expect((mapped as Failure<String>).message, 'fail');
      });

      test('should propagate initial failure asynchronously when Failure', () async {
        // Arrange
        const Result<int> result = Failure<int>('initial error');

        // Act
        final Result<String> mapped = await result.flatMapAsync(
          (int v) async => Future<Result<String>>.value(Success<String>('val: $v')),
        );

        // Assert
        expect(mapped, isA<Failure<String>>());
        expect((mapped as Failure<String>).message, 'initial error');
      });
    });

    group('ResultListExtension.combine', () {
      test('should combine list of lists when all are Success', () {
        // Arrange
        final List<Result<List<int>>> list = <Result<List<int>>>[
          const Success<List<int>>(<int>[1, 2]),
          const Success<List<int>>(<int>[3, 4]),
        ];

        // Act
        final Result<List<int>> combined = list.combine();

        // Assert
        expect(combined, isA<Success<List<int>>>());
        expect((combined as Success<List<int>>).value, <int>[1, 2, 3, 4]);
      });

      test('should return first Failure when one fails', () {
        // Arrange
        final List<Result<List<int>>> list = <Result<List<int>>>[
          const Success<List<int>>(<int>[1, 2]),
          const Failure<List<int>>('error'),
          const Success<List<int>>(<int>[3, 4]),
        ];

        // Act
        final Result<List<int>> combined = list.combine();

        // Assert
        expect(combined, isA<Failure<List<int>>>());
        expect((combined as Failure<List<int>>).message, 'error');
      });
    });

    group('ResultIterableExtension.combine', () {
      test('should combine list of values when all are Success', () {
        // Arrange
        final List<Result<int>> list = <Result<int>>[
          const Success<int>(1),
          const Success<int>(2),
        ];

        // Act
        final Result<List<int>> combined = list.combine();

        // Assert
        expect(combined, isA<Success<List<int>>>());
        expect((combined as Success<List<int>>).value, <int>[1, 2]);
      });

      test('should return first Failure when one fails', () {
        // Arrange
        final List<Result<int>> list = <Result<int>>[
          const Success<int>(1),
          const Failure<int>('error'),
          const Success<int>(2),
        ];

        // Act
        final Result<List<int>> combined = list.combine();

        // Assert
        expect(combined, isA<Failure<List<int>>>());
        expect((combined as Failure<List<int>>).message, 'error');
      });
    });
  });
}
