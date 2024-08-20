import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/views/screens/chat_section/main_chat.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/utils/app_colors.dart';
import 'main_home_screen.dart';
class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  BottomNavigationScreenState createState() => BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final RxInt currentIndex = 0.obs;
  // final ImagePickerProfileController imagePickerProfileController = Get.put(ImagePickerProfileController());
  final List<String> names = ["My Wallet", "Rating & Reviews", "Settings", "Privacy Policy", "Chat Support",
    "Rate Us","Share", "Log out",
  ];
  final List<String> imagePaths = [
    "assets/svg/walletIcon.svg",
    "assets/svg/ratingIcon.svg",
    "assets/svg/setting.svg",
    "assets/svg/privacyIcon.svg",
    "assets/svg/chatSupport.svg",
    "assets/svg/star.svg",
    "assets/svg/share.svg",
    "assets/svg/logout.svg",
  ];
  void navigateToScreen(int index) {
    switch (index) {
      case 0:
      // Get.to(() => const MyWalletScreen());
        break;
      case 1:
      // Get.to(() => const RatingReviewScreen());
        break;
      case 2:
      // Get.to(() => const SettingScreen());
        break;
      case 3:
      // Get.to(() => PrivacyPolicyScreen());
        break;
      case 4:
      // Get.to(() => const ChatSupportStart());
        break;
      case 5:
      // Get.to(() => LogOutScreen());
        break;
      default:
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex.value,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.orangeColor,
        unselectedItemColor: AppColors.blackColor5,
        selectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 12.px),
        unselectedLabelStyle: textTheme.bodySmall?.copyWith(fontSize: 12.px),
        onTap: (value) {
          // Update current index on item tap
          currentIndex.value = value;
        },
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: Icon(Icons.home,color: currentIndex.value == 0 ? AppColors.primaryColor : AppColors.blackColor5,),
              label: "Home",
              isSelected: currentIndex.value == 0,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: Icon(Icons.chat,color:currentIndex.value == 1 ? AppColors.primaryColor : AppColors.blackColor5 ,),
              label: "Chat",
              isSelected: currentIndex.value == 1,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: Icon(Icons.notifications,color:currentIndex.value == 2 ? AppColors.primaryColor : AppColors.blackColor5,),

              label: "Notification",
              isSelected: currentIndex.value == 2,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: _buildNavItem(
              icon: Icon(Icons.person_sharp,color: currentIndex.value == 3 ? AppColors.primaryColor : AppColors.blackColor5,),

              label: "Profile",
              isSelected: currentIndex.value == 3,
            ),
          ),
        ],
      ),
      body: Obx(() {
        switch (currentIndex.value) {
          case 0:
            return const MainHomeScreen();
          case 1:
           return const MainChatScreen();
          case 2:
          // return const EquipmentHomeScreen(showButton: false,);
          case 3:
          // return const InboxHomeScreen();
          case 4:
          // return const RentalHomeScreen();
          default:
            return const SizedBox();
        }
      }),
    ));
  }

  Widget _buildNavItem({required Widget icon, required String label, required bool isSelected}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        isSelected
            ? Container(
          height: 5.px,
          decoration:  BoxDecoration(color:  AppColors.primaryColor, borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          width: 55.px,
          margin: EdgeInsets.only(bottom: 5.px), // Adjust this value if needed to ensure it aligns perfectly
        )
            : SizedBox(height: 10.px),
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