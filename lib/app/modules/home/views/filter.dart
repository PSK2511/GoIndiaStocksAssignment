import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:stocks/app/theme/styles.dart';

class Filter extends StatelessWidget {
  final String title;
  final TextStyle style;
  final Color bgColor;
  final Color borderColor;
  final VoidCallback onTap;

  Filter({
    required this.title,
    required this.bgColor,
    required this.onTap,
    required this.style,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width / 3.6,
        height: Get.width / 8,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 2)),
        child: Center(
          child: Text(
            title,
            style: style,
          ),
        ),
      ),
    );
  }
}
