import 'package:flutter/material.dart';
import 'package:pages/standby/status.dart';
import 'package:utility/color.dart';
import 'package:utility/util.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Util.h(50),
      color: ColorEntries().banner,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: Util.w(32)),
              ImageIcon(
                const AssetImage(
                  "ic_loding.png",
                  package: '../assets/images/title',
                ),
                size: Util.w(22.5),
                color: Colors.white,
              ),
              Text(
                " 대기화면",
                style: TextStyle(
                  fontSize: Util.f(20),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          DefaultTextStyle(
            style: TextStyle(fontSize: Util.f(13)),
            child: Row(
              children: [
                const Status(name: 'GPS', status: 'ON'),
                SizedBox(width: Util.w(40.5)),
                const Status(name: 'LTE', status: 'ON'),
                SizedBox(width: Util.w(40.5)),
                const Status(name: 'WIFI', status: 'OFF'),
                SizedBox(width: Util.w(40.5)),
                const Status(name: 'SAVE MODE', status: 'NO'),
                SizedBox(width: Util.w(32)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
