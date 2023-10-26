import 'package:flutter/material.dart';
import 'package:pages/standby/status_bar.dart';
import 'package:utility/color.dart';
import 'package:utility/util.dart';
import 'package:widget/menu_button.dart';

class Standby extends StatefulWidget {
  const Standby({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const Standby());
  }

  @override
  State<Standby> createState() => _StandbyState();
}

class _StandbyState extends State<Standby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorEntries().background,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const Positioned(
              child: StatusBar(),
            ),
            Positioned(
              right: Util.w(7),
              top: Util.h(68.5),
              child: const CartNo(),
            ),
            Positioned(
              top: Util.h(119),
              left: Util.w(7),
              child: const Billboard(),
            ),
            Positioned(
              left: Util.w(7),
              bottom: Util.h(5),
              child: const MenuButton(),
            ),
            Positioned(
              left: Util.w(289.5),
              bottom: Util.h(13),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: Util.w(125),
                        height: Util.h(30),
                        decoration: BoxDecoration(
                          color: ColorEntries().orange,
                          borderRadius: BorderRadius.circular(Util.w(5)),
                        ),
                        child: Text(
                          'TeeTime',
                          style: TextStyle(
                            fontSize: Util.f(20),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '스카이',
                        style: TextStyle(
                          fontSize: Util.f(47),
                          height: Util.h(0.75),
                          letterSpacing: Util.w(-2.38),
                        ),
                      )
                    ],
                  ),
                  Text(
                    '08:36',
                    style: TextStyle(
                      fontSize: Util.f(89),
                      letterSpacing: Util.w(-4.45),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Billboard extends StatelessWidget {
  const Billboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.w(946),
      height: Util.h(319),
      padding: EdgeInsets.all(Util.w(5)),
      decoration: BoxDecoration(
        color: ColorEntries().black16,
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
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
      ),
    );
  }
}

class CartNo extends StatelessWidget {
  const CartNo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.w(437),
      height: Util.h(55),
      decoration: BoxDecoration(
        color: ColorEntries().banner,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Util.w(9)),
          topRight: Radius.circular(Util.w(9)),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: Util.w(17.5)),
          Text(
            'Cart No.',
            style: TextStyle(
              fontSize: Util.f(32),
              color: Colors.white,
            ),
          ),
          Text(
            ' 005',
            style: TextStyle(
              fontSize: Util.f(32),
              color: ColorEntries().orange,
            ),
          ),
          SizedBox(width: Util.w(17.3)),
          Container(
            width: Util.w(1),
            height: Util.h(30),
            color: Colors.white,
          ),
          SizedBox(width: Util.w(56.8)),
          SizedBox(
            width: Util.w(13),
            child: Text(
              'PM',
              style: TextStyle(
                fontSize: 18,
                color: ColorEntries().orange,
              ),
              overflow: TextOverflow.visible,
            ),
          ),
          SizedBox(width: Util.w(4.5)),
          Text(
            '13:45',
            style: TextStyle(
              fontSize: Util.f(35),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
