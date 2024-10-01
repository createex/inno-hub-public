import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayVideoScreen extends StatelessWidget {
  const PlayVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: mediaQuerySize.height,
        width: mediaQuerySize.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/pngs/backgroundImage.png'))),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 10.h, // Adjust bottom position as needed
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                          const AssetImage("assets/pngs/backgroundImage.png"),
                          radius: 20.sp,
                        ),
                        SizedBox(
                            width: 2.w), // Add space between avatar and name
                        Text(
                          "John Doe", // Add your name here
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: "medium",
                          ),
                        ),
                        SizedBox(
                            width: 2.h), // Add space between name and button
                        SizedBox(
                          height: 3.5.h,
                          child: ElevatedButton(
                            onPressed: () {
                              // Add functionality for the follow button
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: AppColors.primaryColor),
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontFamily: "medium",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                        "Hi everyone, what's on your mind today? Let's \nshare and connect!",
                        style: TextStyle(
                            fontFamily: "regular",
                            color: Colors.white,
                            fontSize: 14.sp))
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 18.h,
              left: 74.w,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: Container(
                  // width: 15.w,
                  decoration: BoxDecoration(
                    // color: CustomColor.mainGreyColor,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 2.h),
                      SvgPicture.asset("assets/svgs/inniHubHeart.svg"),
                      SizedBox(height: 0.5.h),
                      Text(
                        "225.8K",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: "regular",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      GestureDetector(
                          onTap: () {},
                          child:
                          SvgPicture.asset("assets/svgs/innoHubComment.svg")),
                      SizedBox(height: 0.5.h),
                      Text(
                        "5.1K",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: "regular",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      // SvgPicture.asset("assets/svgs/share_icon.svg"),
                      SizedBox(height: 0.5.h),
                      SvgPicture.asset("assets/svgs/innoHubShare.svg"),
                      Text(
                        "5.7K",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: "regular",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10.px,
              right: 10.px,
              child: Container(
                height: mediaQuerySize.height * 0.065,
                width: mediaQuerySize.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.whiteColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: mediaQuerySize.width * 0.01,
                    ),
                    SizedBox(
                        width: mediaQuerySize.width * 0.5,
                        child: TextFormField(
                          decoration:
                           const InputDecoration(hintText: 'Leave Comments',border: UnderlineInputBorder(borderSide: BorderSide.none)),
                        )),
                    SizedBox(
                        width: mediaQuerySize.width * 0.35,
                        child: Align(
                            alignment: Alignment.centerRight,
                            child:
                            SvgPicture.asset('assets/svgs/sentIcon.svg'))),
                    SizedBox(
                      width: mediaQuerySize.width * 0.01,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}