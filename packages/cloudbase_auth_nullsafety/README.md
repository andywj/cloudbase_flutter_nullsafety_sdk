## Cloudbase Auth for Flutter

[![Pub](https://img.shields.io/pub/v/cloudbase_auth_nullsafety)]()

[腾讯云·云开发](https://www.cloudbase.net/)的 民间改制Flutter空安全 插件，更多的云开发 Flutter 插件请见[云开发文档](https://docs.cloudbase.net/api-reference/flutter/install.html)。

## 安装

在 flutter 项目的 `pubspec.yaml` 文件的 `dependencies` 中添加

```yaml
dependencies:
  cloudbase_core: ^0.0.1
  cloudbase_auth: ^0.0.1
```

## 简单示例

```dart
import 'package:cloudbase_core_nullsafety/cloudbase_core_nullsafety.dart';;
import 'package:cloudbase_auth_nullsafety/cloudbase_auth_nullsafety.dart';

// 初始化 CloudBase
CloudBaseCore core = CloudBaseCore.init({
    // 填写你的云开发 env
    'env': 'your-env-id'
});

// 获取登录对象
CloudBaseAuth auth = CloudBaseAuth(core);

// 获取登录状态
CloudBaseAuthState authState = await auth.getAuthState();

// 唤起匿名登录
if (authState == null) {
  await auth.signInAnonymously().then((success) {
    // 登录成功
    print(success);
  }).catchError((err) {
    // 登录失败
    print(err);
  });
}
```

## 详细文档

[云开发·登录验证](https://docs.cloudbase.net/api-reference/flutter/authentication.html)
