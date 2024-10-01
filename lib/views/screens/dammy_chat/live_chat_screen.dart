import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:in_hub/views/screens/dammy_chat/sized_screen.dart';
import 'package:in_hub/views/screens/dammy_chat/time_picker_controller.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/utils/calender_controller.dart';
import 'custom_color.dart';
import 'custom_textstyle.dart';
import 'offer_controller.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key, this.title, this.imagePath});
  final String? title;
  final String? imagePath;

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  final TextEditingController chatController = TextEditingController();
  final RxList<Widget> chatList = <Widget>[].obs;
  CalendarController calendarController = Get.put(CalendarController());
  final TimePickerController timePickerController = Get.put(TimePickerController());
  final TextEditingController controller = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final OfferController offerController = Get.put(OfferController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 2.h),
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
            // Chat List
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: chatList.length,
                  reverse: true, // Newer messages at the bottom
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 1.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.px),
                                      bottomRight: Radius.circular(10.px),
                                      topRight: Radius.circular(10.px),
                                    ),
                                  ),
                                  child: chatList[index], // Directly using the widget
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 2.h),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: chatController,
                      autocorrect: false,
                      enableSuggestions: false,
                      cursorColor: CustomColor.orangeColor1,
                      decoration: InputDecoration(
                        prefixIcon: Transform.scale(
                          scale: 0.6,
                          child: SvgPicture.asset("assets/svgs/fileChat.svg"),
                        ),
                        fillColor: const Color(0xffF8F8F8),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.h),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.h),
                          borderSide: const BorderSide(color: CustomColor.greyColor5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.h),
                          borderSide: const BorderSide(color: CustomColor.orangeColor1),
                        ),
                        isCollapsed: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px,),
                        hintText: 'Type your message',
                        hintStyle: TextStyle(
                          fontSize: 12.px,
                          fontWeight: FontWeight.w400,
                          color: CustomColor.blackColor12,
                        ),
                      ),
                    ),
                  ),
                  getHorizontalSpace(1.h),
                  GestureDetector(
                    onTap: () {
                      if (chatController.text.isNotEmpty) {
                        // Create a widget for the message
                        final messageWidget = Container(
                          margin: EdgeInsets.only(left: 60.w),
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                          decoration: BoxDecoration(
                            color: CustomColor.greyColor9,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.px),
                              bottomRight: Radius.circular(10.px),
                              topRight: Radius.circular(10.px),
                            ),
                          ),
                          child: Text(
                            chatController.text,
                            style: TextStyle(
                              fontFamily: 'medium',
                              color:  Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.px,
                            ),
                          ),
                        );

                        // Add the widget to the list
                        chatList.insert(0, messageWidget);
                        chatController.clear();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.5.h),
                      decoration: BoxDecoration(
                        color: CustomColor.orangeColor2,
                        borderRadius: BorderRadius.circular(24.px),
                      ),
                      child: SvgPicture.asset(
                        'assets/svgs/sentIcon1.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}

