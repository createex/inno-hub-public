import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PeopleFollowedYouScreen extends StatelessWidget {
  const PeopleFollowedYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        leading: const Icon(Icons.arrow_back_ios),
        title: Text(
          'People followed you',
          style: AppTextStyles.blackColorN,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: mediaQuerySize.height,
        width: mediaQuerySize.width,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(right: 10.px, left: 10.px),
                  title: const Text('Zeeshan'),
                  subtitle: const Text('zeeshi'),
                  trailing: Container(
                    height: mediaQuerySize.height * 0.05,
                    width: mediaQuerySize.width * 0.26,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                ),
                const Divider(
                  height: 0,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
