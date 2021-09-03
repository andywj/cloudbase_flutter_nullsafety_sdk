## Cloudbase Storage Nullsafety for Flutter

[![Pub](https://img.shields.io/pub/v/cloudbase_storage_nullsafety)]()

| :warning:特别注意（warning）                   |
| :--------------------------------------------- |
| 目前所有空安全版本均为测试版本，请勿在生产使用 |

[腾讯云·云开发](https://www.cloudbase.net/)的 Flutter空安全(民间改制) 插件，更多的云开发 Flutter 插件请见[云开发文档](https://docs.cloudbase.net/api-reference/flutter/install.html)。

## 安装

在 flutter 项目的 `pubspec.yaml` 文件的 `dependencies` 中添加

```yaml
dependencies:
  cloudbase_core_nullsafety: ^0.0.2
  cloudbase_storage_nullsafety: ^0.0.2
```

## 简单示例

```dart
import 'package:cloudbase_core_nullsafety/cloudbase_core_nullsafety.dart';
import 'package:cloudbase_auth_nullsafety/cloudbase_auth_nullsafety.dart';
import 'package:cloudbase_storage_nullsafety/cloudbase_storage_nullsafety.dart';
import 'package:path_provider/path_provider.dart';

// 获取 flutter Document 路径
// 参考文档：https://flutter.cn/docs/cookbook/persistence/reading-writing-files
_getDocumentsPath() async {
  final directory = await getApplicationDocumentsDirectory();
  String path = directory.path;
  return path;
}

void main() async {
  CloudBaseCore core = CloudBaseCore.init({'env': 'your-env-id'});
  
  // 匿名登录
  CloudBaseAuth auth = CloudBaseAuth(core);
  CloudBaseAuthState authState = await auth.getAuthState();

  if (authState == null) {
      await auth.signInAnonymously();
  }

  // 上传文件
  CloudBaseStorage storage = CloudBaseStorage(core);
  String path = await _getDocumentsPath();
  await storage.uploadFile(
      cloudPath: 'flutter/data.txt', filePath: '$path/data.txt');
}
```

## 详细文档

[云开发·文件存储](https://docs.cloudbase.net/api-reference/flutter/storage.html)
