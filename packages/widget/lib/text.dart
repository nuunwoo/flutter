import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String text;

  const TextBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (_, __) => Text(text),
      material: (_, __) => Text(text),
    );
  }
}
