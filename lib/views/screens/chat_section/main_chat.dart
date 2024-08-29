import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/chat_section/chatroom_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainChatScreen extends StatelessWidget {
  const MainChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                height: 10.h,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border(
                        bottom: BorderSide(
                            color: AppColors.shadowColor, width: .4.h))),
                child: Text(
                  "Chat",
                  style: AppTextStyles.boldTextStyle
                      .copyWith(color: AppColors.headingColor, fontSize: 18.px),
                )),
            SizedBox(
              height: 1.8.h,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.6.h,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ChatroomScreen(
                            userName: "Devon Lane",
                          ));
                    },
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 3.h,
                            child: Image.asset(
                              "assets/pngs/profile.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          title: Text(
                            "Devon Lane",
                            style: AppTextStyles.boldTextStyle.copyWith(
                                color: AppColors.headingColor, fontSize: 14.px),
                          ),
                          subtitle: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
                            style: AppTextStyles.regularStyle.copyWith(
                                color: AppColors.headingColor, fontSize: 11.px),
                          ),
                          trailing: Text(
                            "4:10 am",
                            style: AppTextStyles.regularStyle.copyWith(
                                color: AppColors.headingColor, fontSize: 12.px),
                          ),
                        ),
                        Divider(
                          color: AppColors.shadowColor,
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
