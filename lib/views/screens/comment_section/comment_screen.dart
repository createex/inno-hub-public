import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/views/screens/comment_section/reply_comment.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import '../../../controllers/getx_controllers/comment_controller.dart';
import '../../../controllers/getx_controllers/post_controller.dart';

import '../../../services/firebase_services.dart';
class CommentScreen extends StatefulWidget {
  final String userName;
  final String profileImage;
  final String firstName;
  final String lastName;
  final String createdAt;
  final String ownerId;
  final String aboutPost;
  final String media;
  final String postId;
  final List<String> likes;
  // final List<PostMediaModel> comments;
   const CommentScreen({super.key, required this.firstName, required this.userName, required this.profileImage, required this.lastName, required this.createdAt, required this.aboutPost, required this.likes,  required this.ownerId, required this.postId, required this.media,});
  @override
  State<CommentScreen> createState() => _CommentScreenState();
}
class _CommentScreenState extends State<CommentScreen> {

  // This controller will be used to get the text input from the user
  final TextEditingController _commentController = TextEditingController();
  PostController postController = Get.put(PostController());
  final CommentController commentController = Get.put(CommentController());

  final FocusNode _commentFocusNode = FocusNode(); // Declare FocusNode
  RxBool isComment = false.obs;
  @override
  void initState() {
    final CommentController commentController = Get.put(CommentController());

    commentController.fetchAllComments(widget.postId);
    super.initState();
  }
// commentVisibility[index].value = !commentVisibility[index].value;
  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(onTap: () {
              Get.back();
            },
                child: Icon(Icons.arrow_back_ios_new, size: 18.px)),
            const Text("Comments"),
            SizedBox(height: 10.px, width: 10.px)
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Add your navigation to profile logic here
                  },
                  child: CircleAvatar(
                    backgroundImage: widget.profileImage.startsWith("http")
                        ? NetworkImage(widget.profileImage) // Load from URL
                        : const AssetImage("assets/pngs/innoHub.png") as ImageProvider, // Load local asset
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
                            "${widget.firstName ?? "firstName"} ${widget.lastName ?? "lastName not available"}",
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 2.w),
                          if (widget.createdAt.isNotEmpty) // Check for null and empty
                            Text(
                              widget.createdAt,
                              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                            )
                          else
                            Text(
                              "Date not available",
                              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                            ),
                        ],
                      ),
                      Text(
                        widget.userName ?? "userName not available",
                        style: TextStyle(fontSize: 14.sp, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Align(alignment: Alignment.centerLeft,
              child: Text(widget.aboutPost ?? "No description available",
                  style: TextStyle(fontSize: 14.sp)),
            ),
            SizedBox(height: 1.h),
            GestureDetector(
              onTap: () {
                // Get.to(() => const PlayVideoScreen());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:widget.media.isNotEmpty
                    ? Image.network(
                  widget.media,height: 200.px,width: MediaQuery.of(context).size.width,
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
                    // postController.toggleLikePost(widget.post);
                  },
                  child: SvgPicture.asset(
                    widget.likes.contains(FirebaseService.auth.currentUser?.uid.toString())
                        ? "assets/svgs/heart.svg"
                        : "assets/svgs/whiteHeart.svg",
                  ),
                ),
                SizedBox(width: 1.w),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    widget.likes.isEmpty ? "" : widget.likes.length.toString(),
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    _commentFocusNode.requestFocus();
                  },
                  child: SvgPicture.asset("assets/svgs/comments.svg"),
                ),
                SizedBox(width: 1.w),

                // Use StreamBuilder to listen for the comment count
                StreamBuilder<int>(
                  stream: FirebaseService().getCommentCountStream(widget.postId), // Pass the post ID
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("..."); // Optional loading indicator
                    }

                    final commentCount = snapshot.data ?? 0; // Default to 0 if null

                    return GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(_commentFocusNode);
                      },
                      child: Text(
                        commentCount.toString(), // Display the real-time comment count
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    );
                  },
                ),
                Spacer(),
                SvgPicture.asset("assets/svgs/rePost.svg"),
                SizedBox(width: 1.w),
                Text("102K", style: TextStyle(fontSize: 14.sp)),
                Spacer(),
                SvgPicture.asset("assets/svgs/share.svg"),
                SizedBox(width: 1.w),
                Text("102.5K", style: TextStyle(fontSize: 14.sp)),
              ],
            ),
            Divider(thickness: 1, color: Colors.grey.shade300),


            Expanded(
              child: Obx(() {
                if (commentController.isLoading.value && commentController.comments.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: commentController.comments.length,
                  itemBuilder: (context, index) {
                    final comment = commentController.comments[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  commentController.toggleCommentVisibility(index);

                                },
                                child: CircleAvatar(
                                  backgroundImage: comment.profileImage.isNotEmpty
                                      ? NetworkImage(comment.profileImage)
                                      : AssetImage("assets/pngs/innoHub.png") as ImageProvider,
                                  radius: 20,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${comment.firstName ?? "firstName"} ${comment.lastName ?? "lastName not available"}",
                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.bold)),
                                        SizedBox(width: 1.5.w),
                                                  Text(comment.userName ?? "",
                                                      style: TextStyle(fontSize: 15.sp, color: Colors.grey)),
                                         SizedBox(width: 1.w),
                                        Flexible(
                                          child: Text(
                                            "${comment.createdAt.toLocal()} ?? "" ",
                                              style: TextStyle(fontSize: 15.sp, color: Colors.grey,overflow: TextOverflow.ellipsis)),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            commentController.toggleCommentVisibility(index);

                                          },
                                          child: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.0),
                                    Row(
                                      children: [
                                        Text("Replying to",
                                            style: TextStyle(
                                                fontSize: 16.sp, fontWeight: FontWeight.w400)),
                                        SizedBox(width: 1.5.w),
                                        Text(widget.userName,
                                            style: TextStyle(
                                                fontSize: 16.sp, color: Colors.blue)),
                                      ],
                                    ),
                                    Text(
                                      comment.commentText,
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                    SizedBox(height: 2.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset("assets/svgs/heart.svg"),
                                        SizedBox(width: 1.w),
                                        Text("102.5K", style: TextStyle(fontSize: 14.sp,overflow: TextOverflow.ellipsis)),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => const ReplyCommentScreen());
                                          },
                                          child: SvgPicture.asset("assets/svgs/comments.svg"),
                                        ),
                                        SizedBox(width: 1.w),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => const ReplyCommentScreen());
                                          },
                                          child: Text(
                                              "1k",
                                              style: TextStyle(fontSize: 14.sp,overflow: TextOverflow.ellipsis)),
                                        ),
                                        Spacer(),
                                        SvgPicture.asset("assets/svgs/rePost.svg"),
                                        SizedBox(width: 1.w),
                                        Text("102K", style: TextStyle(fontSize: 14.sp,overflow: TextOverflow.ellipsis)),
                                        Spacer(),
                                        SvgPicture.asset("assets/svgs/share.svg"),
                                        SizedBox(width: 1.w),
                                        Text("102.5K", style: TextStyle(fontSize: 14.sp,overflow: TextOverflow.ellipsis)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Replies Section (if any)
                        Obx(() {
                          if (commentController.commentVisibility[index] == true && comment.replies.isNotEmpty) {
                            return Padding(
                              padding: EdgeInsets.only(left: 60.0, bottom: 8.0),
                              child: Column(
                                children: comment.replies.map((reply) {
                                  return Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: reply.profileImage.isNotEmpty
                                            ? NetworkImage(reply.profileImage)
                                            : const AssetImage("assets/pngs/innoHub.png") as ImageProvider,
                                        radius: 15,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              reply.userName,
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 2.0),
                                            Text(
                                              reply.commentText,
                                              style: TextStyle(fontSize: 14.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            );
                          }
                          return SizedBox.shrink();
                        }),
                        Divider(thickness: 1, color: Colors.grey.shade300),
                      ],
                    );
                  },
                );
              }),
            ),

            // Divider before the input field
            Divider(thickness: 1, color: Colors.grey.shade300),

            // Input field for adding a comment
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 5, left: 16.0, right: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: commentController.commentController,
                      focusNode: commentController.commentFocusNode,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                        ),
                        hintText: 'Add a comment...',
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        String commentText = commentController.commentController.text.trim();
                        if (commentText.isNotEmpty) {
                          commentController.addComment(widget.postId, commentText);
                        }
                      },
                    ),
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

