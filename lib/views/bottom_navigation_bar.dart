import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/views/screens/custom_widgets/app_keys.dart';
import 'package:in_hub/views/screens/invitation_section/manage_invitation.dart';
import 'package:in_hub/views/screens/profile_section/create_startup_profile.dart';
import 'package:in_hub/views/screens/profile_section/profile_screen.dart';
import 'package:in_hub/views/screens/setting_section/setting_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/utils/app_colors.dart';
import '../controllers/utils/text_styles.dart';
import 'main_home_screen.dart';
import 'screens/create_post_section/create_post.dart';
import 'screens/discover_section/discover_screen.dart';
import 'screens/notification_section/notification_screen.dart';
import 'screens/profile_section/empty_startup_profile.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});
  @override
  BottomNavigationScreenState createState() => BottomNavigationScreenState();
}
class BottomNavigationScreenState extends State<BottomNavigationScreen> {
  RxString? chooseStartUp = RxString('');
  final List<String> startup = ["startUp 1", "startUp 2",
    "startUp 3", "startUp 4"];
  final RxInt currentIndex = 0.obs;
  // final ImagePickerProfileController imagePickerProfileController = Get.put(ImagePickerProfileController());
  final List<String> names = [
    // "Email Alert",
    "Manage Invitations",
    "Settings",
    "Share",
    "Privacy Policy",
    "Rate Us",
    "Log out",
  ];
  final List<String> imagePaths = [
    // "assets/svgs/emailnotification.svg",
    "assets/svgs/invitation.svg",
    "assets/svgs/settingIcon.svg",
    "assets/svgs/shareIcon.svg",
    "assets/svgs/policy.svg",
    "assets/svgs/rateUs.svg",
    "assets/svgs/logOut.svg",
  ];
  @override
  Widget build(BuildContext context) {
    void navigateToScreen(int index) {
      switch (index) {
        case 0:
          Get.to(() => const ManageInvitation()); // Replace with actual screen
          break;
        case 1:
          Get.to(() =>  SettingScreen()); // Replace with actual screen

          break;
        case 2:
          // Get.to(() => SettingScreen()); // Replace with actual screen
          break;
      // Add more cases for additional screens
        default:
          // Get.to(() => DefaultScreen()); // A fallback screen if needed
          break;
      }
    }

    final textTheme = Theme.of(context).textTheme;
    return Obx(() => Scaffold(
          key: AppKeys.scaffoldKey,
          drawer: SafeArea(
            child:
            Drawer(
              width: MediaQuery.of(context).size.width * 0.7,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(36)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    decoration: BoxDecoration(
                      color: const Color(0xff0CC24C).withOpacity(0.2),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 2.h),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: SvgPicture.asset("assets/svgs/drawerClose.svg"),
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ProfileScreen());
                          },
                          child: const CircleAvatar(
                            backgroundImage: AssetImage("assets/pngs/pngprofile.png"),
                            radius: 50,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          "Mohsin",
                          style: AppTextStyles.textStartBlack,
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(color: Colors.white,
                            border: Border.all(
                                color:AppColors.greyColor.withOpacity(0.2)
                            ),
                            borderRadius: BorderRadius.circular(8),),
                          child: DropdownButtonHideUnderline(
                            child: Obx(() {
                              return DropdownButton<String>(
                                isExpanded: true,
                                hint: Text(
                                  chooseStartUp!.value.isEmpty ? 'My Profile' : chooseStartUp!.value,
                                  style:AppTextStyles.textAccountBlack,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                items: startup.map((String communityName) {
                                  return DropdownMenuItem<String>(
                                    value: communityName,
                                    child: Text(
                                      communityName,
                                      style:AppTextStyles.textAccountBlack,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  chooseStartUp!.value = value!;
                                },
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            navigateToScreen(index);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(imagePaths[index]),
                                    SizedBox(width: 2.w),
                                    Text(
                                      names[index],
                                      style: AppTextStyles.textPerfectBlack6,
                                    ),
                                  ],
                                ),
                                // Display the switch only for "Email Alert" (index 0)
                                // if (index == 0)
                                //   ToggleSwitch(
                                //     minWidth: 2.5.h,
                                //     minHeight: 2.5.h,
                                //     cornerRadius: 3.h,
                                //     inactiveBgColor:
                                //     AppColors.greyColor.withOpacity(0.3),
                                //     inactiveFgColor: Colors.grey,
                                //     activeBgColor: [AppColors.primaryColor,AppColors.greyColor],
                                //     initialLabelIndex: 1,
                                //     totalSwitches: 2,
                                //     radiusStyle: true,
                                //     onToggle: (index) {},
                                //   )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                GestureDetector(onTap: () {
                  Get.to(()=>const CreateStartupProfile());

                },
                  child: Align(alignment:Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 5.w),
                      decoration: BoxDecoration(color: Colors.green,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text("Create start up",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
                  SizedBox(height: 30.px,width: 30.px,)
                ],
              ),

          ),          ),
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
              : const SizedBox(),
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
                    Icons.notifications,
                    color: currentIndex.value == 2
                        ? AppColors.primaryColor
                        : AppColors.blackColor5,
                  ),
                  label: "Notification",
                  isSelected: currentIndex.value == 2,
                ),
              ),
              // BottomNavigationBarItem(
              //   label: "",
              //   icon: _buildNavItem(
              //     icon: SvgPicture.asset(
              //       'assets/svgs/startup_icon.svg',
              //       color: currentIndex.value == 3
              //           ? AppColors.primaryColor
              //           : AppColors.blackColor5,
              //     ),
              //     label: "Startup",
              //     isSelected: currentIndex.value == 3,
              //   ),
              // ),
            ],
          ),
          body: Obx(() {
            switch (currentIndex.value) {
              case 0:
                return const MainHomeScreen();
              case 1:
                return const DiscoverScreen();

              case 2:
                return NotiFicationScreen();
              // case 3:
              //   return const EmptyStartupProfile();
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
