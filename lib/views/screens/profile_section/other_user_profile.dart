import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/chat_section/chatroom_screen.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../models/static_model.dart';
import 'detail_screen.dart';
import 'message_post_details.dart';

class OtherUserProfile extends StatelessWidget {
  OtherUserProfile({super.key});
  // Initialize with static data
  final List<StaticModel> data = [
    StaticModel(
      profileImage: 'assets/pngs/iqrapro.png',
      name: 'Zeeshan',
      title: 'Hello World',
      time: '2 hours ago',
      desc:
          'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
    StaticModel(
      profileImage: 'assets/pngs/iqrapro.png',
      name: 'John Doe',
      title: 'Flutter is awesome!',
      time: '3 hours ago',
      desc:
          'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
    StaticModel(
      profileImage: 'assets/pngs/iqrapro.png',
      name: 'Jane Doe',
      title: 'Beautiful Day',
      time: '5 hours ago',
      desc:
          'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            GestureDetector(onTap:() {
              Get.back();
            } ,
                child: Icon(Icons.arrow_back_ios_new)),
            Text(
              "Profile",
              style: AppTextStyles.boldTextStyle
                  .copyWith(color: AppColors.headingColor, fontSize: 18.px),
            ),
            SizedBox(height: 10.px,width: 10.px,)
          ],
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: 2.h),
        //     child: GestureDetector(onTap: () {
        //       Get.to(()=> SettingScreen());
        //     },
        //         child: SvgPicture.asset("assets/svgs/setting.svg")),
        //   )
        // ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    height: MediaQuery.of(context).size.height * 0.186,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/pngs/image.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 1.h, top: 1.h),
                      child: SvgPicture.asset("assets/svgs/edit.svg"),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: MediaQuery.of(context).size.width*0.38,
                    right: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.whiteColor, width: 3)),
                            child: CircleAvatar(
                              radius: 4.5.h,
                              backgroundColor: Colors.transparent,
                              backgroundImage: const AssetImage(
                                "assets/pngs/profile.png",
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 1.5.h,
                            child: SvgPicture.asset(
                              "assets/svgs/camera.svg",
                              width: 2.h, // Adjust this value as needed
                              height: 2.h, // Adjust this value as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: .8.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Mohsin Ali Raza",
                        style: AppTextStyles.boldTextStyle.copyWith(
                          color: const Color(0xff424348),
                          fontSize: 14.px,
                        ),
                      ),
                      SizedBox(
                        width: .4.h,
                      ),
                      Text(
                        "Username",
                        style: TextStyle(
                          color:Colors.green,
                          fontSize: 14.px,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: .4.h,
                  ),
                  Center(
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Createex :",
                          style: AppTextStyles.boldTextStyle.copyWith(
                            color: const Color(0xff424348),
                            fontSize: 14.px,fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          "UI/UX Designer",
                          style: TextStyle(
                            color: const Color(0xff424348),
                            fontSize: 13.px,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: .4.h,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svgs/location1.svg"),
                      SizedBox(width: .4.h,),
                      Text(
                        "Lahore,Pakistan",
                        style: AppTextStyles.boldTextStyle.copyWith(
                            color: const Color(0xff424348),
                            fontSize: 14.px,fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text("32", style: AppTextStyles.blackColorInno),
                              Text("Connects", style: AppTextStyles.greyColorFollower),
                            ],
                          ),
                          Column(
                            children: [
                              Text("1.1M", style: AppTextStyles.blackColorInno),
                              Text("Followers", style: AppTextStyles.greyColorFollower),
                            ],
                          ),
                          Column(
                            children: [
                              Text("200", style: AppTextStyles.blackColorInno),
                              Text("Following", style: AppTextStyles.greyColorFollower),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(height: 36.px,
                          child: customElevatedButton(
                              bgColor: AppColors.primaryColor,
                              onTap: () {
                                // Get.to(() => const BottomNavigationScreen());
                              },
                              // title:authController.isLoading.value?buttonLoading:
                              title: Text(
                                'Connect',
                                style: AppTextStyles.buttonTextStyle,
                              )),
                        ),
                      ),
                      SizedBox(width: 2.h,),
                      Expanded(
                        child: SizedBox(height: 36.px,
                          child: customElevatedButton(
                              bgColor: AppColors.primaryColor,
                              onTap: () {
                                // Get.to(() => const BottomNavigationScreen());
                              },
                              // title:authController.isLoading.value?buttonLoading:
                              title: Text(
                                'Follow',
                                style: AppTextStyles.buttonTextStyle,
                              )),
                        ),
                      ),
                      SizedBox(width: 2.h,),
                      Expanded(
                        child: SizedBox(height: 36.px,
                          child: customElevatedButton(
                              borderColor: AppColors.primaryColor,
                              bgColor: Theme.of(context).scaffoldBackgroundColor,
                              onTap: () {
                                Get.to(() =>  ChatroomScreen(userName: "userName"));
                              },
                              // title:authController.isLoading.value?buttonLoading:
                              title: Text(
                                'Message',
                                style: AppTextStyles.buttonTextStyle
                                    .copyWith(color: AppColors.primaryColor),
                              )),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
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
                            Tab(text: "Details"),
                            Tab(text: "Post"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h), // Space between TabBar and TabBarView
                    const Expanded(
                      child: TabBarView(
                        children: [
                          // Content for Tab 1
                          DetailScreen(),
                          // Content for Tab 2
                          MessagePostDetails(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
