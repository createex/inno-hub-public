import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:in_hub/views/screens/start_up_section/startup_own_profile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../chat_section/main_chat.dart';
import '../custom_widgets/app_keys.dart';
import '../search_section/search_screen.dart';
class StartupList extends StatefulWidget {
  const StartupList({Key? key}) : super(key: key);

  @override
  State<StartupList> createState() => _StartupListState();
}

class _StartupListState extends State<StartupList> {
  List<String> data=[
    "Startup 1",
    "Startup 2",
    "Startup 3",
    "Startup 4",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
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
                      Get.to(() => const MainChatScreen());
                    },
                    child: Image.asset('assets/pngs/bxs_chat.png',)),
              )
            ],
          ),
        ),
        SizedBox(height: 2.h,),
        Expanded(
          child: GestureDetector(onTap: () {
            Get.to(()=>StartUpOwnProfile(
              foundingStage: "",
              investStage: "",
              lookingFor:"",
              marketAndCustomers: "",
               productStatus: "",
              targetMarket: "",
              team: "",
              technology: "",
              vision: "",
              challenges: "",
              companyOverview: "",
              companySize: "",
              foundingAndGrowth: "",
              documentId: '',
              startUpName: '',
              startUpField: '',
              startUpUserName: '',
              startUpWebsite: '',
              startUpLocation: '',
              profileImage: '',
            ));
          },
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: data.length,
                itemBuilder: (context,index){
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.h),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  child:ListTile(
                      leading:  CircleAvatar(backgroundImage: AssetImage("assets/pngs/pngprofile.png"),
                      radius: 20,
                      ),
                    title: Text(data[index],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 13),),
                    subtitle: Text("userName",style: TextStyle(fontSize: 12,color: Colors.black),),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),

                  )
                ),
              );
            }),
          ),
        )
      ],),
    );
  }
}
