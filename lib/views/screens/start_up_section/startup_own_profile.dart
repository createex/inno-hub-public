
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/start_up_section/profile_post_screen_it.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/getx_controllers/edit_start_up_profile_controller.dart';
import '../../../controllers/getx_controllers/picture_controller.dart';
import '../../../controllers/utils/image_picker.dart';
import '../../../models/static_model.dart';
import 'start_up_own_details_screen.dart';
import 'edit_startup_profile.dart';
class StartUpOwnProfile extends StatefulWidget {
  final String documentId;
  final String startUpName;
  final String startUpField;
  final String startUpUserName;
  final String startUpWebsite;
  final String startUpLocation;
  final String profileImage;
  final String companyOverview;
  final String challenges;
  final String vision;
  final String lookingFor;
  final String productStatus;
  final String technology;
  final String marketAndCustomers;
  final String targetMarket;
  final String companySize;
  final String foundingAndGrowth;
  final String foundingStage;
  final String investStage;
  final String team;
  StartUpOwnProfile({super.key, required this.documentId, required this.startUpName, required this.startUpField, required this.startUpUserName, required this.startUpWebsite, required this.startUpLocation, required this.profileImage, required this.companyOverview, required this.challenges, required this.vision, required this.lookingFor, required this.productStatus, required this.technology, required this.marketAndCustomers, required this.targetMarket, required this.companySize, required this.foundingAndGrowth, required this.foundingStage, required this.investStage, required this.team});

  @override
  State<StartUpOwnProfile> createState() => _StartUpOwnProfileState();
}

class _StartUpOwnProfileState extends State<StartUpOwnProfile> {
  ImagePickerController1 imagePickerController =Get.put(ImagePickerController1());

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
  RxBool isFirstButtonActive = true.obs;
  PictureController pictureController =Get.put(PictureController());
  final EditStartUpProfileController editStartUpProfileController = Get.put(EditStartUpProfileController());

  @override
  void initState() {
    pictureController.fetchBackgroundImage(widget.documentId);
    editStartUpProfileController.fetchStartupProfile(widget.documentId); // Ensure this is called once

    super.initState();
  }
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
              "StartUp Profile",
              style: AppTextStyles.boldTextStyle
                  .copyWith(color: AppColors.headingColor, fontSize: 18.px),
            ),
            SizedBox(height: 10.px,width: 10.px,)
          ],
        ),
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.5.h), // Adjust spacing as needed

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              child: Stack(
                children: [
                  Obx(() {
                    return GestureDetector(
                      onTap: () {
                        // Make sure to pass the docId when picking the background image
                        pictureController.pickBackgroundImage(widget.documentId);
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        height: MediaQuery.of(context).size.height * 0.186,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: pictureController.backgroundImage.isNotEmpty
                                ? NetworkImage(pictureController.backgroundImage.value)
                                : AssetImage("assets/pngs/image.png") as ImageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 1.h, top: 1.h),
                          child: SvgPicture.asset("assets/svgs/edit.svg"),
                        ),
                      ),
                    );
                  }),

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
                                color: AppColors.whiteColor,
                                width: 3,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 4.5.h,
                              backgroundColor: Colors.transparent,
                              backgroundImage: widget.profileImage != null
                                  ? NetworkImage(widget.profileImage) // Use '!' to assert it's not null
                                  : const AssetImage("assets/pngs/profile.png"), // Default image
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
            Column(
              children: [
                SizedBox(
                  height: .8.h,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.startUpName ??
                      "Mohsin Ali Raza -",
                      style: AppTextStyles.boldTextStyle.copyWith(
                        color: const Color(0xff424348),
                        fontSize: 14.px,
                      ),
                    ),
                    SizedBox(
                      width: .4.h,
                    ),
                    Text(widget.startUpUserName ??
                        "Username"
                        ,style: AppTextStyles.boldTextStyle.copyWith(
                      fontSize: 14.px,
                      color: AppColors.primaryColor,
                    )),
                  ],
                ),
                SizedBox(height: .4.h,),
                Text(widget.startUpField ??
                  "Software engineering",
                  style: AppTextStyles.boldTextStyle.copyWith(
                      color: const Color(0xff424348),
                      fontSize: 14.px,fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: .4.h,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svgs/location1.svg"),
                    SizedBox(
                      width: .4.h,
                    ),
                    Text(widget.startUpLocation ??
                      "Lahore,Pakistan",
                      style: AppTextStyles.boldTextStyle.copyWith(
                          color: const Color(0xff424348),
                          fontSize: 14.px,fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(width: 2.w,),
                    SvgPicture.asset("assets/svgs/streamline.svg"),
                    SizedBox(
                      width: .4.h,
                    ),
                    Text(widget.startUpWebsite ??
                      "WWW.STARTUP.COM",
                      style: AppTextStyles.boldTextStyle.copyWith(
                          color: const Color(0xff424348),
                          fontSize: 14.px,fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

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
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 36.px,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 3.h),
                          foregroundColor: isFirstButtonActive.value ? Colors.white : AppColors.orangeColor,
                          backgroundColor: isFirstButtonActive.value ? AppColors.greenColor : Colors.white,
                          side: const BorderSide(color: AppColors.greenColor, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {
                          Get.to(() =>  EditStartUpScreen(documentId:widget.documentId));
                          isFirstButtonActive.value = true;
                        },
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: isFirstButtonActive.value ? Colors.white : AppColors.greenColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    SizedBox(
                      height: 36.px,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 3.h),
                          foregroundColor: !isFirstButtonActive.value ? Colors.white : AppColors.orangeColor,
                          backgroundColor: !isFirstButtonActive.value ? AppColors.greenColor : Colors.white,
                          side: const BorderSide(color: AppColors.greenColor, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {
                          // Get.off(()=>const EditProfileScreen());
                          isFirstButtonActive.value = false;
                        },
                        child: Text(
                          "Share",
                          style: TextStyle(
                            color: !isFirstButtonActive.value ? Colors.white : AppColors.greenColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
                          tabs:  [
                            Tab(text: "Details"),
                            Tab(text: "Post"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h), // Space between TabBar and TabBarView
                     Expanded(
                      child: TabBarView(
                        children: [
                          // Content for Tab 1
                          StartUpOwnDetailsScreen(
                            foundingStage: widget.foundingStage,
                            investStage: widget.investStage,
                            lookingFor: widget.lookingFor,
                            marketAndCustomers: widget.marketAndCustomers,
                            productStatus: widget.productStatus,
                            targetMarket: widget.targetMarket,
                            team: widget.team,
                            technology: widget.technology,
                            vision:widget.vision,
                            challenges: widget.challenges,
                            companyOverview: widget.companyOverview,
                            companySize: widget.companySize,
                            foundingAndGrowth:widget.foundingAndGrowth,
                            documentId:widget.documentId,

                          ),
                          // Content for Tab 2
                          ProfilePostScreenIt(),
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
