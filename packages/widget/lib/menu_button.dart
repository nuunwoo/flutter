import 'package:flutter/material.dart';
import 'package:screen/caddyNote/caddyNote.dart';
import 'package:screen/course/course.dart';
import 'package:utility/color.dart';
import 'package:utility/util.dart';
import 'package:widget/patch/patch_dialog.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.w(100),
      height: Util.h(60),
      decoration: BoxDecoration(
        color: ColorEntries().banner,
        borderRadius: BorderRadius.circular(Util.w(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(0, 7),
          )
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: () => menuOpen(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorEntries().banner,
        ),
        icon: Icon(Icons.menu, size: Util.w(22.5)),
        label: Text(
          'MENU',
          style: TextStyle(fontSize: Util.f(15)),
        ),
      ),
    );
  }
}

Future<void> menuOpen(BuildContext context) {
  final List<Map<String, dynamic>> menuItem = [
    {"image": "ic_golf_course.png", "name": "코스소개", "dialog": courseDialog},
    {"image": "ic_sms.png", "name": "메세지", "dialog": patchDialog},
    {"image": "personalcard.png", "name": "캐디수첩", "dialog": caddyNoteDialog},
    {"image": "ic_scorecard.png", "name": "스코어카드", "dialog": patchDialog},
    {"image": "ic_play.png", "name": "경기모드", "dialog": patchDialog},
    {"image": "ic_stop.png", "name": "경기중단", "dialog": patchDialog},
    {"image": "reserve.png", "name": "식사주문", "dialog": patchDialog},
    {"image": "ic_board_text.png", "name": "리더보드", "dialog": patchDialog},
    {"image": "ic_golf_cart.png", "name": "카트점검", "dialog": patchDialog},
    {"image": "setting_2.png", "name": "세팅", "dialog": patchDialog},
    {"image": "ic_self_edit.png", "name": "셀프약정서", "dialog": patchDialog},
    {"image": "microphone_2.png", "name": "VOC등록", "dialog": patchDialog},
    {"image": "ic_safe.png", "name": "안전수칙\n안내", "dialog": patchDialog},
  ];

  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Label',
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.fromLTRB(Util.w(7), 0, 0, Util.w(103)),
          width: Util.w(473),
          height: Util.h(368),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Util.w(7.5))),
          child: Padding(
            padding: EdgeInsets.fromLTRB(Util.w(12), Util.h(14), 0, 0),
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.start,
              spacing: Util.w(22.5),
              runSpacing: Util.w(25),
              children: menuItem
                  .map(
                    (e) => MenuItem(
                      name: e['name'].toString(),
                      image: e['image'].toString(),
                      dialog: e["dialog"],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
    },
  );
}

class MenuItem extends StatelessWidget {
  final String name;
  final String image;
  final dynamic dialog;

  const MenuItem({
    required this.name,
    required this.image,
    required this.dialog,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.h(70),
      height: Util.h(70),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: Util.w(1.5),
        ),
        borderRadius: BorderRadius.circular(Util.w(7.5)),
        boxShadow: [
          BoxShadow(
            color: ColorEntries().banner.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(5, 5),
          )
        ],
      ),
      child: SizedBox.expand(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            dialog(context);
            debugPrint('$name onPressed');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorEntries().banner,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Util.w(7.5)),
            ),
            padding: EdgeInsets.all(Util.w(0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(
                  image,
                  package: '../assets/images/menu',
                ),
                size: Util.w(25),
                color: Colors.white,
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Util.f(13),
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
