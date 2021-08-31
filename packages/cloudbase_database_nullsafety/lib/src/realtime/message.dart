import 'dart:math';

class Message {
  static String genRequestId() {
    return '${DateTime.now().millisecondsSinceEpoch}_${Random().nextDouble()}';
  }

  static const DATA_VERSION = '2019-06-01';
}
