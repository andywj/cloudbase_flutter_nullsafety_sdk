enum CloudBaseAuthType {
  /// 未登录
  EMPTY,

  /// 微信登录
  WX,

  /// 自定义登录
  CUSTOM,

  /// 匿名登录
  ANONYMOUS
}

abstract class ICloudBaseAuth {
  /// 获取 accessToken
  Future<String> getAccessToken();

  /// 刷新 accessToken
  Future<void> refreshAccessToken();
}
