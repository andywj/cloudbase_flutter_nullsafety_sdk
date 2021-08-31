
CloudBase Flutter SDK(空安全版本) 是基于[Tencent Cloud Base Flutter SDK][tencent_cloudbase_flutter_sdk] 民间改制的空安全版本，主要支持最新 Flutter 框架下使用云开发能力。
---
|:warning:特别注意（warning）                |
|:------------------------------------------|
|目前所有空安全版本均为测试版本，请勿在生产使用 |

CloudBase Flutter SDK空安全版本) 提供一系列插件，可以根据场景按需加载。

| Plugin                                                     | Version                                    | 文档                               | 描述
| ---------------------------------------------------------- | ------------------------------------------ | -----------------------------------| ----------------------
| [cloudbase_core_nullsafety][core_pub_nullsafety]           | ![pub package][core_badge_nullsafety]      | [CloudBase Core Nullsafety][core_nullsafety_doc]         | 核心库，初始化环境等
| [cloudbase_auth_nullsafety][auth_pub_nullsafety]           | ![pub package][auth_badge_nullsafety]      | [CloudBase Auth Nullsafety][auth_nullsafety_doc]         | 鉴权库，支持微信登录、自定义登录、匿名登录等
| [cloudbase_function_nullsafety][function_pub_nullsafety]   | ![pub package][function_badge_nullsafety]  | [CloudBase Function Nullsafety][function_nullsafety_doc]         | 支持云函数能力
| [cloudbase_database_nullsafety][database_pub_nullsafety]   | ![pub package][database_badge_nullsafety]  | [CloudBase Database Nullsafety][database_nullsafety_doc]         | 支持文档型数据库能力
| [cloudbase_storage_nullsafety][storage_pub_nullsafety]     | ![pub package][storage_badge_nullsafety]   | [CloudBase Storage Nullsafety][storage_nullsafety_doc]         | 支持对象存储能力

[tencent_cloudbase_flutter_sdk]: https://github.com/TencentCloudBase/cloudbase-flutter-sdk
[core_pub_nullsafety]: https://pub.dartlang.org/packages/cloudbase_core_nullsafety
[auth_pub_nullsafety]: https://pub.dartlang.org/packages/cloudbase_auth_nullsafety
[function_pub_nullsafety]: https://pub.dartlang.org/packages/cloudbase_function_nullsafety
[database_pub_nullsafety]: https://pub.dartlang.org/packages/cloudbase_database_nullsafety
[storage_pub_nullsafety]: https://pub.dartlang.org/packages/cloudbase_storage_nullsafety
[core_badge_nullsafety]: https://img.shields.io/pub/v/cloudbase_core_nullsafety
[auth_badge_nullsafety]: https://img.shields.io/pub/v/cloudbase_auth_nullsafety
[function_badge_nullsafety]: https://img.shields.io/pub/v/cloudbase_function_nullsafety
[database_badge_nullsafety]: https://img.shields.io/pub/v/cloudbase_database_nullsafety
[storage_badge_nullsafety]: https://img.shields.io/pub/v/cloudbase_storage_nullsafety
[core_nullsafety_doc]: ./packages/cloudbase_core_nullsafety/README.md
[auth_nullsafety_doc]: ./packages/cloudbase_auth_nullsafety/README.md
[function_nullsafety_doc]: ./packages/cloudbase_function_nullsafety/README.md
[database_nullsafety_doc]: ./packages/cloudbase_database_nullsafety/README.md
[storage_nullsafety_doc]: ./packages/cloudbase_storage_nullsafety/README.md

## 原官方Flutter 插件

CloudBase Flutter SDK 提供一系列插件，可以根据场景按需加载。

| Plugin                             | Version                        | 文档                               | 描述
| ---------------------------------- | ------------------------------ | ---------------------------------- | ----------------------
| [cloudbase_core][core_pub]         | ![pub package][core_badge]     | [CloudBase Core][core_doc]         | 核心库，初始化环境等
| [cloudbase_auth][auth_pub]         | ![pub package][auth_badge]     | [CloudBase Auth][auth_doc]         | 鉴权库，支持微信登录、自定义登录、匿名登录等
| [cloudbase_function][function_pub] | ![pub package][function_badge] | [CloudBase Function][function_doc] | 支持云函数能力
| [cloudbase_database][database_pub]   | ![pub package][database_badge]  | [CloudBase Database][database_doc]   | 支持文档型数据库能力
| [cloudbase_storage][storage_pub]   | ![pub package][storage_badge]  | [CloudBase Storage][storage_doc]   | 支持对象存储能力

[core_pub]: https://pub.dartlang.org/packages/cloudbase_core
[auth_pub]: https://pub.dartlang.org/packages/cloudbase_auth
[function_pub]: https://pub.dartlang.org/packages/cloudbase_function
[database_pub]: https://pub.dartlang.org/packages/cloudbase_database
[storage_pub]: https://pub.dartlang.org/packages/cloudbase_storage
[core_badge]: https://img.shields.io/pub/v/cloudbase_core
[auth_badge]: https://img.shields.io/pub/v/cloudbase_auth
[function_badge]: https://img.shields.io/pub/v/cloudbase_function
[database_badge]: https://img.shields.io/pub/v/cloudbase_database
[storage_badge]: https://img.shields.io/pub/v/cloudbase_storage
[core_doc]: https://github.com/TencentCloudBase/cloudbase-flutter-sdk/blob/master/packages/cloudbase_core/README.md
[auth_doc]: https://github.com/TencentCloudBase/cloudbase-flutter-sdk/blob/master/packages/cloudbase_auth/README.md
[function_doc]: https://github.com/TencentCloudBase/cloudbase-flutter-sdk/blob/master/packages/cloudbase_function/README.md
[database_doc]: https://github.com/TencentCloudBase/cloudbase-flutter-sdk/blob/master/packages/cloudbase_database/README.md
[storage_doc]: https://github.com/TencentCloudBase/cloudbase-flutter-sdk/blob/master/packages/cloudbase_storage/README.md
