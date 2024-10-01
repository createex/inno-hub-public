import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_textformfield.dart';
import 'package:in_hub/views/screens/filter_section/filter_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final RxList<String> titles = <String>[
    "Users",
    "Posts",
    'Videos',
    'Startups',
  ].obs;

  final TextEditingController searchController = TextEditingController();

  final RxInt isSelected = 0.obs;

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
                  SizedBox(width: 1.2.h),
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
                  SizedBox(width: 1.5.h),
                  Expanded(
                    child: SearchCustomTextFormField(
                      controller: searchController,
                      hintText: 'Search',
                      prefixIcon: SvgPicture.asset("assets/svgs/search.svg"),
                      readOnly: false,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 2.h),

                  GestureDetector(onTap: () {
                    Get.to(()=>const FilterScreen());
                  },
                      child: SvgPicture.asset("assets/svgs/innoHubFilter.svg"))
                ],
              ),
              SizedBox(height: 2.4.h),
              searchController.text.isNotEmpty
                  ? Container(
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
                          isSelected.value = index;
                        },
                        child: Obx(
                              () => Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: .8.h, vertical: .5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.h),
                              border: Border.all(
                                  color: isSelected.value == index
                                      ? AppColors.primaryColor
                                      : AppColors.greyColor),
                            ),
                            child: Text(
                              titles[index],
                              style: AppTextStyles.buttonTextStyle.copyWith(
                                color: isSelected.value == index
                                    ? AppColors.primaryColor
                                    : AppColors.greyColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
                  : const SizedBox.shrink(),

              // Using GridView to show two items per row
              Expanded(
                child: GridView.builder(
                  itemCount: 4, // Set the number of items to display
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Show 2 items per row
                    crossAxisSpacing: 2.w,
                    mainAxisSpacing: 2.h,
                    childAspectRatio: 0.8, // Adjust the height of the containers
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyColor7),
                        borderRadius: BorderRadius.circular(16.px),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: const AssetImage("assets/pngs/pngprofile.png"),
                            radius: 40.px,
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            "Zeeshan",
                            style: TextStyle(
                              fontSize: 18.px,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0.5.h),
                          Text(
                            "Interests",
                            style: TextStyle(
                              fontSize: 14.px,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.greyColor2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.px),
                                  side: const BorderSide(
                                      color: AppColors.greenColor3, width: 1),
                                ),
                              ),
                              child: Text(
                                "Connect",
                                style: TextStyle(
                                    fontSize: 14.px, color: AppColors.greenColor3,overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
