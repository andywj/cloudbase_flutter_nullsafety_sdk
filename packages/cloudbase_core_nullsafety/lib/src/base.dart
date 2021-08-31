import './exception.dart';
import './auth.dart';

class CloudBaseConfig {
  /// 请求超时时间
  int? timeout;

  /// 环境 id
  String? envId;
  String? env;

  /// 使用微信登录时, 必须设置这些属性
  String? wxAppId;
  String? wxUniLink;

  /// 应用安全校验密钥
  Map<String, String>? appAccess;

  CloudBaseConfig(
      {this.env,
      this.envId,
      this.timeout,
      this.wxAppId,
      this.wxUniLink,
      this.appAccess}) {
    assert(env != null || envId != null);
    _adapt();
  }

  CloudBaseConfig.fromMap(Map<String, dynamic> map) {
    timeout = map['timeout'];
    wxAppId = map['wxAppId'];
    wxUniLink = map['wxUniLink'];

    envId = map['envId'];
    env = map['env'];
    assert(env != null || envId != null);
    _adapt();
    appAccess = map['appAccess'];
    assert(appAccess != null);
  }

  void _adapt() {
    /// 兼容envId的用法
    if (env != null) {
      envId = env;
    } else if (envId != null) {
      env = envId!;
    }
  }
}

class CloudBaseResponse {
  dynamic data;
  String? code;
  String? message;
  late String requestId;

  CloudBaseResponse(
      {required this.code, this.message, this.data, required this.requestId});

  factory CloudBaseResponse.fromMap(Map<String, dynamic> map) {
    return CloudBaseResponse(
        code: map['code'],
        data: map['data'],
        message: map['message'],
        requestId: map['requestId']);
  }

  @override
  String toString() {
    Map<String, dynamic> map = {
      'data': data,
      'code': code,
      'message': message,
      'requestId': requestId
    };
    return map.toString();
  }
}

class CloudBaseCore {
  /// 配置
  late CloudBaseConfig config;

  /// auth 实例
  ICloudBaseAuth? auth;

  /// 缓存 core 实例
  static final Map<String, CloudBaseCore> _cache = <String, CloudBaseCore>{};

  CloudBaseCore._internal(CloudBaseConfig config) {
    this.config = config;
  }

  factory CloudBaseCore(CloudBaseConfig config) {
    String? envId = config.envId;

    // 没有缓存
    if (envId == null && _cache[envId] == null) {
      throw new CloudBaseException(
          code: CloudBaseExceptionCode.INVALID_PARAM,
          message: '环境 $envId 未初始化 CloudBaseCore 实例，请传入 envId');
    }

    return _cache.putIfAbsent(envId!, () => CloudBaseCore._internal(config));
  }

  factory CloudBaseCore.init(Map<String, dynamic> map) {
    String? envId = map['env'] != null ? map['env'] : map['envId'];

    // 没有缓存
    if (envId == null && _cache[envId] == null) {
      throw new CloudBaseException(
          code: CloudBaseExceptionCode.INVALID_PARAM,
          message: 'CloudBase 初始化实例失败，缺少参数 env');
    }

    if (map['appAccess'] == null && _cache[envId] == null) {
      throw new CloudBaseException(
          code: CloudBaseExceptionCode.INVALID_PARAM,
          message:
              'CloudBase 初始化实例失败，缺少参数 appAccess. 如果没有 appAccess, 请到云开发控制台设置移动安全来源.');
    }

    return _cache.putIfAbsent(envId!, () {
      CloudBaseConfig config = CloudBaseConfig.fromMap(map);
      return CloudBaseCore._internal(config);
    });
  }

  setAuthInstance(ICloudBaseAuth auth) {
    this.auth = auth;
  }
}
