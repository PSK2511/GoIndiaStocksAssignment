import 'package:flutter/material.dart';
import 'package:stocks/app/theme/styles.dart';

class PrimaryFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final TextStyle style;

  PrimaryFilledButton({
    required this.text,
    required this.onTap,
    required this.color,
    this.style = Styles.tsWhiteRegular18,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 10.0),
        child: Text(
          text,
          style: style,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  }
}
