/// Model for properties that are inherited from parent elements (like groups).
class InheritedProperty {
  const InheritedProperty(this.propertyName, {this.colorArgb, this.shaderId});

  final String propertyName;
  final int? colorArgb;
  final String? shaderId;
}
