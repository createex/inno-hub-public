import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/models/feed_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  // Initialize with static data
  final List<FeedsModel> data = [
    FeedsModel(
      profileImage: 'assets/pngs/profile.png',
      name: 'Zeeshan',
      title: 'Hello World',
      time: '2 hours ago',
      desc:
          'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
    FeedsModel(
      profileImage: 'assets/pngs/profile.png',
      name: 'John Doe',
      title: 'Flutter is awesome!',
      time: '3 hours ago',
      desc:
          'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
    FeedsModel(
      profileImage: 'assets/pngs/profile.png',
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
      // appBar: AppBar(
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     "Profile",
      //     style: AppTextStyles.boldTextStyle
      //         .copyWith(color: AppColors.headingColor, fontSize: 18.px),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.only(right: 2.h),
      //       child: GestureDetector(onTap: () {
      //         Get.to(()=> SettingScreen());
      //       },
      //           child: SvgPicture.asset("assets/svgs/setting.svg")),
      //     )
      //   ],
      // ),
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
                    left: 2.h,
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
                  SizedBox(
                    height: .8.h,
                  ),
                  Column(
                    children: [
                      Text(
                        "Mohsin Ali Raza",
                        style: AppTextStyles.boldTextStyle.copyWith(
                          color: const Color(0xff424348),
                          fontSize: 14.px,
                        ),
                      ),
                      SizedBox(
                        height: .8.h,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: "200+ ",
                                style: AppTextStyles.boldTextStyle.copyWith(
                                  fontSize: 14.px,
                                  color: AppColors.primaryColor,
                                )),
                            TextSpan(
                                text: "Connects",
                                style: AppTextStyles.regularStyle.copyWith(
                                    fontSize: 14.px,
                                    color: const Color(0xff363636))),
                          ])),
                    ],
                  ),
                  SizedBox(
                    height: .8.h,
                  ),
                  Text(
                    "Posts",
                    style: TextStyle(
                        fontSize: 14.px,
                        color: const Color(0xff181919),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // Get the current feed
                  final feed = data[index];

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage(feed.profileImage),
                                    radius: 2.8.h,
                                  ),
                                  SizedBox(width: 3.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(feed.name,
                                            style: TextStyle(
                                                fontSize: 18.px,
                                                fontWeight: FontWeight.bold)),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: "Interests ",
                                              style: AppTextStyles.boldTextStyle
                                                  .copyWith(
                                                      fontSize: 12.px,
                                                      color: AppColors
                                                          .primaryColor)),
                                          TextSpan(
                                              text: "8 hour ago",
                                              style: AppTextStyles.regularStyle
                                                  .copyWith(
                                                      fontSize: 12.px,
                                                      color: const Color(
                                                          0xff363636))),
                                        ])),
                                      ],
                                    ),
                                  ),
                                  PopupMenuButton(
                                    iconSize: 3.h,
                                    padding: EdgeInsets.zero,
                                    onSelected: (value) {
                                      // your logic
                                    },
                                    itemBuilder: (BuildContext bc) {
                                      return [
                                        PopupMenuItem(
                                          value: 'Edit',
                                          child: Text(
                                            "Edit",
                                            style: TextStyle(fontSize: 12.px),
                                          ),
                                        )
                                      ];
                                    },
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Text(feed.desc,
                                  style: TextStyle(fontSize: 14.sp)),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Image.asset(feed.postImage),
                        SizedBox(height: 2.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/svgs/heart.svg"), // Replace with your actual SVG asset
                              SizedBox(width: 2.w),
                              Text("102.5K", style: TextStyle(fontSize: 14.sp)),
                              SizedBox(width: 2.w),
                              SvgPicture.asset(
                                  "assets/svgs/comments.svg"), // Replace with your actual SVG asset
                              Text("102.5K", style: TextStyle(fontSize: 14.sp)),
                              const Spacer(),
                              SvgPicture.asset(
                                  "assets/svgs/share.svg"), // Replace with your actual SVG asset
                              SizedBox(width: 2.w),
                              Text("102.5K", style: TextStyle(fontSize: 14.sp)),
                            ],
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey.shade300),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
