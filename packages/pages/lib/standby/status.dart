import 'package:flutter/material.dart';
import 'package:utility/color.dart';

class Status extends StatelessWidget {
  final String name;
  final String status;

  const Status({
    required this.name,
    required this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$name:'),
        Text(
          status,
          style: TextStyle(
            color: ColorEntries().orange,
          ),
        ),
      ],
    );
  }
}
