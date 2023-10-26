import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:utility/color.dart';
import 'package:utility/two_back.dart';
import 'package:utility/util.dart';

class ReservationInfo extends StatelessWidget {
  ReservationInfo({super.key});

  List<Map<String, String>> item = [
    {'name': '예약코스', 'value': 'East'},
    {'name': '예약시간', 'value': '22:18'},
    {'name': '캐디', 'value': '조윤주(40)'},
    {'name': '카트', 'value': '40'},
  ];
  List<Map<String, String>> players = [
    {'seq': '1', 'gender': '남', 'name': '김그린잇'},
    {'seq': '2', 'gender': '여', 'name': '최프로'},
    {'seq': '3', 'gender': '남', 'name': '박프로'},
    {'seq': '4', 'gender': '남', 'name': '홍프로'},
    {'seq': '5', 'gender': '남', 'name': '유프로'},
  ];
  List<String> tableColumn = [
    '코스명',
    '시작시간',
    '종료시간',
    '경과시간',
    '대기시간',
    '총시간',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorEntries().background,
      padding: EdgeInsets.fromLTRB(Util.w(9), 0, Util.w(9), 0),
      child: Column(
        children: [
          SizedBox(height: Util.h(66)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 8,
                child: Column(
                  children: [
                    Container(
                      height: Util.h(43.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorEntries().banner,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Util.w(7.5)),
                          topRight: Radius.circular(Util.w(7.5)),
                        ),
                      ),
                      child: Text(
                        "예약정보",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Util.f(20),
                        ),
                      ),
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: Util.f(20),
                        color: Colors.black,
                      ),
                      child: Column(
                        children: item
                            .mapIndexed(
                              (index, element) => Container(
                                height: Util.h(37.5),
                                decoration: BoxDecoration(
                                  color: index % 2 == 1
                                      ? ColorEntries().textfield
                                      : null,
                                  border: Border.all(
                                    color: ColorEntries().border,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: Util.w(40)),
                                    SizedBox(
                                      width: Util.w(114),
                                      child: Text(element['name'].toString()),
                                    ),
                                    SizedBox(width: Util.w(40.5)),
                                    Text(element['value'].toString()),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: Util.w(10)),
              Flexible(
                flex: 7,
                child: Column(
                  children: [
                    Container(
                      height: Util.h(43.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorEntries().banner,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Util.w(7.5)),
                          topRight: Radius.circular(Util.w(7.5)),
                        ),
                      ),
                      child: Text(
                        "내장정보",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Util.f(20),
                        ),
                      ),
                    ),
                    Column(
                      children: players
                          .mapIndexed(
                            (index, element) => Container(
                              height: Util.h(37.5),
                              decoration: BoxDecoration(
                                color: index % 2 == 1
                                    ? ColorEntries().textfield
                                    : null,
                                border: Border.all(
                                  color: ColorEntries().border,
                                ),
                              ),
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: Util.f(15),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: Util.w(25)),
                                    Container(
                                      width: Util.w(27),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ColorEntries().tabBarController,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(element['seq'].toString()),
                                    ),
                                    SizedBox(width: Util.w(10.5)),
                                    Container(
                                      width: Util.w(27),
                                      height: Util.w(27),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: element['gender'].toString() ==
                                                  '남'
                                              ? Color(0xff40c5f7)
                                              : Color(0xffe01313),
                                          borderRadius: BorderRadius.circular(
                                              Util.w(7.5))),
                                      child: Text(element['gender'].toString()),
                                    ),
                                    SizedBox(width: Util.w(35)),
                                    Text(
                                      element['name'].toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Util.f(20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Util.h(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: Util.w(100),
                height: Util.h(40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorEntries().banner,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Util.w(7.5)),
                    ),
                  ),
                  onPressed: () => twoBackDialog(context, players),
                  child: Text(
                    '2백선택',
                    style: TextStyle(
                      fontSize: Util.f(13),
                    ),
                  ),
                ),
              ),
              SizedBox(width: Util.w(15)),
              SizedBox(
                width: Util.w(100),
                height: Util.h(40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorEntries().banner,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Util.w(7.5)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    '이름변경',
                    style: TextStyle(
                      fontSize: Util.f(13),
                    ),
                  ),
                ),
              ),
              SizedBox(width: Util.w(15)),
              SizedBox(
                width: Util.w(100),
                height: Util.h(40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorEntries().banner,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Util.w(7.5)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    '타순변경',
                    style: TextStyle(
                      fontSize: Util.f(13),
                    ),
                  ),
                ),
              ),
              SizedBox(width: Util.w(23.5)),
            ],
          ),
          SizedBox(height: Util.h(10)),
          TableDesk(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Util.w(9)),
                topRight: Radius.circular(Util.w(9)),
              ),
              side: BorderSide(width: 1, color: ColorEntries().border),
            ),
            child: TableDeskRow(
              border: BorderSide(width: 1, color: ColorEntries().border),
              gaps: [
                TableGap.weight(),
              ],
              children: [
                TableDeskColumn(
                  border: BorderSide(width: 0.5, color: ColorEntries().border),
                  children: [
                    TableDeskRow(
                      border:
                          BorderSide(width: 0.5, color: ColorEntries().border),
                      gaps: [
                        TableGap.weight(),
                        TableGap.weight(),
                        TableGap.weight(),
                        TableGap.weight(),
                        TableGap.weight(),
                        TableGap.weight(),
                      ],
                      children: tableColumn
                          .mapIndexed(
                            (i, e) => Container(
                              alignment: Alignment.center,
                              height: Util.h(43.5),
                              decoration: BoxDecoration(
                                  color: ColorEntries().banner,
                                  borderRadius: i == 0
                                      ? BorderRadius.only(
                                          topLeft: Radius.circular(Util.w(9)),
                                        )
                                      : i == tableColumn.length - 1
                                          ? BorderRadius.only(
                                              topRight:
                                                  Radius.circular(Util.w(9)),
                                            )
                                          : null),
                              child: Text(
                                e,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Util.f(20),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: Util.f(20),
                        color: Colors.black,
                      ),
                      child: TableDeskRow(
                        border: BorderSide(
                            width: 0.5, color: ColorEntries().border),
                        gaps: [
                          TableGap.width(Util.w(60)),
                          TableGap.width(Util.w(98)),
                          TableGap.weight(),
                          TableGap.weight(),
                          TableGap.weight(),
                          TableGap.weight(),
                          TableGap.weight(),
                        ],
                        children: [
                          TableDeskColumn(
                            border: BorderSide(
                                width: 0.5, color: ColorEntries().border),
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: Util.h(43.5),
                                color: const Color(0xfff3faff),
                                child: const Text('전반'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: Util.h(43.5),
                                color: const Color(0xfff3faff),
                                child: const Text('후반'),
                              ),
                            ],
                          ),
                          TableDeskColumn(
                            border: BorderSide(
                                width: 0.5, color: ColorEntries().border),
                            children: const [
                              Center(
                                child: Text('East'),
                              ),
                              Center(
                                child: Text('West'),
                              ),
                            ],
                          ),
                          TableDeskColumn(
                            border: BorderSide(
                                width: 0.5, color: ColorEntries().border),
                            children: const [
                              Center(
                                child: Text('00:00'),
                              ),
                              Center(
                                child: Text('00:00'),
                              ),
                            ],
                          ),
                          TableDeskColumn(
                            border: BorderSide(
                                width: 0.5, color: ColorEntries().border),
                            children: const [
                              Center(
                                child: Text('00:00'),
                              ),
                              Center(
                                child: Text('00:00'),
                              ),
                            ],
                          ),
                          TableDeskColumn(
                            border: BorderSide(
                                width: 0.5, color: ColorEntries().border),
                            children: const [
                              Center(
                                child: Text('00:00'),
                              ),
                              Center(
                                child: Text('00:00'),
                              ),
                            ],
                          ),
                          const Center(
                            child: Text('00:00'),
                          ),
                          const Center(
                            child: Text('00:00'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
