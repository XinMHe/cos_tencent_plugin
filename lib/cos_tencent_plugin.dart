
import 'dart:async';

import 'package:flutter/services.dart';

class CosTencentPlugin {
  static const MethodChannel _channel = MethodChannel('cos_tencent_plugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    // final String? version1 =await _channel.invokeMethod("uploadFile",<String,dynamic>{
    //   "localPath": "sss",
    //   "appid": "add",
    //   "region": "regionsss",
    //   "region": "regionsssss",
    //   "cosPath": "cosPath",
    //   "bucket":"bucket1122"
    // });
    return version;
  }

  static Future<String> get getNative async {
    return await _channel.invokeMethod('getNative');
  }
  static Future<dynamic> uploadByFile(
      String region,
      String appid,
      String bucket,
      String secretId,
      String secretKey,
      String sessionToken,
      int startTime,
      int expiredTime,
      String cosPath,
      String localPath) {
    return _channel.invokeMethod<dynamic>('uploadFile', {
      'region': region,
      'appid': appid,
      'bucket': bucket,
      'secretId': secretId,
      'secretKey': secretKey,
      'startTime': startTime,
      'expiredTime': expiredTime,
      'sessionToken': sessionToken,
      'cosPath': cosPath,
      'localPath': localPath,
    });
  }

  static void setMethodCallHandler(Future<dynamic> handler(MethodCall call)) {
    _channel.setMethodCallHandler(handler);
  }
}
