import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/views/screens/chat_section/main_chat.dart';
import 'package:in_hub/views/screens/custom_widgets/app_keys.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/utils/app_colors.dart';
import '../controllers/utils/text_styles.dart';
import 'main_home_screen.dart';
import 'screens/create_post_section/create_post.dart';
import 'screens/discover_section/discover_screen.dart';
import 'screens/notification_section/notification_screen.dart';
import 'screens/profile_section/profile_tab.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  BottomNavigationScreenState createState() => BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final RxInt currentIndex = 0.obs;
  // final ImagePickerProfileController imagePickerProfileController = Get.put(ImagePickerProfileController());
  final List<String> names = [
    "Manage Invitations",
    "Settings",
    "Share",
    "Privacy Policy",
    "Rate Us",
    "Log out",
  ];
  final List<String> imagePaths = [
    "assets/svgs/invitation.svg",
    "assets/svgs/settingIcon.svg",
    "assets/svgs/shareIcon.svg",
    "assets/svgs/policy.svg",
    "assets/svgs/rateUs.svg",
    "assets/svgs/logOut.svg",
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(() => Scaffold(
      key:AppKeys.scaffoldKey,
      drawer: SafeArea(
        child: Drawer(width: MediaQuery.of(context).size.width*0.7,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(36))),
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                decoration:  BoxDecoration( color:Color(0xff0CC24C).withOpacity(0.2) ,
                ),
                child: Column(children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 2.h),
                    child: Align(alignment:Alignment.centerRight,
                        child: GestureDetector(onTap: () {
                          Navigator.of(context).pop();
                        },
                            child: SvgPicture.asset("assets/svgs/drawerClose.svg"))),
                  ),
                  SizedBox(height:3.h),
                  const CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/pngs/pngprofile.png") ,
                    radius: 50,
                  ),
                  SizedBox(height:1.h),
                  Text("Mohsin",style:AppTextStyles.textStartBlack,),
                  SizedBox(height:2.h),

                ],),
              ),
              SizedBox(height:2.h),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(onTap: () {
                      // navigateToScreen(index);
                    },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.h),
                        child: Row(
                          children: [
                            SvgPicture.asset(imagePaths[index]),
                            SizedBox(width: 2.w),
                            Text(names[index],style:AppTextStyles.textPerfectBlack6,), // Use the name from the list

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],)),
      ),
          floatingActionButton: currentIndex.value == 0
              ? SizedBox(
                  height: 50,
                  width: 50,
                  child: FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      Get.to(() => CreatePost());
                    },
                    child: currentIndex.value == 0
                        ? const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          )
                        : const SizedBox.shrink(),
                  ),
                )
              : SizedBox(),
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex.value,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.orangeColor,
            unselectedItemColor: AppColors.blackColor5,
            selectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 12.px),
            unselectedLabelStyle:
                textTheme.bodySmall?.copyWith(fontSize: 12.px),
            onTap: (value) {
              // Update current index on item tap
              currentIndex.value = value;
            },
            items: [
              BottomNavigationBarItem(
                label: "",
                icon: _buildNavItem(
                  icon: Icon(
                    Icons.home,
                    color: currentIndex.value == 0
                        ? AppColors.primaryColor
                        : AppColors.blackColor5,
                  ),
                  label: "Home",
                  isSelected: currentIndex.value == 0,
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: _buildNavItem(
                  icon: SvgPicture.asset(
                    "assets/svgs/discover.svg",
                    color: currentIndex.value == 1
                        ? AppColors.primaryColor
                        : AppColors.blackColor5,
                  ),
                  label: "Discover",
                  isSelected: currentIndex.value == 1,
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: _buildNavItem(
                  icon: Icon(
                    Icons.chat,
                    color: currentIndex.value == 2
                        ? AppColors.primaryColor
                        : AppColors.blackColor5,
                  ),
                  label: "Chat",
                  isSelected: currentIndex.value == 2,
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: _buildNavItem(
                  icon: Icon(
                    Icons.notifications,
                    color: currentIndex.value == 3
                        ? AppColors.primaryColor
                        : AppColors.blackColor5,
                  ),
                  label: "Notification",
                  isSelected: currentIndex.value == 3,
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: _buildNavItem(
                  icon: Icon(
                    Icons.person_sharp,
                    color: currentIndex.value == 4
                        ? AppColors.primaryColor
                        : AppColors.blackColor5,
                  ),
                  label: "Profile",
                  isSelected: currentIndex.value == 4,
                ),
              ),
            ],
          ),
          body: Obx(() {
            switch (currentIndex.value) {
              case 0:
                return const MainHomeScreen();
              case 1:
                return const DiscoverScreen();
              case 2:
                return const MainChatScreen();
              case 3:
                return const NotiFicationScreen();
              case 4:
                return const ProfileTabBar();
              default:
                return const SizedBox();
            }
          }),
        ));
  }

  Widget _buildNavItem(
      {required Widget icon, required String label, required bool isSelected}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // isSelected
        //     ? Container(
        //   height: 5.px,
        //   decoration:  BoxDecoration(color:  AppColors.primaryColor, borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        //   width: 55.px,
        //   margin: EdgeInsets.only(bottom: 5.px), // Adjust this value if needed to ensure it aligns perfectly
        // )
        //     : SizedBox(height: 10.px),
        icon,
        Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.primaryColor : AppColors.blackColor5,
            fontSize: 12.px,
          ),
        ),
      ],
    );
  }
}
