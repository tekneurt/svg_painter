import 'dart:convert';

import 'package:build/build.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:svg_painter/src/generation/image_preloader.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

import 'image_preloader_test.mocks.dart';

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
          const DrawGroup(
            commands: <PaintCommand>[
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
            ],
          ),
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

    group('preloadImages', () {
      test('should load relative image href using fallback asset id', () async {
        // Arrange
        final buildStep = MockBuildStep();
        final imageCache = <String, List<int>>{};
        final svgCache = <String, SvgSvg>{};
        final expectedBytes = <int>[10, 20, 30];
        final XmlElement root =
            XmlDocument.parse('<svg><image xlink:href="../images/sign.png" /></svg>').rootElement;
        when(
          buildStep.readAsBytes(
            AssetId('svg_painter_fixtures', 'lib/assets/w3c/images/sign.png'),
          ),
        ).thenAnswer((_) async => expectedBytes);

        // Act
        await preloader.preloadImages(
          root,
          buildStep,
          imageCache,
          svgCache,
        );

        // Assert
        expect(imageCache['../images/sign.png'], equals(expectedBytes));
      });

      test('should skip images with null, empty, cached, or http/https hrefs', () async {
        // Arrange
        final buildStep = MockBuildStep();
        final imageCache = <String, List<int>>{'cached.png': <int>[1]};
        final svgCache = <String, SvgSvg>{'cached.svg': const SvgSvg(children: <SvgElement>[])};
        final XmlElement root = XmlDocument.parse(
          '<svg> '
          '<image /> '
          '<image href="" /> '
          '<image href="cached.png" /> '
          '<image href="cached.svg" /> '
          '<image href="https://example.com/a.png" /> '
          '</svg>',
        ).rootElement;

        // Act
        await preloader.preloadImages(root, buildStep, imageCache, svgCache);

        // Assert
        verifyNever(buildStep.readAsBytes(any));
        verifyNever(buildStep.readAsString(any));
      });

      test('should decode raster and nested SVG data URIs into caches', () async {
        // Arrange
        final buildStep = MockBuildStep();
        final imageCache = <String, List<int>>{};
        final svgCache = <String, SvgSvg>{};
        const pngData = 'data:image/png;base64,AQIDBA==';
        final String svgB64 = base64Encode(
          utf8.encode('<svg xmlns="http://www.w3.org/2000/svg" width="10" height="20"></svg>'),
        );
        final svgData = 'data:image/svg+xml;base64,$svgB64';
        final String noSvgB64 = base64Encode(utf8.encode('<rect />'));
        final noSvgTagData = 'data:image/svg+xml;base64,$noSvgB64';
        final String badXmlB64 = base64Encode(utf8.encode('<svg'));
        final badXmlData = 'data:image/svg+xml;base64,$badXmlB64';
        const badDataUri = 'data:image/png;base64,!!!invalid!!!';
        final XmlElement root = XmlDocument.parse(
          '<svg> '
          '<image href="$pngData" /> '
          '<image href="$svgData" /> '
          '<image href="$noSvgTagData" /> '
          '<image href="$badXmlData" /> '
          '<image href="$badDataUri" /> '
          '</svg>',
        ).rootElement;

        // Act
        await preloader.preloadImages(root, buildStep, imageCache, svgCache);

        // Assert
        expect(imageCache[pngData], <int>[1, 2, 3, 4]);
        expect(svgCache[svgData], isNotNull);
        expect((svgCache[svgData]?.width as SvgLength?)?.value, 10.0);
        expect(svgCache.containsKey(noSvgTagData), isFalse);
        expect(svgCache.containsKey(badXmlData), isFalse);
        expect(imageCache.containsKey(badDataUri), isFalse);
      });

      test('should load package raster and SVG assets and catch read failures', () async {
        // Arrange
        final buildStep = MockBuildStep();
        final imageCache = <String, List<int>>{};
        final svgCache = <String, SvgSvg>{};
        final XmlElement root = XmlDocument.parse(
          '<svg> '
          '<image href="package:my_pkg/assets/pic.png" /> '
          '<image href="package:my_pkg/assets/vec.svg" /> '
          '<image href="package:my_pkg/assets/fail.png" /> '
          '<image href="missing_rel.png" /> '
          '</svg>',
        ).rootElement;
        when(buildStep.readAsBytes(AssetId('my_pkg', 'lib/assets/pic.png')))
            .thenAnswer((_) async => <int>[7, 8, 9]);
        when(buildStep.readAsString(AssetId('my_pkg', 'lib/assets/vec.svg')))
            .thenAnswer((_) async => '<svg width="30" height="40"></svg>');
        when(buildStep.readAsBytes(AssetId('my_pkg', 'lib/assets/fail.png')))
            .thenThrow(Exception('missing package asset'));
        when(buildStep.readAsBytes(AssetId('svg_painter_fixtures', 'lib/assets/w3c/images/missing_rel.png')))
            .thenThrow(Exception('missing relative asset'));

        // Act
        await preloader.preloadImages(root, buildStep, imageCache, svgCache);

        // Assert
        expect(imageCache['package:my_pkg/assets/pic.png'], <int>[7, 8, 9]);
        expect((svgCache['package:my_pkg/assets/vec.svg']?.width as SvgLength?)?.value, 30.0);
        expect(imageCache.containsKey('package:my_pkg/assets/fail.png'), isFalse);
        expect(imageCache.containsKey('missing_rel.png'), isFalse);
      });
    });

    group('DrawSwitch & DrawGroup traversal', () {
      test('should collect hrefs, populate indices, and find bytes inside DrawGroup and DrawSwitch', () {
        // Arrange
        const imgInCase = DrawImage(
          href: 'case.png',
          x: 10.0,
          y: 20.0,
          width: 30.0,
          height: 40.0,
          bytes: <int>[11, 12],
          style: PaintingStyle(),
          imageIndex: 0,
        );
        const imgInFallback = DrawImage(
          href: 'fallback.png',
          x: 15.0,
          y: 25.0,
          width: 35.0,
          height: 45.0,
          bytes: <int>[21, 22],
          style: PaintingStyle(),
          imageIndex: 0,
        );
        final commands = <PaintCommand>[
          DrawGroup(
            commands: List<PaintCommand>.of(<PaintCommand>[
              DrawSwitch(
                cases: <SwitchCase>[
                  SwitchCase(
                    languages: const <String>['en'],
                    commands: List<PaintCommand>.of(<PaintCommand>[imgInCase]),
                  ),
                ],
                fallback: List<PaintCommand>.of(<PaintCommand>[imgInFallback]),
              ),
            ]),
          ),
        ];
        final hrefs = <String>[];

        // Act
        preloader.collectImageHrefs(commands, hrefs);
        preloader.populateImageIndices(commands, <String>['fallback.png', 'case.png']);
        final List<int>? foundCase = preloader.findBytesForHref(commands, 'case.png');
        final List<int>? foundFallback = preloader.findBytesForHref(commands, 'fallback.png');
        final List<int>? notFound = preloader.findBytesForHref(commands, 'none.png');

        // Assert
        expect(hrefs, <String>['case.png', 'fallback.png']);
        final group = commands.first as DrawGroup;
        final sw = group.commands.first as DrawSwitch;
        expect((sw.cases.first.commands.first as DrawImage).imageIndex, 1);
        expect((sw.fallback.first as DrawImage).imageIndex, 0);
        expect(foundCase, <int>[11, 12]);
        expect(foundFallback, <int>[21, 22]);
        expect(notFound, isNull);
      });
    });
  });
}
