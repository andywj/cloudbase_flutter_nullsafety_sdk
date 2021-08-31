import 'package:cloudbase_database_nullsafety/src/realtime/snapshot.dart';

class RealtimeListener {
  Function? close;
  Function? onChange;
  Function? onError; // todo 格式化

  RealtimeListener({this.close, this.onChange, this.onError}) {
    if (this.onChange == null) {
      this.onChange = (Snapshot snapshot) {};
    }
    if (this.onError == null) {
      this.onError = (error) {};
    }
  }
}
