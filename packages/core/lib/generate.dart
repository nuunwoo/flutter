import 'package:flutter/material.dart';

class Generate extends StatelessWidget {
  const Generate({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const Generate());
  }

  @override
  Widget build(BuildContext context) {
    print('Generate');
    return Scaffold(
      body: ColoredBox(
        color: Colors.black,
        child: Center(
          child: Image.asset(
            'ic_greenit_logo.png',
            package: '../assets/images',
          ),
        ),
      ),
    );
  }
}
