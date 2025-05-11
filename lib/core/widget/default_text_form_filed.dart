import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_light_color.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/utils/app_radius.dart';

class DefaultTextFormFiled extends StatelessWidget {
  const DefaultTextFormFiled({
    super.key,
    required this.label,
    required this.hint,
    this.validator,
    this.controller,
  });
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 13,
      cursorColor: AppLightColor.black,
      cursorWidth: 1,
      controller: controller,
      validator: validator,
      style: AppTextStyle.extraLight14(AppLightColor.black),
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        fillColor: AppLightColor.white,
        filled: true,
        labelStyle: AppTextStyle.extraLight14(AppLightColor.grey),
        hintStyle: AppTextStyle.extraLight14(AppLightColor.grey),
        border: outlineInputBorder(),
        disabledBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
        borderSide: BorderSide(
          color: AppLightColor.greyBorder,
        ),
        borderRadius: AppRadius.buttonRaduis,
      );
}
