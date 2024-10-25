import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/auth_section/login_screen.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/getx_controllers/auth_controllers.dart';
class ProfessionalInformation2 extends StatelessWidget {
  ProfessionalInformation2({super.key});
  final TextEditingController firstController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final RxBool lookingFor = false.obs;
  final RxBool skills = false.obs;
  final RxBool roles = false.obs;
  final RxBool already = false.obs;
  final RxBool preferIndustries = false.obs;
  final RxBool preference = false.obs;
  final RxBool availability = false.obs;
  final RxBool languages = false.obs;
RxBool isChecked=false.obs;
  final RxInt isSelected = 0.obs;
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    // RxString? chooseLooking = RxString('');
    // final List<String> looking = ["1", "2", "3", "4"];
    // RxString? skillsCommunity = RxString('');
    // final List<String> skills = ["1", "2",
    //   "3", "4"];
    // RxString? rolesCommunity = RxString('');
    // final List<String> roles = ["1", "2",
    //   "3", "4"];
    // RxString? alreadyCommunity = RxString('');
    // final List<String> already = ["1", "2",
    //   "3", "4"];
    // RxString? preferCommunity = RxString('');
    // final List<String> prefer = ["1", "2",
    //   "3", "4"];
    // RxString? locationCommunity = RxString('');
    // final List<String> location = ["1", "2",
    //   "3", "4"];
    // RxString? availableCommunity = RxString('');
    // final List<String> available = ["1", "2",
    //   "3", "4"];
    // RxString? languageCommunity = RxString('');
    // final List<String> language = ["1", "2",
    //   "3", "4"];
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/pngs/background_image.png"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/pngs/app_logo.png"),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  Text(
                    "Profile Information",
                    style: AppTextStyles.boldTextStyle,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
             SizedBox(height: MediaQuery.of(context).size.height*.43,
               child: ListView.builder(itemCount: 1,
                   itemBuilder: (context,index){
                 return  Column(children: [
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
                            authController. chooseLooking.value.isEmpty ? 'Looking for' :authController. chooseLooking.value,
                             style:TextStyle(color: Colors.black,fontSize: 13),
                             overflow: TextOverflow.ellipsis,
                           ),
                           items:authController. looking.map((String communityName) {
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
                            authController. chooseLooking.value = value!;
                           },
                         );
                       }),
                     ),
                   ),
                   SizedBox(
                     height: 1.6.h,
                   ),
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 12),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       border: Border.all(color: Colors.grey),
                       borderRadius: BorderRadius.circular(8),
                     ),
                     child: DropdownButtonHideUnderline(
                       child: Obx(() {
                         return DropdownButton<String>(
                           isExpanded: true,
                           hint: Text(
                             authController.skillsCommunity.value.isEmpty ? 'Skills' : authController.skillsCommunity.value,
                             style: TextStyle(color: Colors.black, fontSize: 13),
                             overflow: TextOverflow.ellipsis,
                           ),
                           items: authController.skills.map((String skillName) {
                             return DropdownMenuItem<String>(
                               value: skillName,
                               child: Text(
                                 skillName,
                                 style: TextStyle(color: Colors.black),
                                 overflow: TextOverflow.ellipsis,
                               ),
                             );
                           }).toList(),
                           onChanged: (String? value) {
                             authController.skillsCommunity.value = value!;
                             log("User selected skillsCommunity: ${authController.skillsCommunity.value}");
                           },
                         );
                       }),
                     ),
                   ),
                   SizedBox(height: 1.6.h,),
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
                             authController.rolesCommunity.value.isEmpty ? 'I can take on these Roles' :authController. rolesCommunity!.value,
                             style:TextStyle(color: Colors.black,fontSize: 13),
                             overflow: TextOverflow.ellipsis,
                           ),
                           items:authController. roles.map((String communityName) {
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
                             authController. rolesCommunity.value = value!;
                           },
                         );
                       }),
                     ),
                   ),
                   SizedBox(height: 1.6.h,),
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
                             authController.alreadyCommunity.value.isEmpty ? 'I can take on these Roles' :authController. alreadyCommunity!.value,
                             style:TextStyle(color: Colors.black,fontSize: 13),
                             overflow: TextOverflow.ellipsis,
                           ),
                           items:authController. already.map((String communityName) {
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
                             authController. alreadyCommunity.value = value!;
                           },
                         );
                       }),
                     ),
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
                             authController.preferCommunity.value.isEmpty ? 'prefer industries' :authController. preferCommunity!.value,
                             style:TextStyle(color: Colors.black,fontSize: 13),
                             overflow: TextOverflow.ellipsis,
                           ),
                           items: authController.prefer.map((String communityName) {
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
                             authController.preferCommunity.value = value!;
                           },
                         );
                       }),
                     ),
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
                             authController.locationCommunity.value.isEmpty ? 'Location preference' : authController.locationCommunity!.value,
                             style:TextStyle(color: Colors.black,fontSize: 13),
                             overflow: TextOverflow.ellipsis,
                           ),
                           items: authController.location1.map((String communityName) {
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
                             authController. locationCommunity.value = value!;
                           },
                         );
                       }),
                     ),
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
                             authController. availableCommunity.value.isEmpty ? 'Availability' :authController. availableCommunity!.value,
                             style:TextStyle(color: Colors.black,fontSize: 13),
                             overflow: TextOverflow.ellipsis,
                           ),
                           items: authController.location1.map((String communityName) {
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
                             authController.availableCommunity.value = value!;
                           },
                         );
                       }),
                     ),
                   ),
                   //1
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
                           authController.languageCommunity.value.isEmpty ? 'Availability' : authController.languageCommunity!.value,
                             style:TextStyle(color: Colors.black,fontSize: 13),
                             overflow: TextOverflow.ellipsis,
                           ),
                           items: authController.language.map((String communityName) {
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
                             authController.languageCommunity.value = value!;
                           },
                         );
                       }),
                     ),
                   ),
                 ],);
               }),
             ),
                  SizedBox(height: 1.6.h,),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => GestureDetector(
                          onTap: () {
                            isChecked.value = !isChecked.value;
                          },
                          child: Container(
                            height: 21,
                            width: 21,
                            decoration: BoxDecoration(
                              color: isChecked.value ? Colors.white : Colors.transparent, // White background when checked
                              border: Border.all(
                                color: Colors.green, // Always show green border
                                width: 2.0, // Fixed green border width
                              ),
                              borderRadius: BorderRadius.circular(4.0), // Optional: make it look more like a checkbox
                            ),
                            child: isChecked.value
                                ? Center(
                                  child: Icon(
                                                                Icons.check,
                                                                color: Colors.green, // Green tick when checked
                                                                size: 18,
                                                              ),
                                )
                                : null, // No icon when unchecked
                          ),
                        )),
                        SizedBox(width: 2.w,),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              text: 'I agree to Innohub ',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Terms of Service',
                                  style: TextStyle(fontSize: 12, color: Color(0xff007AFF)),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff007AFF)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.6.h,),
                  // GestureDetector(
                  //   onTap: () {
                  //     isOpenSelect.value = !isOpenSelect.value;
                  //   },
                  //   child: Obx(
                  //     () => Container(
                  //         alignment: Alignment.centerLeft,
                  //         padding: EdgeInsets.symmetric(
                  //             vertical: 1.6.h, horizontal: 1.6.h),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(1.3.h),
                  //             color: AppColors.whiteColor,
                  //             border: Border.all(
                  //                 color: AppColors.greyColor.withOpacity(0.2), width: .2.h)),
                  //         child: Column(
                  //           children: [
                  //             Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   "Select",
                  //                   style: AppTextStyles.hintTextStyle,
                  //                 ),
                  //                 SvgPicture.asset("assets/svgs/arrowdown.svg")
                  //               ],
                  //             ),
                  //             isOpenSelect.value
                  //                 ? SizedBox(
                  //                     height: 2.h,
                  //                   )
                  //                 : const SizedBox.shrink(),
                  //             isOpenSelect.value
                  //                 ? ListView.builder(
                  //                     shrinkWrap: true,
                  //                     padding: EdgeInsets.zero,
                  //                     itemCount: 3,
                  //                     itemBuilder: (context, index) {
                  //                       return Padding(
                  //                         padding: EdgeInsets.symmetric(
                  //                             vertical: 1.h),
                  //                         child: GestureDetector(
                  //                           onTap: () {
                  //                             isSelected.value = index;
                  //                           },
                  //                           child: Row(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment
                  //                                     .spaceBetween,
                  //                             children: [
                  //                               Text(
                  //                                 "Interest ${index + 1}",
                  //                                 style: AppTextStyles
                  //                                     .hintTextStyle,
                  //                               ),
                  //                               Obx(
                  //                                 () => Container(
                  //                                   height: 2.5.h,
                  //                                   width: 2.5.h,
                  //                                   decoration: BoxDecoration(
                  //                                       borderRadius:
                  //                                           BorderRadius
                  //                                               .circular(.4.h),
                  //                                       border: Border.all(
                  //                                           color: AppColors
                  //                                               .greyColor)),
                  //                                   child: isSelected.value ==
                  //                                           index
                  //                                       ? SvgPicture.asset(
                  //                                           "assets/svgs/tick.svg")
                  //                                       : const SizedBox
                  //                                           .shrink(),
                  //                                 ),
                  //                               )
                  //                             ],
                  //                           ),
                  //                         ),
                  //                       );
                  //                     },
                  //                   )
                  //                 : const SizedBox.shrink()
                  //           ],
                  //         )),
                  //   ),
                  // ),
                  SizedBox(height: 2.h,),
                  Obx(() => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: customElevatedButton(
                            bgColor: AppColors.primaryColor,
                            onTap: () async {
                              await authController.signUpMethod();


                            },
                            title: authController.isLoading.value
                                ? LoadingAnimationWidget.waveDots(color: Colors.white, size: 30.px)
                                : Text(
                              'Create Profile',
                              style: AppTextStyles.buttonTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(height: 1.h),
                  // GestureDetector(onTap: () {
                  //   Get.to(() => const BottomNavigationScreen());
                  // },
                  //     child: Text("Skip",style: TextStyle(fontSize: 14.px,color:AppColors.primaryColor, ),)),
                  SizedBox(height: 1.h,width: 1.h,),
                ],
              ),
            ),
          )),
    );
  }
}
//
// GestureDetector(
// onTap: () {
// preferIndustries.value = !preferIndustries.value;
// },
// child: Obx(
// () => Container(
// alignment: Alignment.centerLeft,
// padding: EdgeInsets.symmetric(
// vertical: 2.2.h, horizontal: 1.6.h),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(1.3.h),
// color: AppColors.whiteColor,
// border: Border.all(
// color: AppColors.greyColor.withOpacity(0.1), width: .2.h)),
// child: Column(
// children: [
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// Text(
// "prefer industries",
// style: AppTextStyles.hintTextStyle,
// ),
// SvgPicture.asset("assets/svgs/arrowdown.svg")
// ],
// ),
// preferIndustries.value
// ? SizedBox(
// height: 2.h,
// )
//     : const SizedBox.shrink(),
// preferIndustries.value
// ? ListView.builder(
// shrinkWrap: true,
// padding: EdgeInsets.zero,
// itemCount: 3,
// itemBuilder: (context, index) {
// return Padding(
// padding: EdgeInsets.symmetric(
// vertical: 1.h),
// child: GestureDetector(
// onTap: () {
// isSelected.value = index;
// },
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment
//     .spaceBetween,
// children: [
// Text(
// "preferIndustries ${index + 1}",
// style: AppTextStyles
//     .hintTextStyle,
// ),
// Obx(
// () => Container(
// height: 2.5.h,
// width: 2.5.h,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius
//     .circular(.4.h),
// border: Border.all(
// color: AppColors
//     .greyColor)),
// child: already.value ==
// index
// ? SvgPicture.asset(
// "assets/svgs/tick.svg")
//     : const SizedBox
//     .shrink(),
// ),
// )
// ],
// ),
// ),
// );
// },
// )
//     : const SizedBox.shrink()
// ],
// )),
// ),
// ),
