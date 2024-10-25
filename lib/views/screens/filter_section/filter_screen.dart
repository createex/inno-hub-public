import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/text_styles.dart';
import '../custom_widgets/custom_textformfield.dart';
import '../user_profile_section/edit_profile_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RxInt radiusValue = 0.obs; // Using RxInt for observable
  final TextEditingController searchController = TextEditingController();
  RxString? languageCommunity = RxString('');
  final List<String> language = ["3 hours (recommended)", "5 hours (recommended)",
    "2 hours (recommended)", "1 hours (recommended)"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Filter',
          style: AppTextStyles.blackColorN,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          children: [
            SearchCustomTextFormField(
              controller: searchController,
              hintText: 'Enter city or region',
              prefixIcon: SvgPicture.asset("assets/svgs/locationInnoHub.svg"),
              readOnly: false,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Text("Radius"),
                  Spacer(),
                  // Minus Icon Button
                  GestureDetector(
                    onTap: () {
                      if (radiusValue.value > 0) {
                        radiusValue.value--;
                      }
                    },
                    child: const Icon(Icons.remove),
                  ),
                  SizedBox(width: 2.w),

                  // Displaying radius value using Obx to make it reactive
                  Obx(() => Text(radiusValue.toString())),

                  SizedBox(width: 2.w),

                  // Add Icon Button
                  GestureDetector(
                    onTap: () {
                      radiusValue.value++;
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.h,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Advance Search",
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
            SizedBox(
              height: 1.6.h,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color:Colors.white,
                border: Border.all(color:Colors.grey),
                borderRadius: BorderRadius.circular(8),),
              child: DropdownButtonHideUnderline(
                child: Obx(() {
                  return DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      languageCommunity!.value.isEmpty ? 'Looking for' : languageCommunity!.value,
                      style:TextStyle(color: Colors.black,fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                    items: language.map((String communityName) {
                      return DropdownMenuItem<String>(
                        value: communityName,
                        child: Text(
                          communityName,
                          style:TextStyle(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      languageCommunity!.value = value!;
                    },
                  );
                }),
              ),
            ),
            SizedBox(height: 20.h,),
            SizedBox(height: 36.px,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width*0.4, 3.h),
                  foregroundColor: Colors.white ,
                  backgroundColor: AppColors.greenColor ,
                  side: const BorderSide(color: AppColors.greenColor, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  Get.to(() => const EditProfileScreen());
                },
                child: Text(
                  "Apply Filter",
                  style: TextStyle(
                    color:  Colors.white ,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
