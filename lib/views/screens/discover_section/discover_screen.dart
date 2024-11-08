import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/chat_section/main_chat.dart';
import 'package:in_hub/views/screens/discover_section/manage_network.dart';
import 'package:in_hub/views/screens/discover_section/people_similar_interest.dart';
import 'package:in_hub/views/screens/discover_section/startups_screen.dart';
import 'package:in_hub/views/screens/search_section/search_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../custom_widgets/app_keys.dart';
import 'connection_request.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: AppColors.greyColor2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8.h), // Adjust spacing as needed
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Row(
                  children: [
                    // GestureDetector(
                    //     onTap: () {
                    //       AppKeys.scaffoldKey.currentState?.openDrawer();
                    //     },
                    //     child: Image.asset('assets/pngs/Ellipse 41.png',)),
                    GestureDetector(onTap: () {
                      AppKeys.scaffoldKey.currentState?.openDrawer();
                    },
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/pngs/iqrapro.png"),
                        radius: 20,
                      ),
                    ),
                    Spacer(),
                    Image.asset("assets/pngs/innoHubLogo.png"),
                    // getHorizontalSpace(2.w),
                    // Expanded(
                    //   child: SearchCustomTextFormField(
                    //     onTap: () {
                    //       Get.to(() => SearchScreen());
                    //     },
                    //     readOnly: true,
                    //     hintText: 'Search',
                    //     controller: searchController,
                    //     suffixIcon: SvgPicture.asset("assets/svgs/search.svg"),
                    //   ),
                    // ),
                    Spacer(),
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
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.only(left: 4.w,right: 1.5.w),
                child: Row(
                  children: [
                    Text(
                      "Manage network",
                      style: AppTextStyles.blackColorN,
                    ),
                    Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                Get.to(() => const ManageNetworkScreen());
                              },
                              icon: const Icon(Icons.arrow_forward))),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0), // Added padding for the Row
                      child: GestureDetector(onTap: () {
                        Get.to(()=>const ConnectionRequestScreen());
                      },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Connects request (5)" ,style: AppTextStyles.blackColorN,),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable scrolling inside ListView
                      shrinkWrap:
                          true, // Make ListView take up only the necessary space
                      itemCount: 3, // Adjust according to your data
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0), // Added horizontal padding
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/pngs/pngprofile.png"),
                                    radius:
                                        20, // Reduced radius for smaller avatars
                                  ),
                                  const SizedBox(
                                      width:
                                          16.0), // Replaced SizedBox(width: 2.w) with a fixed value
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Jone Smith",
                                            style:
                                                AppTextStyles.textBlackColor),
                                        RichText(
                                          text: const TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Interests',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' 8 hour ago',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Handle revise action
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 5.w),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.greyColor),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text('Deny',
                                              style: AppTextStyles.greyColor10),
                                        ),
                                      ),
                                      const SizedBox(
                                          width:
                                              8.0), // Replaced getHorizontalSpace(1.h) with a fixed value
                                      GestureDetector(
                                        onTap: () {
                                          // Handle go live action
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 12.0),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: AppColors.greenColor3,
                                              )),
                                          child: Text(
                                            'Accept',
                                            style: AppTextStyles.greyColor10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(
                                color: AppColors.greyColor7,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: GestureDetector(onTap: () {
                        Get.to(()=>const PeopleSimilarInterest());
                      },
                        child: Row(
                          children: [
                            Text(
                              "People with similar interests",
                              style: AppTextStyles.blackColorN,
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "View All",
                                  style: AppTextStyles.textGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                child: Column(
                  children: [
                    Wrap(
                      children: List.generate(
                        5,
                        (index) {
                          return Container(
                            // height: MediaQuery.of(context).size.height*0.20 ,
                            width: MediaQuery.of(context).size.width / 2.3,
                            margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                            padding: EdgeInsets.only(bottom: 8.px,),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.greyColor7),
                              borderRadius: BorderRadius.circular(16.px),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.12 ,
                                  child: Stack(children: [
                                    ClipRRect(borderRadius:BorderRadius.only(topRight: Radius.circular(16.px),topLeft: Radius.circular(16.px)),
                                        child: Image.asset("assets/pngs/imageNew.png")),
                                    Positioned(
                                      top: 15,
                                      left: MediaQuery.of(context).size.width*0.10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors.whiteColor, width: 3)),
                                        child: CircleAvatar(
                                          radius: 4.5.h,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage:  AssetImage(
                                            "assets/pngs/profile.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  "Zeeshan",
                                  style: TextStyle(
                                    fontSize: 18.px,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 0.5.h),
                                Text(
                                  "Interests",
                                  style: TextStyle(
                                    fontSize: 14.px,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 4.w),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(300, 35),
                                      backgroundColor: AppColors.greyColor2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.px),
                                          side: const BorderSide(
                                              color: AppColors.greenColor3,
                                              width: 1)),
                                    ),
                                    child: Text(
                                      "Connect",
                                      style: TextStyle(
                                          fontSize: 16.px,
                                          color: AppColors.greenColor3),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Row(
                        children: [
                          GestureDetector(onTap:(){
                            Get.to(()=>const StartUpScreen());
                          },
                            child: Text(
                              "Startups",
                              style: AppTextStyles.blackColorN,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(onTap: () {
                                Get.to(()=>const StartUpScreen());

                              },
                                child: Text(
                                  "View All",
                                  style: AppTextStyles.textGreen,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
