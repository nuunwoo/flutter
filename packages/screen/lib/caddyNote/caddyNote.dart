import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:screen/caddyNote/reservationInfo.dart';
import 'package:utility/color.dart';
import 'package:utility/util.dart';

Future<dynamic> caddyNoteDialog(context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) => const CaddyNote(),
  );
}

class CaddyNote extends StatefulWidget {
  const CaddyNote({super.key});

  @override
  State<CaddyNote> createState() => _CaddyNoteState();
}

class _CaddyNoteState extends State<CaddyNote>
    with SingleTickerProviderStateMixin {
  var menuItems = [
    "예약정보",
    "클럽수량",
    "클럽사진",
  ];

  late TabController tabController = TabController(
    length: menuItems.length,
    vsync: this,
  );

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    tabController.addListener(() {
      setState(() => currentIndex = tabController.index);
    });

    return DefaultTabController(
      length: menuItems.length,
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              TabBarView(
                controller: tabController,
                children: [
                  ReservationInfo(),
                  ReservationInfo(),
                  ReservationInfo(),
                ],
              ),
              Container(
                width: double.infinity,
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
                            "ic_user_edit.png",
                            package: '../assets/images/title',
                          ),
                          size: Util.w(22.5),
                          color: Colors.white,
                        ),
                        Text(
                          " 캐디수첩",
                          style: TextStyle(
                            fontSize: Util.f(20),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Util.w(350),
                          child: TabBar(
                            controller: tabController,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(Util.w(7.5)),
                              // color: ColorEntries().orange,
                            ),
                            padding: EdgeInsets.zero,
                            tabs: menuItems
                                .mapIndexed(
                                  (i, e) => TabBarTab(e, i, currentIndex),
                                )
                                .toList(),
                          ),
                        ),
                        SizedBox(width: Util.w(43)),
                      ],
                    ),
                  ],
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
              Positioned(
                right: Util.w(202.5),
                bottom: Util.h(20.5),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorEntries().banner,
                    padding: EdgeInsets.all(Util.w(0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Util.w(7.5)),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: Util.w(100),
                    height: Util.h(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage(
                            "ic_export.png",
                            package: '../assets/images/menu',
                          ),
                          size: Util.w(22.5),
                          color: Colors.white,
                        ),
                        Text(
                          ' 저장',
                          style: TextStyle(
                            color: const Color(0xffffffff),
                            fontSize: Util.f(13),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarTab extends StatelessWidget {
  final String menuName;
  final int index;
  final int currentIndex;
  const TabBarTab(
    this.menuName,
    this.index,
    this.currentIndex, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        width: Util.w(90),
        height: Util.h(37.5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: Util.w(1),
          ),
          borderRadius: BorderRadius.circular(Util.w(7.5)),
          color: index == currentIndex
              ? ColorEntries().orange
              : ColorEntries().tabBarController,
        ),
        child: Align(
          child: Text(
            menuName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: Util.f(20),
            ),
          ),
        ),
      ),
    );
  }
}
