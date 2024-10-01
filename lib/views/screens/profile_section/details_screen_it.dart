import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:in_hub/views/screens/profile_section/edit_profile_screen.dart';
import 'package:in_hub/views/screens/profile_section/edit_startup_profile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/utils/text_styles.dart';
import '../custom_widgets/custom_widgets.dart';
class DetailScreenIt extends StatefulWidget {
  const DetailScreenIt({super.key});

  @override
  State<DetailScreenIt> createState() => _DetailScreenItState();
}

class _DetailScreenItState extends State<DetailScreenIt> {
  final TextEditingController emailController=TextEditingController();
  // final TextEditingController emailController=TextEditingController();
  // final TextEditingController emailController=TextEditingController();
  // final TextEditingController emailController=TextEditingController();
  // final TextEditingController emailController=TextEditingController();
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
              // Text("Name",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              // SizedBox(height: 0.5.h,),
              // Text("Answer",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              // Divider(color: Colors.grey.withOpacity(0.2),),
              // SizedBox(height: 1.h,),
              // Text("Last name",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              // SizedBox(height: 0.5.h,),
              // Text("Answer",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              // Divider(color: Colors.grey.withOpacity(0.2),),
              // SizedBox(height: 1.h,),
              // Text("Bio",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              // SizedBox(height: 0.5.h,),
              // Text("Answer",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              // Divider(color: Colors.grey.withOpacity(0.2),),
              // SizedBox(height: 1.h,),
              // Text("Looking for",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              // SizedBox(height: 0.5.h,),
              // Text("Answer",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              // Divider(color: Colors.grey.withOpacity(0.2),),
              // SizedBox(height: 1.h,),
              // Text("Industry",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              // SizedBox(height: 0.5.h,),
              // Text("Answer",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              // Divider(color: Colors.grey.withOpacity(0.2),),
              // SizedBox(height: 1.h,),
              // Text("Size",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              // SizedBox(height: 0.5.h,),
              // Text("Answer ",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              // Divider(color: Colors.grey.withOpacity(0.2),),
              // SizedBox(height: 1.h,),
              // Text("Product status",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              // SizedBox(height: 0.5.h,),
              // Text("Answer ",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              // Divider(color: Colors.grey.withOpacity(0.2),),
              // SizedBox(height: 1.h,),
              // Text("Target market",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              // SizedBox(height: 0.5.h,),
              // Text("Answer ",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              // Divider(color: Colors.grey.withOpacity(0.2),),
              // SizedBox(height: 1.h,),
              // Text("Investor stage",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              // SizedBox(height: 0.5.h,),
              // Text("Answer ",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              // Divider(color: Colors.grey.withOpacity(0.2),),
              // SizedBox(height: 1.h,),
              // Text("Vison",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              // SizedBox(height: 0.5.h,),
              // Text("Answer ",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              // Divider(color: Colors.grey.withOpacity(0.2),),
              // SizedBox(height: 1.h,),
              // Text("Team",style: TextStyle(color: Colors.black,fontSize: 12.px,fontWeight: FontWeight.w800),),
              // SizedBox(height: 0.5.h,),
              // Text("Answer ",style: TextStyle(color: Colors.black,fontSize: 14.px,fontWeight: FontWeight.w400),),
              // Divider(color: Colors.grey.withOpacity(0.2),),
             Text("About",style: TextStyle(fontWeight: FontWeight.w500),),
               Divider(color: Colors.grey,),
               Text("""I am a visual designer from Lahore, Pakistan." I love understanding how people interact, and I enjoy creating designs that are user-friendly. I have a strong passion for all things related to interaction, particularly with a keen focus on human-centered design thinking. """,style: TextStyle(fontSize: 12),),
SizedBox(height: 1.h,),
              Text("Challenges",style: TextStyle(fontWeight: FontWeight.w500),),
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
              Divider(color: Colors.grey,),

              SizedBox(height: 1.h,),
              Text("Vison",style: TextStyle(fontWeight: FontWeight.w500),),
              Text("""Long-term goals and aspirations of the startup and what it aims to achieve in the future.""",style: TextStyle(fontSize: 12),),
            Divider(color: Colors.grey,),
              SizedBox(height: 1.h,),
              Text("Looking for",style: TextStyle(fontWeight: FontWeight.w500),),
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
              Divider(color: Colors.grey,),
              SizedBox(height: 1.h,),
              Text("Product",style: TextStyle(fontWeight: FontWeight.w500),),
              Text("""Under development""",style: TextStyle(fontSize: 12),),

              SizedBox(height: 10,  width: 10,)

            ],),
        ),
      ),
    );
  }
}
