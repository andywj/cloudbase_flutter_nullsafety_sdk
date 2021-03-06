## Cloudbase Core Nullsafety for Flutter

[![Pub](https://img.shields.io/pub/v/cloudbase_core_nullsafety)]()

| :warning:特别注意（warning）                   |
| :--------------------------------------------- |
| 目前所有空安全版本均为测试版本，请勿在生产使用 |

[腾讯云·云开发](https://www.cloudbase.net/)的 Flutter空安全(自用修改版) 插件，更多的云开发 Flutter 插件请见[云开发文档](https://docs.cloudbase.net/api-reference/flutter/install.html)。

## 安装

在 flutter 项目的 `pubspec.yaml` 文件的 `dependencies` 中添加

```yaml
dependencies:
  cloudbase_core_nullsafety: ^0.0.3
```

## 简单示例

```dart
import 'package:cloudbase_core_nullsafety/cloudbase_core_nullsafety.dart';

// 初始化 CloudBase
CloudBaseCore core = CloudBaseCore.init({
    // 填写你的云开发 env
    'env': 'your-env-id'
});
```

## 详细文档

[云开发·初始化](https://docs.cloudbase.net/api-reference/flutter/initialization.html)
