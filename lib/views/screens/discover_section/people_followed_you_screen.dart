import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/getx_controllers/followed_controller.dart';
import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/text_styles.dart';

class PeopleFollowedYouScreen extends StatelessWidget {
  PeopleFollowedYouScreen({super.key});

  final PeopleFollowedYouController controller = Get.put(PeopleFollowedYouController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        leading: GestureDetector(onTap:(){
          Get.back();
        },
            child: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'People followed you',
          style: AppTextStyles.blackColorN,
        ),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Image.asset(
                  controller.data[index]["leading"]!,
                  width: 36, // Adjust width as needed
                  height: 36, // Adjust height as needed
                ),
                title: Text(
                  controller.data[index]["title"]!,
                  style: AppTextStyles.textAccountBlack,
                ),
                subtitle: Text(
                  controller.data[index]["subtitle"]!,
                  style: TextStyle(
                      fontSize: 11.px,
                      fontFamily: "regular",
                      color: const Color(0xff67686C)
                  ),
                ),
                trailing: SizedBox(
                  height: 32.px,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return controller.data[index]["isFollowing"]!
                              ? AppColors.greenColorNew
                              : Colors.white;
                        },
                      ),
                      side: MaterialStateProperty.all<BorderSide?>(
                        const BorderSide(color: AppColors.greenColorNew),
                      ),
                    ),
                    onPressed: () {
                      controller.toggleFollowing(index);
                    },
                    child: Text(
                      controller.data[index]["isFollowing"]! ? "Following" : "Follow back",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: "regular",
                        color: controller.data[index]["isFollowing"]!
                            ? Colors.white
                            : AppColors.greenColorNew,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: const Divider(
                  color: Color(0xffEDEDED),
                ),
              )
            ],
          );
        },
      )),
    );
  }
}