import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/text_styles.dart';
class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height:8.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap:(){
                  Get.back();
                },
                    child: const Icon(Icons.arrow_back_ios_new)),
                Text("Startups",style: AppTextStyles.blackColorN,),
                SizedBox(height: 10.px,width: 10.px,)
              ],
            ),
            SizedBox(height: 2.h,),
            Wrap(
              children: List.generate(
                2,
                    (index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 2.w),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                      vertical: 1.h, ),
                    // padding: EdgeInsets.all(8.px),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.px),
                        border:
                        Border.all(color: AppColors.shadowColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                height: MediaQuery.of(context).size.height * 0.186,
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                                  image: DecorationImage(
                                    image: AssetImage("assets/pngs/image.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: MediaQuery.of(context).size.width*0.04,
                                right: 2,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors.whiteColor, width: 3)),
                                        child: CircleAvatar(
                                          radius: 4.5.h,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: const AssetImage(
                                            "assets/pngs/profile.png",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 3.w),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Zeeshan",
                                style: TextStyle(
                                  fontSize: 18.px,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Flexible(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.px),
                                        side: const BorderSide(
                                            color: AppColors.greenColor3,
                                            width: 1)),
                                  ),
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(
                                        fontSize: 16.px,
                                        color: AppColors.greenColor3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:3.w),
                          child: const Text('I am a visual designer from Lahore, Pakistan." I love understanding how people interact,'),
                        ),
                        SizedBox(height: 1.h),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 3.w),
                          child: Row(
                            children: [
                              Image.asset('assets/pngs/ion_people.png'),
                              SizedBox(width: 2.w,),
                              Text(
                                  '500',
                                  style:
                                  TextStyle(color: Colors.black)),
                              SizedBox(width: 1.w,),

                              Text(
                                  'Followers',
                                  style:
                                  TextStyle(color: Colors.black)),
                            ],
                          ),
                        )

                        // Row(
                        //   children: [
                        //     CircleAvatar(
                        //       backgroundImage: const AssetImage(
                        //           "assets/pngs/pngprofile.png"),
                        //       radius: 25.px,
                        //     ),
                        //     SizedBox(
                        //       width: 10.px,
                        //     ),
                        //     Column(
                        //       crossAxisAlignment:
                        //           CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           "Zeeshan",
                        //           style: TextStyle(
                        //             fontSize: 18.px,
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //         Text(
                        //           "Username",
                        //           style: TextStyle(
                        //             fontSize: 14.px,
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.normal,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     SizedBox(
                        //       width: 50.px,
                        //     ),
                        //     Expanded(
                        //       child: ElevatedButton(
                        //         onPressed: () {},
                        //         style: ElevatedButton.styleFrom(
                        //           backgroundColor: Colors.white,
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius:
                        //                   BorderRadius.circular(10.px),
                        //               side: const BorderSide(
                        //                   color: AppColors.greenColor3,
                        //                   width: 1)),
                        //         ),
                        //         child: Text(
                        //           "Follow",
                        //           style: TextStyle(
                        //               fontSize: 16.px,
                        //               color: AppColors.greenColor3),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        // SizedBox(height: 2.h),
                        // const Text('Industry'),
                        // const Text('Location'),
                        // SizedBox(height: 1.h),
                        // Row(
                        //   children: [
                        //     Image.asset('assets/pngs/ion_people.png'),
                        //     RichText(
                        //         text: TextSpan(children: [
                        //       const TextSpan(
                        //           text: ' Number of peoples follow ',
                        //           style:
                        //               TextStyle(color: Colors.black)),
                        //       TextSpan(
                        //           text: '100K',
                        //           style: TextStyle(
                        //               color: AppColors.primaryColor))
                        //     ]))
                        //   ],
                        // )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
