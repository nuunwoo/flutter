import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:utility/util.dart';

Future<dynamic> courseInfoDialog(
    BuildContext context, int course, int hole) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) =>
        CourseInfoDialog(utf8.decode([course + 65]), hole),
  );
}

class CourseInfoDialog extends StatelessWidget {
  final String course;
  final int hole;
  const CourseInfoDialog(this.course, this.hole, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "0$hole.png",
                package: '../assets/images/Map/CourseView/$course',
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          right: Util.w(23.5),
          bottom: Util.h(20.5),
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(Util.w(0)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Util.w(7.5)),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              width: Util.w(100),
              height: Util.h(40),
              child: Text(
                '닫기',
                style: TextStyle(
                  color: const Color(0xff215273),
                  fontSize: Util.f(13),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
