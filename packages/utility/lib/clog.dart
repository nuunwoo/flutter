import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// 로그
class CLog {
  static var logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug,
    filter: MyFilter(),
    output: MyOutput(),
  );

  static log() {
    w('--------------');
    if (kDebugMode) {
      w('디버그 모드');
    } else {
      w('라이브 모드');
    }
    w('--------------');
  }

  static void d(String message) {
    logger.d('', message);
  }

  static void w(String message) {
    logger.w('', message);
  }

  static void v(String message) {
    logger.v('', message);
  }

  static void i(String message) {
    logger.i('', message);
  }

  static void e(String message) {
    logger.e('', message);
  }
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    // return event.level != Level.verbose;
    return true;
  }
}

class MyOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    try {
      if (event.level == Level.error) {
        print(event.lines[0]);
        print(event.lines[1]);
        print(event.lines[2]);
        print(event.lines[3]);
        print(event.lines[4]);
        print(event.lines[5]);
        return;
      }
      if (kDebugMode) {
        print(event.lines[1]);
        // print(event.lines[4]); // 경로
      }
    } catch (e) {
      print("CLOG EXCEPTION : $e");
    }
  }
}
