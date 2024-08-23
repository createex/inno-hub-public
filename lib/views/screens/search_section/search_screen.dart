import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_textformfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final RxList<String> titles = <String>[
    "Users",
    "Posts",
    'Videos',
    'Startups',
  ].obs;
  final TextEditingController searchController=TextEditingController();
  final RxInt isSelected=0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(
            children: [
              SizedBox(height: 5.h), // Adjust spacing as needed
              Row(
                children: [
                  SizedBox(
                    width: 1.2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.headingColor,
                      size: 2.6.h,
                    ),
                  ),
                  SizedBox(
                    width: 1.5.h,
                  ),
                  // getHorizontalSpace(2.w),
                  Expanded(
                    child: SearchCustomTextFormField(
                      controller: searchController,
                      hintText: 'Search',
                      prefixIcon: SvgPicture.asset("assets/svgs/search.svg"),
                      readOnly: false,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.4.h,
              ),
              searchController.text.isNotEmpty?Container(
              width: MediaQuery.of(context).size.width,
              height: 6.h,
              padding: EdgeInsets.symmetric(vertical: 1.h),
              color: const Color(0xffF5F5F5),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: titles.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    child: GestureDetector(
                      onTap: () {
                        isSelected.value=index;
                      },
                      child: Obx(() =>
                       Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: .8.h, vertical: .5.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.h),
                              border: Border.all(color: isSelected.value==index? AppColors.primaryColor:AppColors.greyColor)),
                          child: Text(
                            titles[index],
                            style: AppTextStyles.buttonTextStyle.copyWith(
                                color: isSelected.value==index? AppColors.primaryColor:AppColors.greyColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ):const SizedBox.shrink(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent',
                    style: AppTextStyles.buttonTextStyle.copyWith(
                        fontSize: 16.px,
                        fontWeight: FontWeight.w600,
                        color: AppColors.headingColor),
                  ),
                  Text(
                    'Clear All',
                    style: AppTextStyles.buttonTextStyle.copyWith(
                        fontSize: 16.px,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mohsin',
                          style: AppTextStyles.buttonTextStyle.copyWith(
                              fontSize: 14.px,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyColor),
                        ),
                        SvgPicture.asset("assets/svgs/cross.svg")
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
