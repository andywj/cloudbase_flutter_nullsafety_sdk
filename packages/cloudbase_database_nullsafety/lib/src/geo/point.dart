import 'package:cloudbase_database_nullsafety/src/validater.dart';

class Point {
  /// 纬度 [-90, 90]
  num longitude;

  /// 经度 [-100, 100]
  num latitude;

  Point(this.longitude, this.latitude) {
    Validater.isGeopoint('longitude', longitude);
    Validater.isGeopoint('latitude', latitude);
  }

  Map<String, dynamic> toJson() {
    return {
      'type': 'Point',
      'coordinates': [longitude, latitude]
    };
  }

  static bool validate(data) {
    return data['type'] == 'Point' &&
        data['coordinates'] is List &&
        Validater.isGeopoint('longitude', data['coordinates'][0]) &&
        Validater.isGeopoint('latitude', data['coordinates'][1]);
  }

  static Point fromJson(coordinates) {
    return Point(coordinates[0], coordinates[1]);
  }
}
