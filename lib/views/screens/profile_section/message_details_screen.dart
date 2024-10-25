import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:in_hub/views/screens/user_profile_section/user_work_experience.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../user_profile_section/user_education_experience.dart';
class MessageDetailsScreen extends StatefulWidget {
  const MessageDetailsScreen({super.key});
  @override
  State<MessageDetailsScreen> createState() => _MessageDetailsScreenState();
}
class _MessageDetailsScreenState extends State<MessageDetailsScreen> {
  final TextEditingController emailController=TextEditingController();
  // final TextEditingController emailController=TextEditingController();
  // final TextEditingController emailController=TextEditingController();
  // final TextEditingController emailController=TextEditingController();
  // final TextEditingController emailController=TextEditingController();
  List<String> data=[
    "Createex",
    "UI/UX Designer",
    "My role is design screen for company's play store apps. Starting from idea to prepare design hand-off for the developers."
  ];
  List<String> data1=[
    "UCP",
    "UI/UX Designer",
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
              Text("Challenges",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("Long-term goals and aspirations of the startup and what it aims to achieve in the future.",style: TextStyle(fontWeight: FontWeight.w400),),
              SizedBox(height: 1.h,),
              Text("Vison",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("Long-term goals and aspirations of the startup and what it aims to achieve in the future.",style: TextStyle(fontWeight: FontWeight.w400),),
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
              Text("Product status",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("Under development ",style: TextStyle(fontWeight: FontWeight.w400),),
              SizedBox(height: 1.h,),
              Text("Technology",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("key technologies ",style: TextStyle(fontWeight: FontWeight.w400),),
              SizedBox(height: 1.h,),
              Text("Market and Customers",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",style: TextStyle(fontWeight: FontWeight.w400),),
              SizedBox(height: 1.h,),
              Text("Target Market",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",style: TextStyle(fontWeight: FontWeight.w400),),
              SizedBox(height: 1.h,),
              Text("Company size",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",style: TextStyle(fontWeight: FontWeight.w400),),
              SizedBox(height: 1.h,),
              Text("Founding and Growth",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",style: TextStyle(fontWeight: FontWeight.w400),),
              SizedBox(height: 1.h,),
              Text("Founding Stage",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",style: TextStyle(fontWeight: FontWeight.w400),),
              SizedBox(height: 1.h,),
              Text("Investor Stge",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",style: TextStyle(fontWeight: FontWeight.w400),),
              SizedBox(height: 1.h,),
              Text("Team",style: TextStyle(fontWeight: FontWeight.w500),),
              SizedBox(height: 1.h,),
              SizedBox(height: 150,
                child: ListView.builder(
                    itemCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: 1.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(backgroundImage: AssetImage("assets/pngs/profile.png"),),
                            SizedBox(width: 2.w,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ralph Edwards",style:  TextStyle(fontWeight: FontWeight.w500),),
                                Text("Role",style: TextStyle(color: Colors.grey,fontSize: 12),),

                              ],
                            ),

                            Spacer(),
                            CircleAvatar(backgroundImage: AssetImage("assets/pngs/profile.png"),),
                            SizedBox(width: 2.w,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ralph Edwards",style:  TextStyle(fontWeight: FontWeight.w500),),
                                Text("Role",style: TextStyle(color: Colors.grey,fontSize: 12),),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10,  width: 10,)

            ],),
        ),
      ),
    );
  }
}
