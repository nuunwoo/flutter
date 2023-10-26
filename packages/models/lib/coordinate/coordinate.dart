import 'package:dependencies/dependencies.dart';

class LngLat {
  final double lat;
  final double lng;
  const LngLat({required this.lng, required this.lat});

  factory LngLat.fromJson(Map<String, dynamic> json) {
    return LngLat(lng: json['lng'], lat: json['lat']);
  }

  Map<dynamic, double> toJson() {
    return {lng: lng, lat: lat};
  }

  @override
  String toString() => 'LngLat<lat: $lat, lng: $lng}>';
}

enum CoordinateValidationError { empty }

class Coordinate extends FormzInput<LngLat, CoordinateValidationError> {
  const Coordinate.pure() : super.pure(const LngLat(lng: 0.0, lat: 0.0));
  const Coordinate.dirty([super.value = const LngLat(lng: 0.0, lat: 0.0)])
      : super.dirty();

  @override
  CoordinateValidationError? validator(LngLat value) {
    if (value.lng == 0 || value.lat == 0)
      return CoordinateValidationError.empty;
    return null;
  }
}
