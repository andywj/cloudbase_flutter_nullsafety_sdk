import 'package:cloudbase_core_nullsafety/cloudbase_core_nullsafety.dart';
import 'package:cloudbase_database_nullsafety/src/geo/polygon.dart';

class MultiPolygon {
  List<Polygon> polygons;

  MultiPolygon(this.polygons) {
    if (polygons.length <= 0) {
      throw new CloudBaseException(
          code: CloudBaseExceptionCode.INVALID_PARAM,
          message: 'MultiPolygon must contain 1 polygon at least');
    }
  }

  Map<String, dynamic> toJson() {
    var polygonArr = [];
    polygons.forEach((polygon) {
      polygonArr.add(polygon.toJson()['coordinates']);
    });

    return {'type': 'MultiPolygon', 'coordinates': polygonArr};
  }

  static bool validate(data) {
    if (data['type'] != 'MultiLineString' || !(data['coordinates'] is List)) {
      return false;
    }

    List multiPolygon = data['coordinates'];
    for (var i = 0; i < multiPolygon.length; i++) {
      if (!(multiPolygon[i] is List)) {
        return false;
      }
      List polygon = multiPolygon[i];

      for (var j = 0; j < polygon.length; j++) {
        if (!(polygon[j] is List)) {
          return false;
        }
        List line = polygon[j];

        for (var k = 0; k < line.length; k++) {
          var point = line[k];
          if (!(point[0] is num && point[1] is num)) {
            return false;
          }
        }
      }
    }

    return true;
  }

  static MultiPolygon fromJson(coordinates) {
    List<Polygon> polygons = [];
    coordinates.forEach((polygon) {
      polygons.add(Polygon.fromJson(coordinates));
    });

    return MultiPolygon(polygons);
  }
}
