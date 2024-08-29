import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../models/feed_model.dart';
import 'screens/profile_section/other_user_profile.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});
  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  // Initialize with static data
  List<FeedsModel> data = [
    FeedsModel(
      profileImage: 'assets/pngs/iqrapro.png',
      name: 'Zeeshan',
      title: '@finch',
      time: '2 hours ago',
      desc: 'This is the description of the post.',
      postImage: 'assets/pngs/iqrabg.png',
    ),
    FeedsModel(
      profileImage: 'assets/pngs/iqrapro.png',
      name: 'John Doe',
      title: '@John',
      time: '3 hours ago',
      desc: 'Here is some more description about this awesome post.',
      postImage: 'assets/pngs/post.png',
    ),
    FeedsModel(
      profileImage: 'assets/pngs/iqrapro.png',
      name: 'Jane Doe',
      title: '@Smith',
      time: '5 hours ago',
      desc: 'It\'s a beautiful day to learn Flutter!',
      postImage: 'assets/pngs/post.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // Get the current feed
            final feed = data[index];

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => OtherUserProfile());
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(feed.profileImage),
                          radius: 20,
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(feed.name,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold)),
                              Text(feed.title,
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.green)),
                            ],
                          ),
                        ),
                        Text(feed.time,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.grey)),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(feed.desc, style: TextStyle(fontSize: 14.sp)),
                  SizedBox(height: 2.h),
                  Image.asset(feed.postImage),
                  SizedBox(height: 2.h),
                  Row(
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
                  Divider(thickness: 1, color: Colors.grey.shade300),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
