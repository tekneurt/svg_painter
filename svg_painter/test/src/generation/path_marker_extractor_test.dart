import 'dart:math' as math;

import 'package:svg_painter/src/generation/path_marker_extractor.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:test/test.dart';

void main() {
  group('PathMarkerExtractor', () {
    group('extractFromLine', () {
      test('should extract start and end vertices with correct angle for horizontal line', () {
        // Arrange
        const x1 = 10.0;
        const y1 = 20.0;
        const x2 = 50.0;
        const y2 = 20.0;

        // Act
        final List<MarkerVertex> vertices = PathMarkerExtractor.extractFromLine(x1, y1, x2, y2);

        // Assert
        expect(vertices, hasLength(2));
        expect(vertices[0].x, 10.0);
        expect(vertices[0].y, 20.0);
        expect(vertices[0].angle, 0.0);
        expect(vertices[0].isStart, isTrue);
        expect(vertices[0].isEnd, isFalse);

        expect(vertices[1].x, 50.0);
        expect(vertices[1].y, 20.0);
        expect(vertices[1].angle, 0.0);
        expect(vertices[1].isStart, isFalse);
        expect(vertices[1].isEnd, isTrue);
      });
    });

    group('extractFromPoints', () {
      test('should extract start, mid, and end vertices for polyline', () {
        // Arrange
        final points = <double>[10.0, 10.0, 10.0, 90.0, 90.0, 90.0];

        // Act
        final List<MarkerVertex> vertices = PathMarkerExtractor.extractFromPoints(points);

        // Assert
        expect(vertices, hasLength(3));

        // Start vertex
        expect(vertices[0].x, 10.0);
        expect(vertices[0].y, 10.0);
        expect(vertices[0].angle, math.pi / 2.0);
        expect(vertices[0].isStart, isTrue);
        expect(vertices[0].isEnd, isFalse);

        // Mid vertex (bisector of 90 deg down and 0 deg right)
        expect(vertices[1].x, 10.0);
        expect(vertices[1].y, 90.0);
        expect(vertices[1].angle, closeTo(math.pi / 4.0, 0.0001));
        expect(vertices[1].isStart, isFalse);
        expect(vertices[1].isEnd, isFalse);

        // End vertex
        expect(vertices[2].x, 90.0);
        expect(vertices[2].y, 90.0);
        expect(vertices[2].angle, 0.0);
        expect(vertices[2].isStart, isFalse);
        expect(vertices[2].isEnd, isTrue);
      });
    });

    group('extractFromOperations', () {
      test('should extract start, mid, and end vertices matching W3C painting-marker-01-f', () {
        // Arrange: d="M 130 40 L 180 40 L 180 90"
        const operations = <PathOperation>[
          MoveTo(130.0, 40.0),
          LineTo(180.0, 40.0),
          LineTo(180.0, 90.0),
        ];

        // Act
        final List<MarkerVertex> vertices = PathMarkerExtractor.extractFromOperations(operations);

        // Assert
        expect(vertices, hasLength(3));

        // Vertex 1: (130, 40), horizontal right (0 deg)
        expect(vertices[0].x, 130.0);
        expect(vertices[0].y, 40.0);
        expect(vertices[0].angle, 0.0);
        expect(vertices[0].isStart, isTrue);
        expect(vertices[0].isEnd, isFalse);

        // Vertex 2: (180, 40), corner 45 deg
        expect(vertices[1].x, 180.0);
        expect(vertices[1].y, 40.0);
        expect(vertices[1].angle, closeTo(math.pi / 4.0, 0.0001));
        expect(vertices[1].isStart, isFalse);
        expect(vertices[1].isEnd, isFalse);

        // Vertex 3: (180, 90), vertical down (90 deg)
        expect(vertices[2].x, 180.0);
        expect(vertices[2].y, 90.0);
        expect(vertices[2].angle, closeTo(math.pi / 2.0, 0.0001));
        expect(vertices[2].isStart, isFalse);
        expect(vertices[2].isEnd, isTrue);
      });

      test('should return empty list when operations list is empty or has fewer than 2 points', () {
        // Arrange
        const emptyOps = <PathOperation>[];
        const singleMove = <PathOperation>[MoveTo(10.0, 20.0)];

        // Act
        final List<MarkerVertex> emptyVertices = PathMarkerExtractor.extractFromOperations(emptyOps);
        final List<MarkerVertex> singleVertices = PathMarkerExtractor.extractFromOperations(
          singleMove,
        );

        // Assert
        expect(emptyVertices, isEmpty);
        expect(singleVertices, isEmpty);
      });

      test('should extract tangents for CubicTo, QuadraticTo, ArcTo, and ClosePath', () {
        // Arrange
        const operations = <PathOperation>[
          MoveTo(0.0, 0.0),
          CubicTo(10.0, 0.0, 20.0, 10.0, 30.0, 10.0),
          QuadraticTo(40.0, 10.0, 50.0, 20.0),
          ArcTo(10.0, 10.0, 0.0, false, true, 60.0, 30.0),
          ClosePath(),
        ];

        // Act
        final List<MarkerVertex> vertices = PathMarkerExtractor.extractFromOperations(operations);

        // Assert
        expect(vertices, hasLength(5));
        expect(vertices.first.isStart, isTrue);
        expect(vertices.first.angle, 0.0);
        expect(vertices.last.isEnd, isTrue);
        expect(vertices.last.x, 0.0);
        expect(vertices.last.y, 0.0);
      });

      test('should fall back to secondary control points when CubicTo or QuadraticTo control points coincide', () {
        // Arrange
        const operations = <PathOperation>[
          MoveTo(0.0, 0.0),
          CubicTo(0.0, 0.0, 10.0, 0.0, 10.0, 0.0),
          CubicTo(10.0, 0.0, 10.0, 0.0, 20.0, 0.0),
          QuadraticTo(20.0, 0.0, 30.0, 0.0),
          QuadraticTo(35.0, 0.0, 35.0, 0.0),
        ];

        // Act
        final List<MarkerVertex> vertices = PathMarkerExtractor.extractFromOperations(operations);

        // Assert
        expect(vertices, hasLength(5));
        expect(vertices[0].angle, 0.0);
        expect(vertices[1].angle, 0.0);
        expect(vertices[4].angle, 0.0);
      });

      test('should rotate bisector by 90 degrees when incoming and outgoing segments reverse direction', () {
        // Arrange
        const operations = <PathOperation>[
          MoveTo(0.0, 0.0),
          LineTo(20.0, 0.0),
          LineTo(0.0, 0.0),
        ];

        // Act
        final List<MarkerVertex> vertices = PathMarkerExtractor.extractFromOperations(operations);

        // Assert
        expect(vertices, hasLength(3));
        expect(vertices[1].angle, closeTo(math.pi / 2.0, 0.0001));
      });
    });

    group('extractFromPoints edge cases', () {
      test('should return empty list when points length is less than 4', () {
        // Arrange
        final points = <double>[10.0, 20.0];

        // Act
        final List<MarkerVertex> vertices = PathMarkerExtractor.extractFromPoints(points);

        // Assert
        expect(vertices, isEmpty);
      });

      test('should compute bisector angles for start and end vertices when polygon is closed', () {
        // Arrange
        final points = <double>[0.0, 0.0, 10.0, 0.0, 0.0, 10.0];

        // Act
        final List<MarkerVertex> vertices = PathMarkerExtractor.extractFromPoints(
          points,
          isClosed: true,
        );

        // Assert
        expect(vertices, hasLength(3));
        expect(vertices[0].isStart, isTrue);
        expect(vertices[2].isEnd, isTrue);
        expect(vertices[0].angle, closeTo(-math.pi / 4.0, 0.0001));
      });
    });

    group('MarkerVertex', () {
      test('should return formatted string representation when toString is called', () {
        // Arrange
        const vertex = MarkerVertex(
          x: 12.0,
          y: 34.0,
          angle: 1.5,
          isStart: true,
          isEnd: false,
        );

        // Act
        final str = vertex.toString();

        // Assert
        expect(str, 'MarkerVertex((12.0, 34.0), angle: 1.5, isStart: true, isEnd: false)');
      });
    });
  });
}
