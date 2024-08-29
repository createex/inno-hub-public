import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/utils/app_colors.dart';

class SearchCustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool readOnly;
  final Callback onTap;
  final TextInputType keyboardType;
  final VoidCallback? onSuffixIconPressed;
  final TextEditingController controller;

  const SearchCustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onSuffixIconPressed,
    required this.readOnly,
    required this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        readOnly: readOnly,
        cursorColor: AppColors.primaryColor,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(bottom: 1.5.h, left: 12),
          // prefixIcon: Transform.scale(scale: 0.4, child: prefixIcon),

          prefixIcon: prefixIcon != null
              ? Transform.scale(
                  scale: 0.4,
                  child: prefixIcon,
                )
              : null,

          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 10.px,
              fontWeight: FontWeight.w400,
              color: AppColors.greyColor1),
          // contentPadding: EdgeInsets.all(4),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.shadowColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.shadowColor),
          ),
          suffixIcon: GestureDetector(
            onTap: onSuffixIconPressed,
            child: Transform.scale(scale: 0.4, child: suffixIcon),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
