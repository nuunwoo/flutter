import 'package:flutter/widgets.dart';

class ColorEntries {
  final Color background;
  final Color banner;
  final Color boxShadow;
  final Color border;
  final Color black;
  final Color white;
  final Color orange;
  final Color black16;
  final Color tabBarController;
  final Color textfield;

  ColorEntries({
    this.background = const Color(0xfff4f5f9),
    this.banner = const Color(0xff215273),
    this.boxShadow = const Color(0xFFD2D2D2),
    this.border = const Color(0xffd6d6d6),
    this.black = const Color(0xff000000),
    this.white = const Color(0xffffffff),
    this.orange = const Color(0xfff99a37),
    this.black16 = const Color(0xffd6d6d6),
    this.tabBarController = const Color(0xff052d48),
    this.textfield = const Color(0xffd2edff),
  });

  factory ColorEntries.fromJson(Map<String, dynamic> json) {
    return ColorEntries(
      background: json['background'],
      banner: json['banner'],
      boxShadow: json['boxShadow'],
      border: json['border'],
      black: json['black'],
      white: json['white'],
      orange: json['orange'],
      black16: json['black16'],
      tabBarController: json['tabBarController'],
      textfield: json['textfield'],
    );
  }

  Map<dynamic, Color> toJson() {
    return {
      background: background,
      banner: banner,
      boxShadow: boxShadow,
      border: border,
      black: black,
      white: white,
      orange: orange,
      black16: black16,
      tabBarController: tabBarController,
      textfield: textfield,
    };
  }
}
