/// Model for properties that are inherited from parent elements (like groups).
class InheritedProperty {
  const InheritedProperty(this.propertyName, {this.colorArgb, this.shaderId, this.patternId});

  final String propertyName;
  final int? colorArgb;
  final String? shaderId;
  final String? patternId;
}
