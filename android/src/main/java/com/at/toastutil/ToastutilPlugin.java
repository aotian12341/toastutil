package com.at.toastutil;

import android.content.Context;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** ToastutilPlugin */
public class ToastutilPlugin implements MethodCallHandler {

  Context mContext;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "toastutil");
    ToastutilPlugin plugin = new ToastutilPlugin();
    plugin.mContext = registrar.context();
    channel.setMethodCallHandler(plugin);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }else if(call.method.equals("showMsg")){
      showToast(call.argument("msg").toString());
    }else {
      result.notImplemented();
    }
  }

  public void showToast(String msg){
    Toast.makeText(mContext,msg,Toast.LENGTH_SHORT).show();
  }
}
