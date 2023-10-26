import 'package:flutter/cupertino.dart';

import 'clog.dart';

/// 화면 비율 계산
class ScreenRatio {
  final double screenWidth = 960;
  final double screenHeight = 566;

  static double screenRatioX = 0.8;
  static double screenRatioY = 0.8;
  static double screenRatioF = 0.8;

  /// 화면 비율 계산
  void init(BuildContext context) {
    try {
      double devicesWidth = MediaQuery.of(context).size.width;
      double devicesHeight = MediaQuery.of(context).size.height;
      double ratioX = devicesWidth / screenWidth;
      double ratioY = devicesHeight / screenHeight;
      screenRatioX = ratioX;
      screenRatioY = ratioY;
      screenRatioF = (double.parse(ratioX.toStringAsFixed(3)) + 1) * 2 / 3;
      if (devicesWidth == 0.0 || devicesHeight == 0.0) {
        screenRatioX = 0.8;
        screenRatioY = 0.8;
        screenRatioF = 0.8;
      }
      CLog.d("screenRatioX $screenRatioX");
      CLog.d("screenRatioY $screenRatioY");

      CLog.w(
          "SCREEN (${screenWidth.toInt()} , ${screenHeight.toInt()}) -> DEVICES (${devicesWidth.toInt()} , ${devicesHeight.toInt()})");
    } catch (e) {
      screenRatioX = 0.8;
      screenRatioY = 0.8;
      screenRatioF = 0.8;
    }
  }
}
