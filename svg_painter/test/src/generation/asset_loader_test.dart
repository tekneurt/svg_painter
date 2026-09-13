import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/generation/asset_loader.dart';
import 'package:test/test.dart';

import 'asset_loader_test.mocks.dart';

@GenerateNiceMocks(<MockSpec<Object>>[
  MockSpec<ConstantReader>(),
  MockSpec<BuildStep>(),
  MockSpec<TypeChecker>(),
])
void main() {
  group('AssetLoader', () {
    late MockConstantReader mockAnnotation;
    late MockBuildStep mockBuildStep;
    late MockTypeChecker mockFileChecker;
    late MockTypeChecker mockCodeChecker;
    late AssetLoader loader;

    setUp(() {
      mockAnnotation = MockConstantReader();
      mockBuildStep = MockBuildStep();
      mockFileChecker = MockTypeChecker();
      mockCodeChecker = MockTypeChecker();
      loader = AssetLoader(fileChecker: mockFileChecker, codeChecker: mockCodeChecker);
    });

    group('loadSvgContent', () {
      test('should return Failure when annotation object has no type', () async {
        // Arrange
        final mockObject = _MockDartObject();
        when(mockAnnotation.objectValue).thenReturn(mockObject);

        // Act
        final Result<String> result = await loader.loadSvgContent(mockAnnotation, mockBuildStep);

        // Assert
        expect(result.fold((f) => true, (s) => false), isTrue);
        expect(result.fold((f) => f.message, (s) => ''), contains('Annotation object has no type'));
      });
    });

    group('loadFromFile', () {
      test('should return Failure when path does not start with package:', () async {
        // Arrange
        final pathReader = MockConstantReader();
        when(mockAnnotation.read('path')).thenReturn(pathReader);
        when(pathReader.stringValue).thenReturn('assets/test.svg');

        // Act
        final Result<String> result = await loader.loadFromFile(mockAnnotation, mockBuildStep);

        // Assert
        expect(result.fold((f) => true, (s) => false), isTrue);
        expect(
          result.fold((f) => f.message, (s) => ''),
          contains('Only package: URIs are supported'),
        );
      });
    });
  });
}

class _MockDartObject extends Mock implements DartObject {
  @override
  DartType? get type => null;
}
