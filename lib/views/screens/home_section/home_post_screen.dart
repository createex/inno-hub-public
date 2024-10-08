import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/models/post_media_model.dart';
import 'package:in_hub/views/screens/create_post_section/comment_screen.dart';
import 'package:in_hub/views/screens/profile_section/play_video_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/getx_controllers/auth_controllers.dart';
import '../../../controllers/getx_controllers/post_controller.dart';
import '../../../models/feeds_description_model.dart';
import '../profile_section/other_user_profile.dart';
class HomePostScreen extends StatefulWidget {
  const HomePostScreen({super.key,});
  @override
  State<HomePostScreen> createState() => _HomePostScreenState();
}
class _HomePostScreenState extends State<HomePostScreen> {
  AuthController authController =Get.put(AuthController());
  PostController postController =Get.put(PostController());
  List<FeedsDescriptionModel> data1 = [
    FeedsDescriptionModel(
      profileImage: 'assets/pngs/innoHub.png',
      name: 'Zeeshan',
      title: '@finch',
      time: '2 hours ago',
      desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,ut labore et dolore magna aliqua.',
    ),
    FeedsDescriptionModel(
      profileImage: 'assets/pngs/innoHub.png',
      name: 'John Doe',
      title: '@John',
      time: '3 hours ago',
      desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,ut labore et dolore magna aliqua.',
    ),
    FeedsDescriptionModel(
      profileImage: 'assets/pngs/innoHub.png',
      name: 'Jane Doe',
      title: '@Smith',
      time: '5 hours ago',
      desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
          Obx(()=>
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: postController.postsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  PostMediaModel post=postController.postsList[index];
                  // Get the current feed

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                        child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(  onTap: () {
                              Get.to(() => OtherUserProfile());
                            },
                              child: CircleAvatar(
                                backgroundImage:post.profileImage.isNotEmpty?NetworkImage(post.profileImage):
                                const AssetImage("assets/pngs/profile.png") as ImageProvider,
                                radius: 20,
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("${post.firstName} ${post.lastName}",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 2.w),

                                      Text(post.userName,
                                          style: TextStyle(
                                              fontSize: 14.sp, color: Colors.green)),
                                      SizedBox(width: 2.w),
                                      Text("${post.createdAt.toLocal()}",
                                          style:
                                          TextStyle(fontSize: 12.sp, color: Colors.grey)),
                                    ],
                                  ),
                                  Text(post.aboutPost, style: TextStyle(fontSize: 14.sp)),
                                  SizedBox(height: 1.h),
                                  GestureDetector(onTap: () {
                                    Get.to(() => const PlayVideoScreen());
                                  },
                                    child: ClipRRect(borderRadius: BorderRadius.circular(12),
                                        child:post.media.isNotEmpty
                                            ? Image.network(post.media)
                                            : Image.asset("assets/pngs/post.png",)),
                                  ),
                                  SizedBox(height: 2.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(onTap:(){},
                                        child: SvgPicture.asset(
                                            "assets/svgs/heart.svg"),
                                      ),
                                      SizedBox(width: 1.w,),
                                      GestureDetector(onTap:(){},
                                          child: Text("102.5K", style: TextStyle(fontSize: 14.sp))),
                                      Spacer(),
                                      GestureDetector(onTap: () {
                                        Get.to(() => const CommentScreen());

                                      },
                                        child: SvgPicture.asset(
                                            "assets/svgs/comments.svg"),
                                      ),
                                      SizedBox(width: 1.w,),

                                      GestureDetector(onTap: () {
                                        Get.to(() => const CommentScreen());

                                      },
                                          child: Text("102.5K", style: TextStyle(fontSize: 14.sp))),
                                      Spacer(),

                                      SvgPicture.asset(
                                          "assets/svgs/rePost.svg"),
                                      SizedBox(width: 1.w,),
                                      Text("102K", style: TextStyle(fontSize: 14.sp)),
                                      Spacer(),

                                      SvgPicture.asset(
                                          "assets/svgs/share.svg"),
                                      SizedBox(width: 1.w,),

                                      Text("102.5K", style: TextStyle(fontSize: 14.sp)),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 1, color: Colors.grey.shade300),
                    ],
                  );
                },
              ),
          )
            // ListView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   padding: EdgeInsets.zero,
            //   itemCount: data1.length,
            //   shrinkWrap: true,
            //   itemBuilder: (context, index) {
            //     // Get the current feed
            //     final feed = data1[index];
            //     return Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Padding(
            //           padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
            //           child: Row(mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               GestureDetector(  onTap: () {
            //                 Get.to(() => StartUpOtherProfile());
            //               },
            //                 child: CircleAvatar(
            //                   backgroundImage: AssetImage(feed.profileImage),
            //                   radius: 20,
            //                 ),
            //               ),
            //               SizedBox(width: 3.w),
            //               Expanded(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         Text(feed.name,
            //                             style: TextStyle(
            //                                 fontSize: 16.sp,
            //                                 fontWeight: FontWeight.bold)),
            //                         SizedBox(width: 2.w),
            //
            //                         Text(feed.title,
            //                             style: TextStyle(
            //                                 fontSize: 14.sp, color: Colors.green)),
            //                         SizedBox(width: 2.w),
            //
            //                         Text(feed.time,
            //                             style:
            //                             TextStyle(fontSize: 12.sp, color: Colors.grey)),
            //
            //                       ],
            //                     ),
            //                     Text(feed.desc, style: TextStyle(fontSize: 14.sp)),
            //                     SizedBox(height: 2.h),
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.start,
            //                       children: [
            //                         SvgPicture.asset(
            //                             "assets/svgs/heart.svg"),
            //                         SizedBox(width: 1.w,),
            //                         Text("102.5K", style: TextStyle(fontSize: 14.sp)),
            //                         Spacer(),
            //                         GestureDetector(onTap: () {
            //                           Get.to(() => const CommentScreen());
            //
            //                         },
            //                           child: SvgPicture.asset(
            //                               "assets/svgs/comments.svg"),
            //                         ),
            //                         SizedBox(width: 1.w,),
            //
            //                         GestureDetector(onTap: () {
            //                           Get.to(() => const CommentScreen());
            //
            //                         },
            //                             child: Text("102.5K", style: TextStyle(fontSize: 14.sp))),
            //                         Spacer(),
            //
            //                         SvgPicture.asset(
            //                             "assets/svgs/rePost.svg"),
            //                         SizedBox(width: 1.w,),
            //                         Text("102K", style: TextStyle(fontSize: 14.sp)),
            //                         Spacer(),
            //
            //                         SvgPicture.asset(
            //                             "assets/svgs/share.svg"),
            //                         SizedBox(width: 1.w,),
            //
            //                         Text("102.5K", style: TextStyle(fontSize: 14.sp)),
            //                       ],
            //                     ),
            //
            //                   ],
            //                 ),
            //               ),
            //
            //             ],
            //           ),
            //         ),
            //
            //         Divider(thickness: 1, color: Colors.grey.shade300),
            //       ],
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
