import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:screen/course/courseInfo.dart';
import 'package:utility/color.dart';
import 'package:utility/util.dart';

Future<dynamic> courseDialog(context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) => const CourseDialog(),
  );
}

class CourseDialog extends StatefulWidget {
  const CourseDialog({super.key});

  @override
  State<CourseDialog> createState() => _CourseDialogState();
}

class _CourseDialogState extends State<CourseDialog>
    with SingleTickerProviderStateMixin {
  var courseNames = [
    "스카이",
    "팜",
    "레이크",
    "밸리",
  ];
  String courseName = "팜";
  late TabController tabController = TabController(
    length: courseNames.length,
    vsync: this,
  );

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (courseNames.indexWhere((element) => element == courseName) > 0) {
      setState(() {
        tabController.index =
            courseNames.indexWhere((element) => element == courseName);
        currentIndex =
            courseNames.indexWhere((element) => element == courseName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    tabController.addListener(() {
      setState(() => currentIndex = tabController.index);
    });

    return DefaultTabController(
      length: courseNames.length,
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              TabBarView(
                controller: tabController,
                children: courseNames
                    .mapIndexed((i, e) => TabBarContents(i, currentIndex))
                    .toList(),
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
                            "ic_course.png",
                            package: '../assets/images/title',
                          ),
                          size: Util.w(22.5),
                          color: Colors.white,
                        ),
                        Text(
                          " 코스소개",
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
                          width: Util.w(382.5),
                          child: TabBar(
                            controller: tabController,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(Util.w(7.5)),
                              // color: ColorEntries().orange,
                            ),
                            tabs: courseNames
                                .mapIndexed(
                                  (i, e) => TabBarTab(e, i, currentIndex),
                                )
                                .toList(),
                          ),
                        ),
                        SizedBox(width: Util.w(35)),
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
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarTab extends StatelessWidget {
  final String courseName;
  final int index;
  final int currentIndex;
  const TabBarTab(
    this.courseName,
    this.index,
    this.currentIndex, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
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
            courseName,
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

class TabBarContents extends StatelessWidget {
  final int index;
  final int currentIndex;

  const TabBarContents(
    this.index,
    this.currentIndex, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(53, 0, 0, 0),
      child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          spacing: Util.h(6),
          runSpacing: Util.h(3),
          children:
              List.generate(9, (hole) => CourseInfoButton(index, hole + 1))),
    );
  }
}

class CourseInfoButton extends StatelessWidget {
  final int course;
  final int hole;
  const CourseInfoButton(
    this.course,
    this.hole, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.w(310),
      height: Util.h(136),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorEntries().banner, ColorEntries().tabBarController],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(Util.w(7.5)),
      ),
      child: ElevatedButton(
        onPressed: () => courseInfoDialog(context, course, hole),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          "${hole}st HOLE\nPAR4",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Util.f(20),
          ),
        ),
      ),
    );
  }
}
