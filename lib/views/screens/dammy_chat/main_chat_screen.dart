import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/views/screens/dammy_chat/sized_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../models/chat_model.dart';
import 'custom_color.dart';
import 'custom_textstyle.dart';
import 'live_chat_screen.dart';
class MainChatScreen extends StatefulWidget {
  const MainChatScreen({super.key});
  @override
  State<MainChatScreen> createState() => _MainChatScreenState();
}
class _MainChatScreenState extends State<MainChatScreen> {
  final RxList<InboxMainChatScreenModel> items = [
    InboxMainChatScreenModel(
      title: "Mohsin Shop",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      imageUrl: "assets/pngs/profile.png",
      time: '15m ago',
    ),
    InboxMainChatScreenModel(
      title: "Mohsin Shop",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      imageUrl: "assets/pngs/profile.png",
      time: '1h ago',
    ),
    InboxMainChatScreenModel(
      title: "Mohsin Shop",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      imageUrl: "assets/pngs/profile.png",
      time: '15m ago',
    ),
    InboxMainChatScreenModel(
      title: "Mohsin Shop",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      imageUrl: "assets/pngs/profile.png",
      time: '1h ago',
    ),
    InboxMainChatScreenModel(
      title: "Mohsin Shop",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ut labore et dolore magna aliqua.",
      imageUrl: "assets/pngs/profile.png",
      time: '15m ago',
    ),
  ].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(bottom: 1.h),
            decoration:  BoxDecoration(
              border:  Border(
                bottom: BorderSide(width: 1.0, color: CustomColor.greyColor2), // Bottom border only
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child:Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child:  Icon(Icons.arrow_back_ios_new,size: 18.px,),
                  ),
                  Text(
                    "Chat Support",
                    style: CustomTextStyle.chatSupport,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.px,width: 10.px,)
                ],
              ),
            ),

          ),

          getVerticalSpace(3.h),
          Expanded(
            child: GestureDetector(onTap:() {

            },
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: items.length,
                shrinkWrap: true,

                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(()=>const LiveChatScreen());
                        },
                        child: ListTile(
                          title: Text(
                            items[index].title,
                            style: CustomTextStyle.textWithBlack,
                          ),
                          subtitle: Text(
                            items[index].subtitle,
                            style: CustomTextStyle.textNameBlack2,
                          ),
                          leading: CircleAvatar(
                            maxRadius: 30,
                            backgroundImage: AssetImage(items[index].imageUrl),
                          ),
                          trailing: Text(
                            items[index].time,
                            style: CustomTextStyle.textNameBlack1,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.h),
                        child:  Divider(color: CustomColor.greyColor,),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],),
      ),
    );
  }
}
