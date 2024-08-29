import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_hub/controllers/getx_controllers/create_post_controller.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreatePost extends StatelessWidget {
  CreatePost({super.key});
  final CreatePostController createPostController =
      Get.put(CreatePostController());
  final RxList<String> images = <String>[].obs;
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  height: 6.h,
                ),
                Align(alignment: Alignment.topRight, child: Icon(Icons.close)),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 2.5.h,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const AssetImage(
                        "assets/pngs/profile.png",
                      ),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Text(
                      "Mohsin Ali Raza",
                      style: AppTextStyles.boldTextStyle.copyWith(
                        color: const Color(0xff424348),
                        fontSize: 16.px,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                TextField(
                  controller: descriptionController,
                  maxLines: descriptionController.text.isNotEmpty ? 3 : 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type here",
                      hintStyle: TextStyle(
                          fontSize: 14.px,
                          color: const Color(0xff787878),
                          fontWeight: FontWeight.w700)),
                ),
                SizedBox(
                  height: 3.h,
                ),
                // Obx(() =>
                //   Container(
                //     height: 26.h,
                //     width: 26.h,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(2.h)),
                //     child: ListView.builder(
                //       itemCount:images.length ,
                //       scrollDirection: Axis.horizontal,
                //       padding: EdgeInsets.zero,
                //       shrinkWrap: true,
                //       itemBuilder: (context, index) {
                //         return Container(
                //           height: 26.h,
                //           decoration: BoxDecoration(
                //             image:  DecorationImage(image:FileImage(File(images[index]))),
                //             color: AppColors.greyColor,
                //               borderRadius: BorderRadius.circular(2.h)),
                //         );
                //       },
                //     ),
                //   ),
                // ),
                createPostController.image.value == null
                    ? const SizedBox.shrink()
                    : Container(
                        height: 26.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(
                                  File(createPostController.image.value!.path),
                                ),
                                fit: BoxFit.cover),
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.circular(2.h)),
                      ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          createPostController
                              .pickImage(ImageSource.gallery)
                              .then(
                            (value) {
                              images
                                  .add(createPostController.image.value!.path);
                            },
                          );
                        },
                        child: SvgPicture.asset("assets/svgs/imageicon.svg")),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    SvgPicture.asset("assets/svgs/videoicon.svg"),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.h, vertical: 1.h),
                          decoration: BoxDecoration(
                              color: descriptionController.text.isNotEmpty
                                  ? AppColors.primaryColor
                                  : const Color(0xff787878).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(3.h)),
                          child: Text(
                            "Post",
                            style: AppTextStyles.buttonTextStyle
                                .copyWith(color: AppColors.whiteColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
