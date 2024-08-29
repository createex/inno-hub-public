import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/text_styles.dart';
class StartUpFollowScreen extends StatelessWidget {
  const StartUpFollowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        leading: GestureDetector(onTap: () {
          Get.back();
        },
            child: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'Start Ups you follow',
          style: AppTextStyles.blackColorN,
        ),
        centerTitle: true,
      ),
      body:
      SizedBox(
        height: mediaQuerySize.height,
        width: mediaQuerySize.width,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.only(right: 3.w),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(right: 10.px, left: 10.px),
                    title:  Text('Zeeshan' ,style: AppTextStyles.textAccountBlack,),
                    subtitle:  Text('zeeshi', style: TextStyle(
                        fontSize: 11.px,
                        fontFamily: "regular",
                        color: const Color(0xff67686C)
                    ),),
                    trailing: Text("Following",style: TextStyle(
              fontSize: 12.px,
              color: AppColors.greenColorNew),),
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 3.w),
                    child: const Divider(
                      height: 0,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
