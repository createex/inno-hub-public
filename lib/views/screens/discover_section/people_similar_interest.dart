import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/text_styles.dart';
class PeopleSimilarInterest extends StatefulWidget {
  const PeopleSimilarInterest({Key? key}) : super(key: key);

  @override
  State<PeopleSimilarInterest> createState() => _PeopleSimilarInterestState();
}

class _PeopleSimilarInterestState extends State<PeopleSimilarInterest> {
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
                Text("People with similar interests",style: AppTextStyles.blackColorN,),
                SizedBox(height: 10.px,width: 10.px,)
              ],
            ),
            SizedBox(height: 2.h,),
            Wrap(
              children: List.generate(
                4,
                    (index) {
                  return Container(
                    // height: MediaQuery.of(context).size.height*0.20 ,
                      width: MediaQuery.of(context).size.width / 2.5,
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

          ],),
        ),
      ),
    );
  }
}
