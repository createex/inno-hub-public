import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../models/feeds_description_model.dart';
class ReplyCommentScreen extends StatefulWidget {
  const ReplyCommentScreen({super.key});

  @override
  State<ReplyCommentScreen> createState() => _ReplyCommentScreenState();
}

class _ReplyCommentScreenState extends State<ReplyCommentScreen> {

  List<FeedsDescriptionModel> data1 = [
    FeedsDescriptionModel(
      profileImage: 'assets/pngs/innoHub.png',
      name: 'kiero_d',
      title: '@finch',
      time: '2 hours ago',
      desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,ut labore et dolore magna aliqua.',
    ),

  ];
  // This controller will be used to get the text input from the user
  final TextEditingController _commentController = TextEditingController();
  RxList<RxBool> commentVisibility=<RxBool>[].obs;

  @override
  void initState() {
    commentVisibility = List.generate(data1.length, (index) => false.obs).obs;
    super.initState();
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: data1.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // Get the current feed
                final feed = data1[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(  onTap: () {
                                // Get.to(() => StartUpOtherProfile());
                              },
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(feed.profileImage),
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
                                        Text(feed.name,
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 2.w),
                                        Text(feed.time,
                                            style:
                                            TextStyle(fontSize: 12.sp, color: Colors.grey)),

                                      ],
                                    ),
                                    Text(feed.title,
                                        style: TextStyle(
                                            fontSize: 14.sp, color: Colors.green)),

                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(feed.desc, style: TextStyle(fontSize: 14.sp)),
                          SizedBox(height: 2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                  "assets/svgs/heart.svg"),
                              SizedBox(width: 1.w,),
                              Text("102.5K", style: TextStyle(fontSize: 14.sp)),
                              Spacer(),
                              GestureDetector(onTap: () {
                                Get.to(() => const ReplyCommentScreen());

                              },
                                child: SvgPicture.asset(
                                    "assets/svgs/comments.svg"),
                              ),
                              SizedBox(width: 1.w,),

                              GestureDetector(onTap: () {
                                Get.to(() => const ReplyCommentScreen());

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

                    Divider(thickness: 1, color: Colors.grey.shade300),
                  ],
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 5),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _commentController,
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.2),)),
                        hintText: 'Add a comment...',hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2), )
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 1.4.w,vertical: 0.2.h),
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16)),
                    child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        // Handle comment send functionality here
                        String commentText = _commentController.text;
                        if (commentText.isNotEmpty) {
                          // Add your logic to handle the comment
                          print("User comment: $commentText");
                          _commentController.clear();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
