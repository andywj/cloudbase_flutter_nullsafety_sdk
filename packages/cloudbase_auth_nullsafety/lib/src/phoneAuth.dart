import 'package:cloudbase_auth_nullsafety/src/baseAuth.dart';
import 'package:cloudbase_core_nullsafety/cloudbase_core_nullsafety.dart';

import 'interface.dart';

enum SIGN_METHOD { SIGNIN, SIGNUP, FORCERESETPWD }

class PhoneAuthProvider extends AuthProvider {
  PhoneAuthProvider(CloudBaseCore core) : super(core);

  Future signIn({
    required String phone,
    String? code,
    String? password,
    String? signMethod,
  }) async {
    if (signMethod == null) {
      signMethod = SIGN_METHOD.SIGNIN.name;
    }
    CloudBaseResponse res = await CloudBaseRequest(super.core).postWithoutAuth(
      'auth.signIn',
      {
        'loginType': 'PHONE',
        'phoneNumber': "+86$phone",
        'phoneCode': code,
        'password': password,
        'refresh_token': cache.refreshTokenKey,
        'signMethod': signMethod,
      },
    );
    if (res.code != null) {
      throw new CloudBaseException(code: res.code!, message: res.message);
    }
    if (res.data != null && res.data['refresh_token'] != null) {
      String refreshToken = res.data['refresh_token'];
      await setRefreshToken(refreshToken);
      await setAuthType(CloudBaseAuthType.PHONE);
      if (res.data['access_token'] != null &&
          res.data['access_token_expire'] != null) {
        await cache.setStore(cache.accessTokenKey, res.data['access_token']);
        await cache.setStore(
            cache.accessTokenExpireKey,
            res.data["access_token_expire"] +
                DateTime.now().millisecondsSinceEpoch);
      } else {
        await refreshAccessToken();
      }

      return CloudBaseAuthState(
          authType: CloudBaseAuthType.PHONE, refreshToken: refreshToken);
    } else {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.AUTH_FAILED, message: '手机号登录失败');
    }
  }

  Future signUp({
    required String phone,
    String? code,
    String? password,
  }) async {
    return signIn(
      phone: phone,
      code: code,
      password: password,
      signMethod: SIGN_METHOD.SIGNUP.name,
    );
  }

  Future forceResetPwd({
    required String phone,
    String? code,
    String? password,
  }) async {
    return signIn(
      phone: phone,
      code: code,
      password: password,
      signMethod: SIGN_METHOD.FORCERESETPWD.name,
    );
  }
}
