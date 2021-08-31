import 'package:cloudbase_core_nullsafety/cloudbase_core_nullsafety.dart';
import 'package:cloudbase_database_nullsafety/src/geo/point.dart';

class LineString {
  List<Point> points;

  LineString(this.points) {
    if (points.length < 2) {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.INVALID_PARAM,
          message: 'points must contain 2 points at least');
    }
  }

  Map<String, dynamic> toJson() {
    var pointArr = [];
    points.forEach((point) {
      pointArr.add(point.toJson()['coordinates']);
    });

    return {'type': 'LineString', 'coordinates': pointArr};
  }

  static bool validate(data) {
    if (data['type'] != 'LineString' || !(data['coordinates'] is List)) {
      return false;
    }

    List coordinates = data['coordinates'];
    for (var i = 0; i < coordinates.length; i++) {
      var point = coordinates[i];
      if (!(point[0] is num && point[1] is num)) {
        return false;
      }
    }

    return true;
  }

  static LineString fromJson(coordinates) {
    List<Point> points = [];
    coordinates.forEach((point) {
      points.add(Point.fromJson(point));
    });

    return LineString(points);
  }
}
