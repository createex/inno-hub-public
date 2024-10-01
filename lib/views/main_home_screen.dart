import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/app_keys.dart';
import 'package:in_hub/views/screens/chat_section/main_chat.dart';
import 'package:in_hub/views/screens/search_section/search_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/utils/app_colors.dart';
import 'feed_bar.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h), // Adjust spacing as needed
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Row(
              children: [
                // GestureDetector(
                //     onTap: () {
                //       AppKeys.scaffoldKey.currentState?.openDrawer();
                //     },
                //     child: Image.asset('assets/pngs/Ellipse 41.png',)),
                GestureDetector(onTap: () {
                  AppKeys.scaffoldKey.currentState?.openDrawer();
                },
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/pngs/iqrapro.png"),
                    radius: 20,
                  ),
                ),

                Spacer(),
                Image.asset("assets/pngs/innoHubLogo.png"),
                // getHorizontalSpace(2.w),
                // Expanded(
                //   child: SearchCustomTextFormField(
                //     onTap: () {
                //       Get.to(() => SearchScreen());
                //     },
                //     readOnly: true,
                //     hintText: 'Search',
                //     controller: searchController,
                //     suffixIcon: SvgPicture.asset("assets/svgs/search.svg"),
                //   ),
                // ),
                Spacer(),
                GestureDetector(onTap: () {
                  Get.to(() =>  SearchScreen());

                },
                    child: SvgPicture.asset("assets/svgs/innoHubSearch.svg")),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 1),
                  child: GestureDetector(
                      onTap: () {
                        Get.to(() => const MainChatScreen());
                      },
                      child: Image.asset('assets/pngs/bxs_chat.png',)),
                )
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
                    child: Align(
                      alignment: Alignment.center,
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        // padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                        // indicatorPadding: EdgeInsets.symmetric(horizontal: 4.h),
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
                  const Expanded(
                    child: TabBarView(
                      children: [
                        // Content for Tab 1
                        FeedsScreen(),
                        // RentedScreen(),
                        // Content for Tab 2
                        FeedsScreen()
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
