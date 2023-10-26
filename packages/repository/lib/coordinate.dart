import 'package:models/coordinate/coordinate.dart';

class CoordinateRepository {
  const CoordinateRepository({required this.lng, required this.lat});

  final double lng;
  final double lat;

  Future<LngLat> getCoordinate() async {
    return LngLat(lng: lng, lat: lat);
  }
}
