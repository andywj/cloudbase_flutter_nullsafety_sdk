class CloudBaseExceptionCode {
  static const EMPTY_PARAM = 'EMPTY_PARAM';

  static const INVALID_PARAM = 'INVALID_PARAM';

  static const NETWORK_ERR = 'NETWORK_ERR';

  static const NULL_RESPONES = 'NULL_RESPONES';

  /// 响应结果解析失败
  static const RESPONSE_PRASE_ERR = 'RESPONSE_PRASE_ERR';

  static const IO_ERR = 'IO_ERR';

  static const INVALID_FIELD_PATH = 'INVALID_FIELD_PATH';

  static const FILE_NOT_EXIST = 'FILE_NOT_EXIST';

  static const DATABASE_REQUEST_FAILED = 'DATABASE_REQUEST_FAILED';

  static const INVALID_CUSTOM_LOGIN_TICKET = 'INVALID_CUSTOM_LOGIN_TICKET';

  /// 获取授权失败
  static const AUTH_FAILED = 'AUTH_FAILED';

  /// 登出失败
  static const SIGN_OUT_FAILED = 'SIGN_OUT_FAILED';

  /// refreshToken 过期
  static const REFRESH_TOKEN_EXPIRED = 'REFRESH_TOKEN_EXPIRED';

  /// 不合法的 refreshToken
  static const INVALID_REFRESH_TOKEN = 'INVALID_REFRESH_TOKEN';

  /// accessToken 过期 或 无效
  static const CHECK_LOGIN_FAILED = 'CHECK_LOGIN_FAILED';

  /// 没有 refreshToken 信息
  static const NOT_LOGIN = 'NOT_LOGIN';

  /// 无效的 GEO 数据
  static const INVALID_GEO_DAT = 'INVALID_GEO_DAT';
}

/// DioError describes the error info  when request failed.
class CloudBaseException implements Exception {
  final String? message;
  final String? requestId;
  late final String code;

  CloudBaseException({this.message, required this.code, this.requestId});

  String toString() {
    var msg = "CloudBaseError [$code]: $message";
    // if (error is Error) {
    //   msg += "\n${error.stackTrace}";
    // }
    return msg;
  }
}
