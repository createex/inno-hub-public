import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/models/post_media_model.dart';
import 'package:in_hub/views/screens/comment_section/comment_screen.dart';
import 'package:in_hub/views/screens/profile_section/play_video_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import '../../../controllers/getx_controllers/auth_controllers.dart';
import '../../../controllers/getx_controllers/create_post_controller.dart';
import '../../../controllers/getx_controllers/post_controller.dart';
import '../../../services/firebase_services.dart';
import '../profile_section/detailed_post_screen.dart';
import '../profile_section/other_user_profile.dart';

class HomePostScreen extends StatefulWidget {
final String  commentCount;
  const HomePostScreen({
    super.key, required this.commentCount,
  });

  @override
  State<HomePostScreen> createState() => _HomePostScreenState();
}

class _HomePostScreenState extends State<HomePostScreen> {
  AuthController authController = Get.put(AuthController());
  PostController postController = Get.put(PostController());
  CreatePostController createPostController = Get.put(CreatePostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
                  () => postController.postsList.isEmpty
                  ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 5, // Number of shimmer items to show while loading
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[300], // Shimmer effect for avatar
                          ),
                          SizedBox(width: 3.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  height: 16,
                                  color: Colors.grey[300], // Shimmer effect for name
                                ),
                                SizedBox(height: 1.h),
                                Container(
                                  width: double.infinity,
                                  height: 12,
                                  color: Colors.grey[300], // Shimmer effect for post text
                                ),
                                SizedBox(height: 1.h),
                                Container(
                                  width: double.infinity,
                                  height: 150,
                                  color: Colors.grey[300], // Shimmer effect for post media
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
                  : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: postController.postsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  PostMediaModel post = postController.postsList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => OtherUserProfile());
                              },
                              child: CircleAvatar(
                                backgroundImage: post.profileImage.isNotEmpty
                                    ? NetworkImage(post.profileImage)
                                    : const AssetImage("assets/pngs/profile.png") as ImageProvider,
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
                                      Text(
                                        "${post.firstName} ${post.lastName}",
                                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 2.w),
                                      Text(post.userName, style: TextStyle(fontSize: 14.sp, color: Colors.green)),
                                      SizedBox(width: 2.w),
                                      Text(
                                        "${post.createdAt.toLocal()}",
                                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Text(post.aboutPost, style: TextStyle(fontSize: 14.sp)),
                                  SizedBox(height: 1.h),
                                  GestureDetector(
                                    onTap: () {
                                      //Get.to(() => const PlayVideoScreen());
                                      //create a screen like this with a comment section
                                        Get.to(() => DetailedPostScreen(post: post));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: post.media.isNotEmpty
                                          ? Image.network(
                                        post.media,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Container(
                                              height: 150,
                                              color: Colors.grey[300],
                                            ),
                                          );
                                        },
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            "assets/pngs/post.png",
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      )
                                          : Image.asset(
                                        "assets/pngs/post.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          postController.toggleLikePost(post);
                                        },
                                        child: SvgPicture.asset(
                                          post.likes.contains(FirebaseService.auth.currentUser?.uid.toString())
                                              ? "assets/svgs/heart.svg"
                                              : "assets/svgs/whiteHeart.svg",
                                        ),
                                      ),
                                      SizedBox(width: 1.w),
                                      Obx(() {
                                        return Text(
                                          post.likes.isEmpty ? "" : post.likes.length.toString(),
                                          style: TextStyle(fontSize: 14.sp),
                                        );
                                      }),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => CommentScreen(
                                            firstName: post.firstName,
                                            userName: post.userName,
                                            profileImage: post.profileImage,
                                            lastName: post.lastName,
                                            createdAt: post.createdAt.toLocal().toString(),
                                            aboutPost: post.aboutPost,
                                            likes: post.likes,
                                            ownerId: post.ownerId,
                                            postId: post.postId,
                                            media: post.media,
                                          ));
                                        },
                                        child: SvgPicture.asset("assets/svgs/comments.svg"),
                                      ),
                                      SizedBox(width: 1.w),
                                      GestureDetector(
                                        onTap: () {
                                          // Handle comment tap if needed
                                        },
                                        child: StreamBuilder<int>(
                                          stream: FirebaseService().getCommentCountStream(post.postId),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState == ConnectionState.waiting) {
                                              return Text("...");
                                            }

                                            final commentCount = snapshot.data ?? 0;

                                            return Text(
                                              commentCount.toString(),
                                              style: TextStyle(fontSize: 14.sp),
                                            );
                                          },
                                        ),
                                      ),                                      Spacer(),
                                      SvgPicture.asset("assets/svgs/rePost.svg"),
                                      SizedBox(width: 1.w),
                                      Text("102K", style: TextStyle(fontSize: 14.sp)),
                                      Spacer(),
                                      SvgPicture.asset("assets/svgs/share.svg"),
                                      SizedBox(width: 1.w),
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
            ),
          ],
        ),
      ),
    );
  }
}
