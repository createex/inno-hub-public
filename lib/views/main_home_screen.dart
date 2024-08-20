import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_textformfield.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/utils/app_colors.dart';
import 'feed_bar.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h), // Adjust spacing as needed
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.h),
            child: Row(
              children: [
                Text("InnoHub", style: AppTextStyles.textSearchPrimaryColor),
                // getHorizontalSpace(2.w),
                Expanded(
                  child: SearchCustomTextFormField(
                    hintText: 'Search',
                    prefixIcon: SvgPicture.asset("assets/svgs/search.svg"),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 2.h), // Space before the TabBar
          Expanded(
            child: DefaultTabController(
              length: 2, // Number of tabs
              child: Column(
                children: [
                  // Tab bar
                  Container(
                    width: double.infinity,
                    color: AppColors.greyColor3,
                    child: Align(alignment:Alignment.center ,
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 4.h),
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 2.0,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: AppTextStyles.textPrimaryColor,
                        unselectedLabelColor: AppColors.greyColor1,
                        tabs: const [
                          Tab(text: "Feeds"),
                          Tab(text: "You follow"),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h), // Space between TabBar and TabBarView
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Content for Tab 1
                        const FeedsScreen(),
                        // RentedScreen(),
                        // Content for Tab 2
                        Container()
                        // RentedHistoryScreen(),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}