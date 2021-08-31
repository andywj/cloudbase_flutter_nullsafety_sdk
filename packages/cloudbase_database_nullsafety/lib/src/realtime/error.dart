class RealtimeErrorMessageException implements Exception {
  Map? serverErrorMsg;

  RealtimeErrorMessageException({this.serverErrorMsg});

  @override
  String toString() {
    return 'Watch Error ${serverErrorMsg.toString()} (requestid: ${serverErrorMsg?['requestId']})';
  }
}

class TimeoutException implements Exception {}

class CancelledException implements Exception {
  String? message;

  CancelledException({this.message});

  @override
  String toString() {
    return "$message";
  }
}
