//CustomTextFormField
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
Widget customTextFormField({
  TextEditingController? controller,
  String? title,
  Callback? onTap,
  bool? readOnly,
  TextInputType? keyBoardType,
  int? maxLine,
  Color? bgColor,
  Color? borderColor,
  String? prefix,
  Widget? lineImage,
  double? width,
  double? horizentalPadding,
  double? verticalPadding,
}) {
  return TextFormField(
    controller: controller,
    readOnly: readOnly ?? false,
    keyboardType: keyBoardType,
    maxLines: maxLine,
    cursorColor: AppColors.primaryColor,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.h),
      ),
      hintText: title ?? 'Email',
      hintStyle: AppTextStyles.hintTextStyle,
      filled: true,
      fillColor: bgColor ?? AppColors.whiteColor,
      isCollapsed: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.h),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.h),
        borderSide: BorderSide(color: borderColor ?? AppColors.borderColor),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizentalPadding ?? 1.2.h,
        vertical: verticalPadding ?? 1.3.h,
      ),
      prefixIcon: SizedBox(
        height: 2.4.h,
        width: width ?? 2.4.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(child: SizedBox()),
            Transform.scale(
              scale: .10.h,
              child: SvgPicture.asset(prefix ?? 'assets/svgs/email.svg'),
            ),
            const Expanded(child: SizedBox()),
            lineImage ??
                Transform.scale(
                  scale: .13.h,
                  child: SvgPicture.asset('assets/svgs/verticalline.svg'),
                ),
            const Expanded(child: SizedBox())
          ],
        ),
      ),
    ),
  );
}
Widget customTextFormField1(
    {String? title,
    TextEditingController? controller,
    TextInputType? keyboardType,
    int? maxLine,
    String? errorText,
    Color? focusBorderColor,
    Color? bgColor,
    Color? borderColor,
    String? prefix,
    Widget? prefixIcons,
    bool? readOnly,
      double? width,
      double? height,
    Callback? onTap}) {
  return TextFormField(
    onTap: onTap,
    readOnly: readOnly ?? false,
    maxLines: maxLine ?? 1,
    keyboardType: keyboardType,
    controller: controller,
    cursorColor: AppColors.primaryColor,
    decoration: InputDecoration(
      hintText: title,
      prefixText: prefix,
      prefixStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: const Color(0xff292D32),
        fontFamily: 'bold',
        fontSize: 16.px,
      ),
      hintStyle: AppTextStyles.hintTextStyle,
      isCollapsed: true,
      labelText: errorText,
      labelStyle: TextStyle(
        fontSize: 15.sp,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w400,
        fontFamily: 'regular',
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: focusBorderColor ?? AppColors.primaryColor),
        borderRadius: BorderRadius.circular(3.h),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor,
            width: 1.3),
        borderRadius: BorderRadius.circular(3.h),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(3.h),
        borderSide:  BorderSide(color: AppColors.borderColor,
        width: 1.3),
      ),
      filled: true,
      fillColor: bgColor ?? AppColors.whiteColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 1.6.h, vertical: 1.2.h),
    ),
  );
}
//ElevatedButton
Widget customElevatedButton(
    {Widget? title,
      Color? bgColor,
      double? width,
      double? borderRadius,
      Callback? onTap}) {
  return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4.h))),
        backgroundColor:
        WidgetStatePropertyAll(bgColor ?? AppColors.primaryColor),

      ),
      child: title);
}