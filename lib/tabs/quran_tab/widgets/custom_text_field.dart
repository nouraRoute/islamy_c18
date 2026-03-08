import 'package:flutter/material.dart';
import 'package:islamy/common/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintText, this.prefixIcon, required this.controller, this.onChanged, this.onSubmitted, });
  final String hintText;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController controller;
  final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.goldColor),
  );
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        filled: true,

        fillColor: AppColors.blackColor.withValues(alpha: .7),
        hintText: hintText,
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        hintStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
