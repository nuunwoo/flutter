import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:utility/util.dart';

class ProcessWidget extends StatelessWidget {
  const ProcessWidget({
    required this.name,
    required this.progress,
    required this.color,
    super.key,
  });

  final String name;
  final int progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Util.h(14.5)),
            CircularPercentIndicator(
              radius: Util.w(41),
              lineWidth: 1.0,
              percent: progress / 100,
              center: Text(
                '$progress%',
                style: TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: Util.f(15),
                ),
              ),
              progressColor: color,
            ),
            SizedBox(height: Util.h(6.5)),
            SizedBox(
              width: Util.w(38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProgressCircle(
                    color: color,
                    checked: progress > 0 && progress < 50 ? true : false,
                  ),
                  ProgressCircle(
                    color: color,
                    checked: progress >= 50 && progress < 100 ? true : false,
                  ),
                  ProgressCircle(
                    color: color,
                    checked: progress == 100 ? true : false,
                  ),
                ],
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: Util.f(15),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressCircle extends StatelessWidget {
  const ProgressCircle({
    required this.color,
    required this.checked,
    super.key,
  });

  final Color color;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.w(6),
      height: Util.w(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: checked ? color : Color.fromRGBO(213, 213, 213, 1),
      ),
    );
  }
}
