import 'dart:async';

import 'package:flutter/services.dart';

class Toastutil {
  static const MethodChannel _channel =
      const MethodChannel('toastutil');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


  static void showMsg(String msg){
    _channel.invokeMethod("showMsg",{"msg":msg});
  }

}
