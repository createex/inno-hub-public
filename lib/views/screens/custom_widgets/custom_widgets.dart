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
  String? suffix,
  Widget? lineImage,
  double? width,
  double? horizentalPadding,
  double? verticalPadding,
  String? tooltipMessage, // Add this parameter to provide tooltip text
}) {
  return TextFormField(
    controller: controller,
    readOnly: readOnly ?? false,
    keyboardType: keyBoardType,
    // maxLines: maxLine,
    cursorColor: AppColors.primaryColor,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.h),
      ),
      hintText: title ?? 'Email',
      hintStyle: AppTextStyles.hintTextStyle,
      filled: true,
      fillColor: bgColor ?? AppColors.whiteColor,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.h),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.h),
        borderSide: BorderSide(color: borderColor ?? AppColors.borderColor),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizentalPadding ?? 1.2.h,
        vertical: verticalPadding ?? 2.2.h,
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
      suffixIcon: suffix != null
          ? GestureDetector(
              onTap: () {
                // Handle tap on the suffix icon (tooltip is shown automatically)
              },
              child: Tooltip(
                preferBelow: false, // Aligns the tooltip above the widget
                verticalOffset: 10,
                // Adjusts the vertical position
                margin: const EdgeInsets.only(left: 200, right: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  color: Color(0xFFCEF3DB),
                ),
                message: tooltipMessage ?? "Tooltip",
                textStyle: const TextStyle(
                    color: Colors.black), // Display the tooltip message
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: SvgPicture.asset(
                    fit: BoxFit.contain,
                    suffix,
                  ),
                ),
              ),
            )
          : null,
    ),
  );
}
//

Widget customTextFormFieldProfile({
  TextEditingController? controller,
  String? title,
  Callback? onTap,
  bool? readOnly,
  TextInputType? keyBoardType,
  int? maxLine,
  Color? bgColor,
  Color? borderColor,
  Widget? lineImage,
  double? width,
  double? horizentalPadding,
  double? verticalPadding,
  String? tooltipMessage, // Add this parameter to provide tooltip text
}) {
  return TextFormField(
    controller: controller,
    readOnly: readOnly ?? false,
    keyboardType: keyBoardType,
    maxLines: maxLine,
    cursorColor: AppColors.primaryColor,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.h),
      ),
      hintText: title ?? 'Email',
      hintStyle: AppTextStyles.hintTextStyle,
      filled: true,
      fillColor: bgColor ?? AppColors.whiteColor,
      isCollapsed: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.h),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.h),
        borderSide: BorderSide(color: borderColor ?? AppColors.borderColor),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizentalPadding ?? 1.2.h,
        vertical: verticalPadding ?? 1.3.h,
      ),

    ),
  );
}

Widget customTextFormFieldProfile2({
  TextEditingController? controller,
  String? title,
  Callback? onTap,
  bool? readOnly,
  TextInputType? keyBoardType,
  int? maxLine,
  Color? bgColor,
  Color? borderColor,
  Widget? lineImage,
  double? width,
  double? horizentalPadding,
  double? verticalPadding,
  String? tooltipMessage, // Add this parameter to provide tooltip text
  Function(String)? onChanged, // Add this parameter to detect input changes
}) {
  return TextFormField(
    controller: controller,
    readOnly: readOnly ?? false,
    keyboardType: keyBoardType,
    maxLines: maxLine,
    cursorColor: AppColors.primaryColor,
    onChanged: onChanged, // Detect input changes
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.h),
      ),
      hintText: title ?? 'Email',
      hintStyle: AppTextStyles.hintTextStyle,
      filled: true,
      fillColor: bgColor ?? AppColors.whiteColor,
      isCollapsed: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.h),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.h),
        borderSide: BorderSide(color: borderColor ?? AppColors.borderColor),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizentalPadding ?? 1.2.h,
        vertical: verticalPadding ?? 1.3.h,
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
        borderSide:
            BorderSide(color: focusBorderColor ?? AppColors.primaryColor),
        borderRadius: BorderRadius.circular(1.h),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor, width: 1.3),
        borderRadius: BorderRadius.circular(1.h),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.h),
        borderSide: BorderSide(color: AppColors.borderColor, width: 1.3),
      ),
      filled: true,
      fillColor: bgColor ?? AppColors.whiteColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 1.6.h, vertical: 1.2.h),
    ),
  );
}

//ElevatedButton
Widget customElevatedButton({
  Widget? title,
  Color? bgColor,
  Color? borderColor,
  double? width,
  double? height,
  double? borderRadius,
  Callback? onTap,
}) {
  return SizedBox(height: 45,
    child: ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 3.h),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 2,
            ),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          bgColor ?? AppColors.primaryColor,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: title,
      ),
    ),
  );
}

