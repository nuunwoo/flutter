import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({required this.onPressed, required this.child, super.key});

  final Function onPressed;
  final Text child;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (_, __) => CupertinoButton(
        onPressed: () => onPressed(),
        child: child,
      ),
      material: (_, __) => ElevatedButton(
        onPressed: () => onPressed(),
        child: child,
      ),
    );
  }
}
