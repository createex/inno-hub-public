import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:in_hub/views/screens/profile_section/create_startup_profile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../chat_section/main_chat.dart';
import '../custom_widgets/app_keys.dart';
import '../custom_widgets/custom_textformfield.dart';
import '../search_section/search_screen.dart';

class EmptyStartupProfile extends StatelessWidget {
  const EmptyStartupProfile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController  searchController=TextEditingController();
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(children: [
            SizedBox(height: 8.h,),
            Row(
              children: [
                // GestureDetector(
                //     onTap: () {
                //       AppKeys.scaffoldKey.currentState?.openDrawer();
                //     },
                //     child: Image.asset('assets/pngs/Ellipse 41.png',)),
                GestureDetector(onTap: () {
                  AppKeys.scaffoldKey.currentState?.openDrawer();
                },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/pngs/iqrapro.png"),
                    radius: 20,
                  ),
                ),
                Spacer(),
                Image.asset("assets/pngs/innoHubLogo.png"),
                const Spacer(),
                GestureDetector(onTap: () {
                  Get.to(() =>  SearchScreen());

                },
                    child: SvgPicture.asset("assets/svgs/innoHubSearch.svg")),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 1),
                  child: GestureDetector(
                      onTap: () {
                        Get.to(() => MainChatScreen());
                      },
                      child: Image.asset('assets/pngs/bxs_chat.png',)),
                )
              ],
            ),
            SizedBox(height: 15.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.h),
              child: const Image(image: AssetImage("assets/pngs/starupimage.png")),
            ),
            SizedBox(height: 3.h,),
            customElevatedButton(height:35.px ,
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
