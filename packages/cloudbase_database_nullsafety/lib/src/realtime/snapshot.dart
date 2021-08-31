import 'package:cloudbase_database_nullsafety/src/realtime/virtual_websocket_client.dart';

class Snapshot {
  num? id;
  List<SingleDocChange>? docChanges;
  List? docs;
  String? type;
  String? msgType;

  Snapshot({this.id, this.docChanges, this.docs, this.type, this.msgType});

  @override
  String toString() {
    Map snapshot = {
      'id': id,
      'docChanges': docChanges,
      'docs': docs,
      'type': type,
      'msgType': msgType
    };

    return snapshot.toString();
  }
}
