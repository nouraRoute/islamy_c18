import 'package:flutter/material.dart';
import 'package:islamy/common/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintText, this.prefixIcon});
  final String hintText;
  final Widget? prefixIcon;
  final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.goldColor),
  );
  @override
  Widget build(BuildContext context) {
    return TextField(
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
