import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/svg.dart';
import '../../../controllers/getx_controllers/post_controller.dart';
import '../../../models/post_media_model.dart';
import '../../../services/firebase_services.dart';
import '../comment_section/comment_screen.dart';

class DetailedPostScreen extends StatelessWidget {
  final PostMediaModel post;

  const DetailedPostScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostController postController = Get.put(PostController());

    return Scaffold(
      appBar: AppBar(
        title: Text("${post.firstName} ${post.lastName}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Image
            ClipRRect(
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
            SizedBox(height: 2.h),
            // Likes and Shares
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    postController.toggleLikePost(post);
                  },
                  child: SvgPicture.asset(
                    post.likes.contains(
                            FirebaseService.auth.currentUser?.uid.toString())
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
                    // Handle share logic
                  },
                  child: SvgPicture.asset("assets/svgs/share.svg"),
                ),
                SizedBox(width: 1.w),
                Text("102K", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
            SizedBox(height: 2.h),
            // Comments Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Comments",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 1.h),
                  // Display comments
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: post.comments.length,
                    itemBuilder: (context, index) {
                      final comment = post.comments[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(comment.profileImage),
                        ),
                        title: Text(comment.userName),
                        subtitle: Text(comment.commentText),
                      );
                    },
                  ),
                  // Add a new comment
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Add a comment...",
                      border: OutlineInputBorder(),
                    ),
                    onFieldSubmitted: (value) {
                      postController.addComment(post.postId, value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
