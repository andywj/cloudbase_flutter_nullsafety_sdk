## Cloudbase Function Nullsafety for Flutter

[![Pub](https://img.shields.io/pub/v/cloudbase_function_nullsafety)]()

| :warning:特别注意（warning）                   |
| :--------------------------------------------- |
| 目前所有空安全版本均为测试版本，请勿在生产使用 |

[腾讯云·云开发](https://www.cloudbase.net/)的 Flutter空安全(民间改制) 插件，更多的云开发 Flutter 插件请见[云开发文档](https://docs.cloudbase.net/api-reference/flutter/install.html)。

## 安装

在 flutter 项目的 `pubspec.yaml` 文件的 `dependencies` 中添加

```yaml
dependencies:
  cloudbase_core_nullsafety: ^0.0.2
  cloudbase_function_nullsafety: ^0.0.2
```

## 简单示例

```dart
import 'package:cloudbase_core_nullsafety/cloudbase_core.dart_nullsafety';
import 'package:cloudbase_auth_nullsafety/cloudbase_auth_nullsafety.dart';
import 'package:cloudbase_function_nullsafety/cloudbase_function_nullsafety.dart';

void main() async {
  CloudBaseCore core = CloudBaseCore.init({'env': 'your-env-id'});

  // 匿名登录
  CloudBaseAuth auth = CloudBaseAuth(core);
  CloudBaseAuthState authState = await auth.getAuthState();

  if (authState == null) {
      await auth.signInAnonymously();
  }

  // 云函数调用
  CloudBaseFunction function = CloudBaseFunction(core);
  Map<String, dynamic> data = {'a': 1, 'b': 2};
  CloudBaseResponse res = await function.callFunction('sum', data);
  print(res.data) // { sum: 3 }
}
```

## 详细文档

[云开发·云函数](https://docs.cloudbase.net/api-reference/flutter/functions.html)
