## Cloudbase Database Nullsafety for Flutter

[![Pub](https://img.shields.io/pub/v/cloudbase_database_nullsafety)]()

[腾讯云·云开发](https://www.cloudbase.net/)的 Flutter空安全(民间改制) 插件，更多的云开发 Flutter 插件请见[云开发文档](https://docs.cloudbase.net/api-reference/flutter/install.html)。

## 安装

在 flutter 项目的 `pubspec.yaml` 文件的 `dependencies` 中添加

```yaml
dependencies:
  cloudbase_core_nullsafety: ^0.0.1
  cloudbase_database_nullsafety: ^0.0.1
```

## 简单示例

```dart
import 'package:cloudbase_core_nullsafety/cloudbase_core_nullsafety.dart';
import 'package:cloudbase_auth_nullsafety/cloudbase_auth_nullsafety.dart';
import 'package:cloudbase_database_nullsafety/cloudbase_database_nullsafety.dart';

void main() async {
  CloudBaseCore core = CloudBaseCore.init({'env': 'your-env-id'});

  // 匿名登录
  CloudBaseAuth auth = CloudBaseAuth(core);
  CloudBaseAuthState authState = await auth.getAuthState();

  if (authState == null) {
      await auth.signInAnonymously();
  }

  // 数据库查询
  CloudBaseDatabase database = CloudBaseDatabase(core);
  String myOpenID = 'xxx';
  database.collection('user').where({
    '_openid': myOpenID
  });
}
```

## 详细文档

[云开发·数据库](https://docs.cloudbase.net/api-reference/flutter/database.html)
