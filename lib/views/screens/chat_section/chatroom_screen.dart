import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatroomScreen extends StatelessWidget {
  final String userName;
  ChatroomScreen({super.key, required this.userName});
  final TextEditingController messageController = TextEditingController();
  final RxList chatList=[].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>
      SizedBox(
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
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.h),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(onTap: () {
                          Get.back();
                        },
                            child: Icon(Icons.arrow_back_ios_new_outlined)),
                        Text(
                          userName,
                          style: AppTextStyles.boldTextStyle
                              .copyWith(color: AppColors.headingColor, fontSize: 18.px),
                        ),
                        SizedBox(height: 10.px,width: 10.px,)
                      ],
                    ),
                  )),
              SizedBox(height: 2.h,),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.6.h,
                      vertical: 1.h
                    ),
                    child:Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(backgroundImage: AssetImage("assets/pngs/pngprofile.png"),),
                        SizedBox(width: 2.w,),
                        Container(
                          padding: EdgeInsets.all(1.h),
                          decoration: BoxDecoration(
                            color: AppColors.shadowColor,
                            borderRadius: BorderRadius.circular(
                             10
                            )
                          ),
                          child: Text(chatList[index]),
                        ),
                      ],
                    )
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 2.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: customTextFormField1(
                            prefix: "",
                            controller: messageController,
                            title: "Type your message...",
                          ),
                        ),
                        SizedBox(width: 1.h,),
                        GestureDetector(onTap: () {

                          chatList.add(messageController.text);
                          messageController.clear();
                        },
                            child: SvgPicture.asset("assets/svgs/send.svg"))
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 3.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
