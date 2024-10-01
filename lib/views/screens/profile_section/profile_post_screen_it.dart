import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/text_styles.dart';
import '../../../models/feed_model.dart';
class ProfilePostScreenIt extends StatefulWidget {
  const ProfilePostScreenIt({super.key});

  @override
  State<ProfilePostScreenIt> createState() => _ProfilePostScreenItState();
}

class _ProfilePostScreenItState extends State<ProfilePostScreenIt> {
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
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // Get the current feed
              final feed = data[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 2.w),
                      child: Row( crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                Row(
                                  children: [
                                    Text(feed.name,
                                        style: TextStyle(
                                            fontSize: 18.px,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 2.w),

                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "I.T",
                                              style: AppTextStyles.boldTextStyle
                                                  .copyWith(
                                                  fontSize: 12.px,
                                                  color: AppColors
                                                      .primaryColor)),
                                              TextSpan(text: " "),
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
                                SizedBox(height: 0.5.h),
                                Text(feed.desc,
                                    style: TextStyle(fontSize: 14.sp)),
                                SizedBox(height: 1.h),
                                ClipRRect(borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(feed.postImage,)),
                                SizedBox(height: 2.h),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/svgs/heart.svg"), // Replace with your actual SVG asset
                                    Text("102.5K", style: TextStyle(fontSize: 14.sp)),
                                    SvgPicture.asset(
                                        "assets/svgs/comments.svg"), // Replace with your actual SVG asset
                                    Text("102.5K", style: TextStyle(fontSize: 14.sp)),
                                    SvgPicture.asset(
                                        "assets/svgs/rePost.svg"), // Replace with your actual SVG asset
                                    Text("102K", style: TextStyle(fontSize: 14.sp)),
                                    SvgPicture.asset(
                                        "assets/svgs/share.svg"), // Replace with your actual SVG asset
                                    Text("102.5K", style: TextStyle(fontSize: 14.sp)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'edit') {
                                // Handle edit action here
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  value: 'edit',
                                  child: Text('Edit'),
                                ),
                              ];
                            },
                            icon: Icon(Icons.more_vert), // The three-dot icon
                          )

                          // PopupMenuButton(
                          //   iconSize: 3.h,
                          //   padding: EdgeInsets.zero,
                          //   onSelected: (value) {
                          //     // your logic
                          //   },
                          //   itemBuilder: (BuildContext bc) {
                          //     return [
                          //       PopupMenuItem(
                          //         value: 'Edit',
                          //         child: Text(
                          //           "Edit",
                          //           style: TextStyle(fontSize: 12.px),
                          //         ),
                          //       )
                          //     ];
                          //   },
                          // )
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
      ],),
    );
  }
}
