import 'package:flutter/material.dart';
import 'package:in_hub/views/screens/dammy_chat/sized_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'custom_color.dart';
import 'custom_textstyle.dart';
class SiteVisitProposal1 extends StatelessWidget {
  final String siteVisitTitle;
  final String bankName;
  final String accountTitle;
  final String iBAN;
  const SiteVisitProposal1({
    super.key,
    required this.siteVisitTitle,
    required this.bankName,
    required this.accountTitle,
    required this.iBAN,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0XFFECECEC)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Text(
                siteVisitTitle,
                style: CustomTextStyle.textBlack1.copyWith(
                  fontSize: 18.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "Confirm",
                style: CustomTextStyle.textLoginOrange,
              ),
            ],
          ),
          Divider(color: CustomColor.greyColor),
          SizedBox(height: 1.h), // Responsive vertical spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Bank Name',
              style: CustomTextStyle.textBank,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              bankName,
              style: CustomTextStyle.textAccountBlack,
            ),
          ),
          SizedBox(height: 1.h), // Responsive vertical spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Account Title',
              style: CustomTextStyle.textBank,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              accountTitle,
              style: CustomTextStyle.textAccountBlack,
            ),
          ),
          SizedBox(height: 1.h), // Responsive vertical spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'IBAN',
              style: CustomTextStyle.textBank,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              iBAN,
              style: CustomTextStyle.textAccountBlack,
            ),
          ),
          SizedBox(height: 1.h), // Responsive vertical spacing
          Row(
            children: [
              Text(
                'Amount',
                style: CustomTextStyle.textAccountBlack1,
              ),
              getHorizontalSpace(2.w),
              Text(
                "\$23.0",
                style: CustomTextStyle.textLoginOrange,
              ),
            ],
          ),

        ],
      ),
    );
  }
}


// SiteVisitProposal(
// siteVisitTitle: 'Site Visit Proposal',
// siteVisitStartDate: '12/2/2024',
// siteVisitEndDate: '15/4/2024',
// siteVisitCharges: '15\$',
// )