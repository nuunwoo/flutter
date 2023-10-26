import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  const ColorBox({required this.color, required this.child, super.key});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (_, __) => ColoredBox(
        color: color,
        child: child,
      ),
      material: (_, __) => ColoredBox(
        color: color,
        child: child,
      ),
    );
  }
}
