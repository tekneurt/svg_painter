import 'dart:convert';

import 'package:build/build.dart';
import 'package:xml/xml.dart';

import '../base/result.dart';
import '../painting_model/paint_command.dart';
import '../svg_model/_svg_model.dart';
import '../xml_conversion/_xml_conversion.dart';
import '../xml_model/_xml_model.dart';

/// Helper class to preload images and handle image-related metadata.
class ImagePreloader {
  const ImagePreloader();

  /// Preloads images from the SVG document.
  Future<void> preloadImages(
    XmlElement root,
    BuildStep buildStep,
    Map<String, List<int>> imageCache,
    Map<String, SvgRoot> svgCache,
  ) async {
    final Iterable<XmlElement> images = root.findAllElements(XmlElementName.image.tagName);
    for (final image in images) {
      final String? href =
          image.getAttribute(XmlAttributeName.href.name) ?? image.getAttribute('xlink:href');
      if (href == null ||
          href.isEmpty ||
          imageCache.containsKey(href) ||
          svgCache.containsKey(href)) {
        continue;
      }

      if (href.startsWith('data:')) {
        try {
          final Uri uri = Uri.parse(href);
          final List<int> bytes = uri.data!.contentAsBytes();

          if (href.startsWith('data:image/svg+xml')) {
            final String svgContent = utf8.decode(bytes);
            svgContent.toXmlDocument().fold(
              (Failure<XmlDocument> failure) =>
                  log.warning('Failed to parse nested SVG Data URI: ${failure.message}'),
              (XmlDocument doc) {
                final Iterable<XmlElement> nestedSvgs =
                    doc.findAllElements(XmlElementName.svg.tagName);
                if (nestedSvgs.isNotEmpty) {
                  nestedSvgs.first.toSvgElement().fold(
                    (Failure<SvgElement> failure) =>
                        log.warning('Failed to map nested SVG Element: ${failure.message}'),
                    (SvgElement nestedSvg) {
                      if (nestedSvg is SvgRoot) {
                        svgCache[href] = nestedSvg;
                      } else {
                        log.warning(
                          'Mapped nested SVG is not SvgRoot, it is ${nestedSvg.runtimeType}',
                        );
                      }
                    },
                  );
                } else {
                  log.warning('Nested SVG document has no <svg> tag');
                }
              },
            );
          } else {
            imageCache[href] = bytes;
          }
        } catch (e) {
          log.warning('Failed to parse data URI image: $e');
        }
      } else if (href.startsWith('package:')) {
        final Uri uri = Uri.parse(href);
        final assetId = AssetId(
          uri.pathSegments.first,
          'lib/${uri.pathSegments.skip(1).join('/')}',
        );
        try {
          if (href.endsWith('.svg')) {
            final String svgContent = await buildStep.readAsString(assetId);
            svgContent.toXmlDocument().map((XmlDocument doc) {
              final Iterable<XmlElement> nestedSvgs =
                  doc.findAllElements(XmlElementName.svg.tagName);
              if (nestedSvgs.isNotEmpty) {
                nestedSvgs.first.toSvgRoot().map((SvgRoot nestedSvg) {
                  svgCache[href] = nestedSvg;
                });
              }
            });
          } else {
            final List<int> bytes = await buildStep.readAsBytes(assetId);
            imageCache[href] = bytes;
          }
        } catch (e) {
          log.warning('Failed to load image asset $href: $e');
        }
      }
    }
  }

  /// Collects image hrefs from painting commands.
  void collectImageHrefs(List<PaintCommand> commands, List<String> hrefs) {
    for (final command in commands) {
      if (command is DrawImage) {
        hrefs.add(command.href);
      }
      if (command is DrawGroup) {
        collectImageHrefs(command.commands, hrefs);
      }
    }
  }

  /// Populates image indices into [DrawImage] commands.
  void populateImageIndices(List<PaintCommand> commands, List<String> uniqueHrefs) {
    for (var i = 0; i < commands.length; i++) {
      final PaintCommand command = commands[i];
      if (command is DrawImage) {
        final int index = uniqueHrefs.indexOf(command.href);
        commands[i] = DrawImage(
          href: command.href,
          imageIndex: index,
          x: command.x,
          y: command.y,
          width: command.width,
          height: command.height,
          bytes: command.bytes,
          style: command.style,
          decoding: command.decoding,
          id: command.id,
        );
      }
      if (command is DrawGroup) {
        populateImageIndices(command.commands, uniqueHrefs);
      }
    }
  }

  /// Finds the bytes for a specific href.
  List<int>? findBytesForHref(List<PaintCommand> commands, String href) {
    for (final command in commands) {
      if (command is DrawImage && command.href == href) {
        return command.bytes;
      }
      if (command is DrawGroup) {
        final List<int>? bytes = findBytesForHref(command.commands, href);
        if (bytes != null) {
          return bytes;
        }
      }
    }
    return null;
  }
}
