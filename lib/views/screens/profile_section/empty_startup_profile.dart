import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:in_hub/views/screens/profile_section/create_startup_profile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyStartupProfile extends StatelessWidget {
  const EmptyStartupProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 3.4.h),
          child: Column(children: [
            SizedBox(height: 8.h,),
            const Image(image: AssetImage("assets/pngs/starupimage.png")),
            SizedBox(height: 3.h,),
            customElevatedButton(
              onTap: () {
                Get.to(()=>const CreateStartupProfile());
              },
              title: Text("Create Startup Profile",style:  AppTextStyles.buttonTextStyle,)
            )
          ],),
        ),
      ),
    );
  }
}
