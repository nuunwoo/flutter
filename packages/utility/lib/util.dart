import 'package:flutter/material.dart';

import 'screen_ratio.dart';

class Util {
  /// 화면 이동
  static void moveNext(BuildContext context, Widget widget, bool isHistoryBack) {
    if (isHistoryBack) {
      // history 남김
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return widget;
      }));
    } else {
      // history 지움
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return widget;
      }));
    }
  }
  /// 화면 이동
  static void moveBack(BuildContext context) {
      Navigator.pop(context);
  }




  /// 비율 WIDTH
  static double w(double num) {
    return num * ScreenRatio.screenRatioX;
  }

  /// 비율 HEIGHT
  static double h(double num) {
    return num * ScreenRatio.screenRatioY;
  }

  /// 비율 FONT
  static double f(int num) {
    return num * ScreenRatio.screenRatioF;
  }
}
