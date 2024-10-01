import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:in_hub/views/screens/profile_section/work_experience.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'education_experience.dart';
class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen> {
  final TextEditingController emailController=TextEditingController();
  // final TextEditingController emailController=TextEditingController();
  // final TextEditingController emailController=TextEditingController();
  // final TextEditingController emailController=TextEditingController();
  // final TextEditingController emailController=TextEditingController();
  List<String> data=[
    "Createex",
    "UI/UX Designer",
    "01.01.2023 to 01.01.2024",
    "Lahore,Pakistan"
  ];
  List<String> data1=[
    "UCP",
    "UI/UX Designer",
    "01.01.2023 to 01.01.2024",
    "My role is design screen for company's play store apps. Starting from idea to prepare design hand-off for the developers."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 2.h,),
              const Text("About",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              const Text("""I am a visual designer from Lahore, Pakistan." I love understanding how people interact, and I enjoy creating designs that are user-friendly. I have a strong passion for all things related to interaction, particularly with a keen focus on human-centered design thinking. """,),
              Divider(color: Colors.grey.withOpacity(0.2),),
              SizedBox(height: 1.h,),
              GestureDetector(onTap: () {
                Get.to(()=>const WorkExperience());
              },
                child:  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(  onTap: () {
                      Get.to(()=>const WorkExperience());

                    },
                        child: Text("Work experience",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)),
                    GestureDetector(onTap: () {
                      Get.to(()=>const WorkExperience());

                    },
                        child: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              Divider(color: Colors.grey.withOpacity(0.2),),
               SizedBox(height: 1.h,),
               SizedBox(height: 400,
                 child: ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                     itemCount: data.length,
                     itemBuilder: (context,index){
                   return Padding(
                     padding:  EdgeInsets.symmetric(vertical: 1.h),
                     child: Row(mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         CircleAvatar(backgroundImage: AssetImage("assets/pngs/pngprofile.png"),),
                         SizedBox(width: 2.w,),
                         Expanded(
                           child: Column(  crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(data[0],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                               SizedBox(height: 1.h,),
                               Text(data[1],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                               SizedBox(height: 0.4.h,),
                               Text(data[2],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
                               SizedBox(height: 0.4.h,),
                               Text(data[3],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),

                             ],
                           ),
                         )
                       ],
                     ),
                   );

                 }),
               ),
              SizedBox(height: 1.h,),
               Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(onTap: () {
                    Get.to(()=>EducationExperience());
                  },
                      child: Text("Education",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)),
                  GestureDetector(onTap:() {
                    Get.to(()=>EducationExperience());

                  } ,
                      child: Icon(Icons.arrow_forward_ios))
                ],
              ),
              Divider(color: Colors.grey.withOpacity(0.2),),
              SizedBox(height: 1.h,),
              SizedBox(height: 400,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data1.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding:  EdgeInsets.symmetric(vertical: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(backgroundImage: AssetImage("assets/pngs/pngprofile.png"),),
                            SizedBox(width: 2.w,),
                            Expanded(
                              child: Column(  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data1[0],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                                  SizedBox(height: 1.h,),
                                  Text(data1[1],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                                  SizedBox(height: 0.4.h,),
                                  Text(data1[2],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
                                  SizedBox(height: 0.4.h,),
                                  Text(data1[3],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),

                                ],
                              ),
                            )
                          ],
                        ),
                      );

                    }),
              ),
              SizedBox(height: 1.h,),
              Text("Looking For",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                      decoration: BoxDecoration(border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Challenge1"),
                    ),
                    SizedBox(width: 3.w,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                      decoration: BoxDecoration(border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Challenge2"),
                    ),
                    SizedBox(width: 3.w,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                      decoration: BoxDecoration(border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Challenge3"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              Text("Skills",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                      decoration: BoxDecoration(border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(" Funding needs"),
                    ),
                    SizedBox(width: 3.w,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                      decoration: BoxDecoration(border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Partnership opportunities"),
                    ),
                    SizedBox(width: 3.w,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                      decoration: BoxDecoration(border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(" Special talents"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              Text("Roles I Can Fulfill",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("Mentor, advisor, or operational manager.",style: TextStyle(fontWeight: FontWeight.w400),),
              SizedBox(height: 1.h,),
              Text("Industry Interests",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("technology, healthcare, or education",style: TextStyle(fontWeight: FontWeight.w400),),
              SizedBox(height: 1.h,),
              Text("Languages",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("key technologies",style: TextStyle(fontWeight: FontWeight.w400),),
              SizedBox(height: 1.h,),
              Text("Start-ups Associated With",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",style: TextStyle(fontWeight: FontWeight.w400),),
const SizedBox(height: 10,  width: 10,),

            ],),
        ),
      ),
    );
  }
}
