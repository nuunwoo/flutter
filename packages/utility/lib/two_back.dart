import 'package:flutter/material.dart';
import 'package:utility/color.dart';
import 'package:utility/util.dart';

Future<dynamic> twoBackDialog(context, players) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) => TowBack(players),
  );
}

class TowBack extends StatefulWidget {
  final List<Map<String, String>> players;
  const TowBack(this.players, {super.key});

  @override
  State<TowBack> createState() => _TowBackState();
}

class _TowBackState extends State<TowBack> {
  List<bool> checked = [];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.players.length; i++) {
      checked.add(false);
    }
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Util.w(7.5)),
      ),
      child: SizedBox(
        width: Util.w(557),
        height: Util.h(331.5),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: Util.h(64.5),
              decoration: BoxDecoration(
                color: ColorEntries().banner,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Util.w(7.5)),
                  topRight: Radius.circular(Util.w(7.5)),
                ),
              ),
              child: Text(
                '2백선택',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Util.f(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: Util.h(15)),
            Container(
              width: Util.w(314),
              height: Util.h(157),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                border: Border.all(color: ColorEntries().border),
                borderRadius: BorderRadius.circular(Util.w(9)),
              ),
              child: Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: widget.players.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: Util.h(44),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: Util.w(14)),
                                        Container(
                                          width: Util.w(27),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color:
                                                ColorEntries().tabBarController,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            widget.players[index]['seq']
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Util.f(15),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: Util.w(24.5)),
                                        Text(
                                          '${widget.players[index]['name']}',
                                          style: TextStyle(
                                            fontSize: Util.f(18),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.6,
                                          child: Checkbox(
                                              activeColor:
                                                  const Color(0xFFE39841),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              side: const BorderSide(width: 0),
                                              value: checked[index],
                                              onChanged: (onChanged) =>
                                                  setState(() {
                                                    checked[index] =
                                                        !checked[index];
                                                  })),
                                        ),
                                        SizedBox(width: Util.w(25)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              index < widget.players.length - 1
                                  ? const Divider()
                                  : const SizedBox(),
                            ],
                          ),
                        )),
              ),
            ),
            SizedBox(height: Util.h(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfff5f5f5),
                    side: BorderSide(color: ColorEntries().border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Util.w(7.5)),
                    ),
                  ),
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Util.w(7.5)),
                    ),
                    width: Util.w(100),
                    height: Util.h(40),
                    child: Center(
                      child: Text(
                        '닫기',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Util.f(13),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Util.w(40)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorEntries().black,
                    side: BorderSide(color: ColorEntries().border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Util.w(7.5)),
                    ),
                  ),
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Util.w(7.5)),
                    ),
                    width: Util.w(100),
                    height: Util.h(40),
                    child: Text(
                      '저장',
                      style: TextStyle(
                        fontSize: Util.f(13),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
