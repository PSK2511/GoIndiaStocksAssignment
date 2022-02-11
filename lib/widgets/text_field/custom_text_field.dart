import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks/app/theme/app_colors.dart';
import 'package:stocks/app/theme/styles.dart';
import 'package:stocks/utils/helper/text_field_wrapper.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int? maxLength;
  final TextInputType inputType;
  final TextFieldWrapper wrapper;
  final bool isEnabled;

  CustomTextField({
    required this.wrapper,
    required this.hintText,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        controller: wrapper.controller,
        style: Styles.tsBlackRegular18,
        maxLength: maxLength,
        keyboardType: inputType,
        enabled: isEnabled,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          counterText: '',
          fillColor: AppColors.white,
          filled: true,
          hintText: hintText,
          enabled: isEnabled,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: AppColors.lightGrey, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: AppColors.lightGrey, width: 2)),
        ),
      ),
    );
  }
}
