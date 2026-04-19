import 'package:build/build.dart';
import 'package:mockito/annotations.dart';
import 'package:svg_painter/src/generation/image_preloader.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

@GenerateNiceMocks(<MockSpec<Object>>[
  MockSpec<BuildStep>(),
])
void main() {
  group('ImagePreloader', () {
    const preloader = ImagePreloader();

    group('collectImageHrefs', () {
      test('should collect hrefs from DrawImage commands', () {
        // Arrange
        final hrefs = <String>[];
        final commands = <PaintCommand>[
          const DrawImage(
            href: 'assets/img1.png',
            x: 0,
            y: 0,
            width: 10,
            height: 10,
            bytes: <int>[],
            style: PaintingStyle(),
            imageIndex: 0,
          ),
          const DrawGroup(commands: <PaintCommand>[
            DrawImage(
              href: 'assets/img2.png',
              x: 0,
              y: 0,
              width: 10,
              height: 10,
              bytes: <int>[],
              style: PaintingStyle(),
              imageIndex: 0,
            ),
          ]),
        ];

        // Act
        preloader.collectImageHrefs(commands, hrefs);

        // Assert
        expect(hrefs, contains('assets/img1.png'));
        expect(hrefs, contains('assets/img2.png'));
      });
    });

    group('populateImageIndices', () {
      test('should assign correct indices to DrawImage commands', () {
        // Arrange
        final uniqueHrefs = <String>['a.png', 'b.png'];
        final commands = <PaintCommand>[
          const DrawImage(
            href: 'b.png',
            x: 0,
            y: 0,
            width: 10,
            height: 10,
            bytes: <int>[],
            style: PaintingStyle(),
            imageIndex: 0,
          ),
        ];

        // Act
        preloader.populateImageIndices(commands, uniqueHrefs);

        // Assert
        final img = commands[0] as DrawImage;
        expect(img.imageIndex, equals(1));
      });
    });

    group('findBytesForHref', () {
      test('should return bytes for a given href', () {
        // Arrange
        final bytes = <int>[1, 2, 3];
        final commands = <PaintCommand>[
          DrawImage(
            href: 'test.png',
            x: 0,
            y: 0,
            width: 10,
            height: 10,
            bytes: bytes,
            style: const PaintingStyle(),
            imageIndex: 0,
          ),
        ];

        // Act
        final List<int>? result = preloader.findBytesForHref(commands, 'test.png');

        // Assert
        expect(result, equals(bytes));
      });
    });
  });
}
