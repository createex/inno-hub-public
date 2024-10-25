import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/getx_controllers/create_startUp_profile_controller.dart';

class StartUpOwnDetailsScreen extends StatefulWidget {
  final String documentId;
  final String companyOverview;
  final String challenges;
  final String vision;
  final String lookingFor;
  final String productStatus;
  final String technology;
  final String marketAndCustomers;
  final String targetMarket;
  final String companySize;
  final String foundingAndGrowth;
  final String foundingStage;
  final String investStage;
  final String team;
  const StartUpOwnDetailsScreen({super.key, required this.documentId, required this.companyOverview, required this.challenges, required this.vision, required this.lookingFor, required this.productStatus, required this.technology, required this.marketAndCustomers, required this.targetMarket, required this.companySize, required this.foundingAndGrowth, required this.foundingStage, required this.investStage, required this.team});

  @override
  State<StartUpOwnDetailsScreen> createState() => _StartUpOwnDetailsScreenState();
}

class _StartUpOwnDetailsScreenState extends State<StartUpOwnDetailsScreen> {

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
             Text("About",style: TextStyle(fontWeight: FontWeight.w500),),
               Divider(color: Colors.grey,),
               Text(widget.companyOverview ??
                 "about...."
                     ,style: TextStyle(fontSize: 12)),
              SizedBox(height: 1.h,),
              Text("Challenges",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              Text(widget.challenges ??
                "challenges...."
              ,style: TextStyle(fontSize: 12),),
              SizedBox(height: 1.h,),
              Text("Vison",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              Text(widget.vision ??
                "vision..."
              ,style: TextStyle(fontSize: 12),),
            Divider(color: Colors.grey,),
              SizedBox(height: 1.h,),
              Text("Looking for",style: TextStyle(fontWeight: FontWeight.w500),),
              SizedBox(height: 0.6.h,),
              // SizedBox(
              //   height: 35,
              //   child: Obx(() => ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount:widget.lookingFor.length, // Fetch length of lookingFor list
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 1.w),
              //         child: Container(
              //           padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              //           decoration: BoxDecoration(
              //             border: Border.all(color: Colors.green),
              //             borderRadius: BorderRadius.circular(16),
              //           ),
              //           child: Center(
              //             child: Text(
              //              widget.lookingFor[index], // Get the skill
              //               style: TextStyle(fontSize: 16.sp), // Responsive font size
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   )),
              // ),
              Text(widget.lookingFor ??
                "Looking for..",style: TextStyle(fontWeight: FontWeight.w500),),

              Divider(color: Colors.grey,),
              SizedBox(height: 1.h,),
              Text("Product",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              Text(widget.productStatus ??
                """Under development""",style: TextStyle(fontSize: 12),),
              SizedBox(height: 1.h,),
              Text("Technology",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              Text(widget.technology ??
                """Key technologies""",style: TextStyle(fontSize: 12),),
              SizedBox(height: 1.h,),
              Text("Market and Customers",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              Text(widget.marketAndCustomers ??
                "Market and Customers....",style: TextStyle(fontSize: 12),),
              SizedBox(height: 1.h,),
              Text("Target Market",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              Text(widget.targetMarket ??
                """ targetMarket...""",style: TextStyle(fontSize: 12),),
              SizedBox(height: 1.h,),
              Text("Company size",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              Text(widget.companySize ??
                """""",style: TextStyle(fontSize: 12),),
              SizedBox(height: 1.h,),
              Text("Founding and Growth",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              Text(widget.foundingAndGrowth  ??
                """Founding and Growth...""",style: TextStyle(fontSize: 12),),
              SizedBox(height: 1.h,),
              Text("Founding Stage",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              Text(widget.foundingStage ??
               "foundingStage....",style: TextStyle(fontSize: 12),),
              SizedBox(height: 1.h,),
              Text("Investor Stage",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              Text(widget.investStage ??
                """investStage...""",style: TextStyle(fontSize: 12),),
              SizedBox(height: 1.h,),
              Text("Team",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              Text(widget.team ??
                """team members""",style: TextStyle(fontSize: 12),),
              SizedBox(height: 10,  width: 10,)



            ],),
        ),
      ),
    );
  }
}
