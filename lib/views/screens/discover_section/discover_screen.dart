import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/discover_section/connection_request.dart';
import 'package:in_hub/views/screens/discover_section/similar_interest.dart';
import 'package:in_hub/views/screens/search_section/search_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../custom_widgets/custom_textformfield.dart';


class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 8.h), // Adjust spacing as needed
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              children: [
                Text("InnoHub", style: AppTextStyles.textSearchPrimaryColor),
                SizedBox(width:2.w),
                Expanded(
                  child: SearchCustomTextFormField(
                    controller:searchController ,
                    hintText: 'Discover',
                    prefixIcon: SvgPicture.asset("assets/svgs/search.svg"),
                    readOnly: true, onTap: () {
                      Get.to(()=>SearchScreen());
                  },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:2.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0), // Added padding for the Row
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Connects request (5)"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(), // Disable scrolling inside ListView
                  shrinkWrap: true, // Make ListView take up only the necessary space
                  itemCount: 3, // Adjust according to your data
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Added horizontal padding
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage("assets/pngs/pngprofile.png"),
                                radius: 24, // Reduced radius for smaller avatars
                              ),
                              const SizedBox(width: 16.0), // Replaced SizedBox(width: 2.w) with a fixed value
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Jone Smith", style: AppTextStyles.textBlackColor),
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
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                              SizedBox(width:3.w),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Handle revise action
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.w),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.greyColor),
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Text('Deny', style: AppTextStyles.greyColor10),
                                    ),
                                  ),
                                  const SizedBox(width: 8.0), // Replaced getHorizontalSpace(1.h) with a fixed value
                                  GestureDetector(
                                    onTap: () {
                                      // Handle go live action
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24),border: Border.all(color: AppColors.greenColor3,)
                                      ),
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
                          Divider(color: AppColors.greyColor,)
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text("People with similar interests",style: AppTextStyles.blackColorN,),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( vertical: 2.h,horizontal: 2.w),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h, // Adjust the height based on your needs
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, // Number of items
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                        padding: EdgeInsets.all(8.px),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.px),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage("assets/pngs/pngprofile.png"),
                              radius: 40.px,
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
                              "Interest",
                              style: TextStyle(
                                fontSize: 14.px,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            ElevatedButton(
                              onPressed: () {
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.px),side:
                                const BorderSide(color: AppColors.greenColor3,width: 2)
                                ),
                              ),
                              child: Text(
                                "Connect",
                                style: TextStyle(
                                    fontSize: 16.px,
                                    color:AppColors.greenColor3
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Get.to(()=>const ConnectionRequestScreen());
                          }
                          ,
                          child: Align(alignment:Alignment.center,
                              child: Text("View All",style: AppTextStyles.buttonTextStyle.copyWith(color: AppColors.primaryColor),)),
                        ),
                        Text("Startups",style:AppTextStyles.blackColorN,),
                      ],
                    )),
                SizedBox(
                  height: 30.h, // Adjust the height based on your needs
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, // Number of items
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                        padding: EdgeInsets.all(8.px),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.px),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage("assets/pngs/pngprofile.png"),
                              radius: 40.px,
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
                              "Interest",
                              style: TextStyle(
                                fontSize: 14.px,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            ElevatedButton(
                              onPressed: () {
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.px),side:
                                const BorderSide(color: AppColors.greenColor3,width: 2)
                                ),
                              ),
                              child: Text(
                                "Connect",
                                style: TextStyle(
                                    fontSize: 16.px,
                                    color:AppColors.greenColor3
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: [

                        GestureDetector( onTap:(){
                          Get.to(()=>const SimilarInterest());
                        },
                            child: Text("View All",style: AppTextStyles.buttonTextStyle.copyWith(color: AppColors.primaryColor),)),
                      ],
                    )),
              ],
            ),
          )
        ],),
      ),
    );
  }
}