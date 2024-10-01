import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/calender_controller.dart';
import '../../../controllers/utils/text_styles.dart';
import '../../custom_widget/custom_textfield.dart';
class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  List<String> data=[
    "Createex",
    "UI/UX Designer",
    "My role is design screen for company's play store apps. Starting from idea to prepare design hand-off for the developers."
  ];
  CalendarController calendarController =Get.put(CalendarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(children: [
          SizedBox(height:8.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap:(){
                  Get.back();
                },
                    child: const Icon(Icons.arrow_back_ios_new)),
                Text("Work experience",style: AppTextStyles.blackColorN,),
                SizedBox(height: 10.px,width: 10.px,)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: 1.h),
                    child: Column(
                      children: [
                        SizedBox(width: 2.w,),
                        Column(  crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data[0],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                                GestureDetector(onTap: () {
                                  editWorkExperience(context);
                                },
                                    child: SvgPicture.asset("assets/svgs/edit.svg"))
                              ],
                            ),
                            SizedBox(height: 1.h,),
                            Text(data[1],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                            SizedBox(height: 0.4.h,),
                            Text(data[2],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
                            Divider(color: Colors.grey.withOpacity(0.2),),

                          ],
                        )
                      ]
                  )
                  );

                }),
          ),
          SizedBox(height: 8.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 6.w),
            child: ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))
            ),
                onPressed: (){
                  addWorkExperience(context);
                }, child: Center(child: Text("Add Work experience",style: TextStyle(color: Colors.white),))),
          ),
SizedBox(height: 20,width: 20,)
        ],),
      ),
    );
  }
  void addWorkExperience(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent, // Transparent background for Material
            child: Container(
              width: 90.w, // Width responsive to screen width
              padding: EdgeInsets.symmetric(
                horizontal: 2.h, // Responsive horizontal padding
                vertical: 2.h, // Responsive vertical padding
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h), // Responsive border radius
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Adjust the height based on content
                children: [
                  Center(
                    child: Text(
                      'Add Work experience',
                      style: TextStyle(
                        fontSize: 14.px, // Responsive font size
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey.withOpacity(0.2),),
                  SizedBox(height: 1.h,),
                  const CircleAvatar(backgroundImage: AssetImage("assets/pngs/profile.png"),radius: 30,),
                  SizedBox(height: 3.h), // Responsive vertical spacing
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'Position',
                      style: TextStyle(
                        fontSize: 12.px, fontWeight: FontWeight.w400// Responsive font size
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 0.4.h),
                  CustomTextFormField(),
                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'Work Type',
                      style: TextStyle(
                          fontSize: 12.px, fontWeight: FontWeight.w400// Responsive font size
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 0.4.h),
                  CustomTextFormField(),
                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'Company Name',
                      style: TextStyle(
                          fontSize: 12.px, fontWeight: FontWeight.w400// Responsive font size
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 0.4.h),
                  CustomTextFormField(),
                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "This is my current position now ",
                        style: TextStyle(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'bold',
                            color: const Color(0xff272828)),
                      ),
                      ToggleSwitch(
                        minWidth: 2.5.h,
                        minHeight: 2.5.h,
                        cornerRadius: 3.h,
                        inactiveBgColor:
                        AppColors.greyColor.withOpacity(0.3),
                        inactiveFgColor: Colors.grey,
                        activeBgColor: [AppColors.primaryColor,AppColors.greyColor],
                        initialLabelIndex: 1,
                        totalSwitches: 2,
                        radiusStyle: true,
                        onToggle: (index) {},
                      )
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("Start Date"),
                      Text("Finish Date"),
                      SizedBox(height: 10.px,width: 10.px,)
                    ],
                  ),
                  SizedBox(height: .7.h),
                  Obx(() => Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(onTap: () {
                        calendarController.selectStartDate(context);
                      },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                "assets/svgs/calender.svg",
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                DateFormat('yyyy-MM-dd').format(calendarController.selectedStartDate.value),

                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w,),
                      Text("To",),
                      SizedBox(width: 2.w,),

                      Obx(() => GestureDetector(onTap: () {
                        calendarController.selectEndDate(context);
                      },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                              border:  Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 2.w),

                              SvgPicture.asset(
                                "assets/svgs/calender.svg",
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                DateFormat('yyyy-MM-dd').format(calendarController.selectedEndDate.value),

                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  )),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.px),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:Color(0xff7C7C7C),
                              borderRadius: BorderRadius.circular(1.1.h),
                            ),
                            child: Text('Deny', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                   SizedBox(width: 2.h,),                      // Replaced custom method with SizedBox for simplicity
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.px),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(1.1.h),
                            ),
                            child: Text(
                              'Add',
                              style: TextStyle(color: Colors.white)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Responsive vertical spacing
                  SizedBox(height: 3.2.h), // Responsive vertical spacing

                ],
              ),
            ),
          ),
        );
      },
    );
  }}
void editWorkExperience(BuildContext context) {
  CalendarController calendarController =Get.put(CalendarController());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Material(
          color: Colors.transparent, // Transparent background for Material
          child: Container(
            width: 90.w, // Width responsive to screen width
            padding: EdgeInsets.symmetric(
              horizontal: 2.h, // Responsive horizontal padding
              vertical: 2.h, // Responsive vertical padding
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.h), // Responsive border radius
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, // Adjust the height based on content
              children: [
                Center(
                  child: Text(
                    'Edit Work experience',
                    style: TextStyle(
                      fontSize: 14.px, // Responsive font size
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Divider(color: Colors.grey.withOpacity(0.2),),
                SizedBox(height: 1.h,),
                const CircleAvatar(backgroundImage: AssetImage("assets/pngs/profile.png"),radius: 30,),
                SizedBox(height: 3.h), // Responsive vertical spacing
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    'Position',
                    style: TextStyle(
                        fontSize: 12.px, fontWeight: FontWeight.w400// Responsive font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 0.4.h),
                CustomTextFormField(),
                SizedBox(height: 1.h), // Responsive vertical spacing
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    'Work Type',
                    style: TextStyle(
                        fontSize: 12.px, fontWeight: FontWeight.w400// Responsive font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 0.4.h),
                CustomTextFormField(),
                SizedBox(height: 1.h), // Responsive vertical spacing
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    'Company Name',
                    style: TextStyle(
                        fontSize: 12.px, fontWeight: FontWeight.w400// Responsive font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 0.4.h),
                CustomTextFormField(),

                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text("Start Date"),
                    Text("Finish Date"),
                    SizedBox(height: 10.px,width: 10.px,)
                  ],
                ),
                SizedBox(height: .7.h),
                Obx(() => Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(onTap: () {
                      calendarController.selectStartDate(context);
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/calender.svg",
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              DateFormat('yyyy-MM-dd').format(calendarController.selectedStartDate.value),

                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w,),
                    Text("To",),
                    SizedBox(width: 2.w,),

                    Obx(() => GestureDetector(onTap: () {
                      calendarController.selectEndDate(context);
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                            border:  Border.all(color: Colors.grey)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 2.w),

                            SvgPicture.asset(
                              "assets/svgs/calender.svg",
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              DateFormat('yyyy-MM-dd').format(calendarController.selectedEndDate.value),

                            ),
                          ],
                        ),
                      ),
                    )),
                  ],
                )),
                SizedBox(height: 5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.px),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:Color(0xff7C7C7C),
                            borderRadius: BorderRadius.circular(1.1.h),
                          ),
                          child: Text('Deny', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(width: 2.h,),                      // Replaced custom method with SizedBox for simplicity
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.px),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(1.1.h),
                          ),
                          child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Responsive vertical spacing
                SizedBox(height: 3.2.h), // Responsive vertical spacing

              ],
            ),
          ),
        ),
      );
    },
  );
}



