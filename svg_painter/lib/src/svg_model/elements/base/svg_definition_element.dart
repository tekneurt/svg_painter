part of '../../svg_element.dart';

/// Base class for non-rendering definition elements (`<defs>`, gradients).
@immutable
sealed class SvgDefinitionElement extends SvgElement {
  const SvgDefinitionElement({super.id});
}
