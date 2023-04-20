import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow(
      {super.key,
      required this.keyText,
      required this.value,
      this.style,
      this.cardColor});

  final String keyText;
  final String value;
  final TextStyle? style;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              keyText,
              style: style,
            ),
            Text(
              value,
              style: style,
            )
          ],
        ),
      ),
    );
  }
}
