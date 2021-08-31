import 'package:flutter_test/flutter_test.dart';

import 'package:cloudbase_core_nullsafety/cloudbase_core_nullsafety.dart';

void main() {
  test('adds one to input values', () async {
    var context = CloudBaseCore(CloudBaseConfig(envId: '', timeout: 10));
    var cloudbase = CloudBaseRequest(context);
    CloudBaseResponse res = await cloudbase.post('login', {});
    print(res.code);
    print(res.runtimeType);
    assert(res.code?.isNotEmpty ?? false);
    assert(res.runtimeType.toString() == 'CloudBaseResponse');
  });
}
