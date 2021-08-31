package com.cloudbase.cloudbase_auth_nullsafety;

import androidx.annotation.NonNull;

import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** CloudbaseAuthNullsafetyPlugin */
public class CloudbaseAuthNullsafetyPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native
  /// Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine
  /// and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "cloudbase_auth_nullsafety");
    channel.setMethodCallHandler(this);
  }



  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "wxauth.register":
        handleWxAuthRegister(call, result);
        break;
      case "wxauth.login":
        handleWxAuthLogin(call, result);
        break;
      default:
        result.notImplemented();
        break;
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  private void handleWxAuthRegister(MethodCall call, Result result) {
    Map<String, String> arguments = call.arguments();
    String wxAppId = arguments.get("wxAppId");
    try {
      CloudbaseWxAuth.initialize(wxAppId);
      result.success(null);
    } catch (Exception e) {
      result.error("WX_AUTH_REGISTER_FAILED", "WX_AUTH_REGISTER_FAILED", null);
    }
  }

  private void handleWxAuthLogin(MethodCall call, Result result) {
    CloudbaseWxAuth wxAuth = CloudbaseWxAuth.getInstance();
    if (wxAuth != null) {
      wxAuth.login(result);
    } else {
      result.error("WX_AUTH_NO_INSTANCE", "WX_AUTH_NO_INSTANCE", null);
    }
  }
}
