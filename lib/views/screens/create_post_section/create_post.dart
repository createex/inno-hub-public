import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_hub/controllers/getx_controllers/create_post_controller.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/getx_controllers/auth_controllers.dart';
class CreatePost extends StatelessWidget {
  CreatePost({super.key});

  final CreatePostController createPostController = Get.put(CreatePostController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    String uid = authController.auth.currentUser!.uid;
    authController.fetchUserData(uid);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.8.h),
          child: Obx(
                () => Column(
              children: [
                SizedBox(height: 6.h),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.close),
                  ),
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    // Display the user's profile image dynamically
                    Obx(() {
                      return CircleAvatar(
                        radius: 2.5.h,
                        backgroundColor: Colors.transparent,
                        backgroundImage: authController.profileImage.value.isNotEmpty
                            ? NetworkImage(authController.profileImage.value)
                            : const AssetImage("assets/pngs/profile.png") as ImageProvider,
                      );
                    }),
                    SizedBox(width: 1.h),
                    // Display the user's name dynamically
                    Obx(() {
                      // Display first name and last name together, if both are not empty
                      return Text(
                        authController.firstName.value.isNotEmpty && authController.lastName.value.isNotEmpty
                            ? '${authController.firstName.value} ${authController.lastName.value}' // Concatenate first and last names
                            : "Mohsin Ali", // Default fallback if the values are empty
                        style: TextStyle(
                          color: const Color(0xff424348),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.px,
                        ),
                      );
                    }),
                  ],
                ),                SizedBox(height: 3.h),

                // Post description text field
                TextFormField(
                  controller: createPostController.aboutPostController,
                  maxLines: createPostController.aboutPostController.text.isNotEmpty ? 3 : 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type here",
                    hintStyle: TextStyle(
                      fontSize: 14.px,
                      color: const Color(0xff787878),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                SizedBox(height: 3.h),

                // Display selected image
                createPostController.image.value == null
                    ? const SizedBox.shrink()
                    : Container(
                  height: 26.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(createPostController.image.value!.path)),
                      fit: BoxFit.cover,
                    ),
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(2.h),
                  ),
                ),

                const Spacer(),

                // Image picker and Post button row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        createPostController.pickImage(ImageSource.gallery);
                      },
                      child: SvgPicture.asset("assets/svgs/imageicon.svg"),
                    ),
                    SizedBox(width: 1.5.h),
                    SvgPicture.asset("assets/svgs/videoicon.svg"),

                    // Post button
                    Expanded(
                      child: Obx(
                            () => GestureDetector(
                          onTap: () async {
                            // Check if the post description is not empty
                            if (createPostController.aboutPostController.text.isNotEmpty) {
                              // Set the aboutPost observable value from the TextEditingController
                              createPostController.aboutPost.value =
                                  createPostController.aboutPostController.text;

                              // Start creating the post and set isLoading to true
                              createPostController.isLoading.value = true;

                              await createPostController.createPost();

                              // Set isLoading to false after the post is created
                              createPostController.isLoading.value = false;
                            } else {
                              Get.snackbar('Error', 'Post description cannot be empty.');
                            }
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                              decoration: BoxDecoration(
                                color: createPostController.aboutPostController.text.isNotEmpty
                                    ? AppColors.primaryColor
                                    : const Color(0xff787878).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(3.h),
                              ),
                              child: createPostController.isLoading.value
                                  ? LoadingAnimationWidget.waveDots(
                                color: Colors.white,
                                size: 30.px,
                              )
                                  : Text(
                                "Post",
                                style: AppTextStyles.buttonTextStyle.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 3.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
