import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:studyo_test/feature/profile/profile_controller.dart';
import 'package:studyo_test/resources/resources.dart';
import 'package:studyo_test/utills/widget/button/back_button.dart';
import 'package:studyo_test/utills/widget/button/primary_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ProfileController>(
          builder: (controller) {
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        AppColors.blueGradient,
                        AppColors.purpleGradient,
                      ],
                    )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BackButtonWidget(),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.yellow,
                              border: Border.all(color: AppColors.black, width: 2),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            child: Row(
                              children: [
                                Text(
                                  'Incomplete Profile',
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.error_rounded,
                                  color: AppColors.darkYellow,
                                  size: 24,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.black, width: 2),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            padding: const EdgeInsets.fromLTRB(24, 40, 24, 80),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'Username',
                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                TextField(
                                  controller: controller.usernameC,
                                  onChanged: controller.onChangedUsername,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    label: Text(
                                      "Username"
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Obx(
                                  (){
                                    return Text(
                                      '- Use characters and numbers only',
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: controller.isNull.value
                                          ? AppColors.black
                                          : controller.isCondition1.value 
                                            ? AppColors.blue 
                                            : AppColors.red
                                      ),
                                    );
                                  }
                                ),
                                Text(
                                  '- Minimum 8 characters',
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: controller.isNull.value
                                      ? AppColors.black
                                      : controller.isCondition2.value 
                                        ? AppColors.blue 
                                        : AppColors.red
                                  ),
                                ),
                                Text(
                                  '- This Username is unavailable',
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: controller.isNull.value
                                      ? AppColors.black
                                      : controller.isCondition3.value 
                                        ? AppColors.blue 
                                        : AppColors.red
                                  ),
                                ),
                                Text(
                                  "- You can't change your username",
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: controller.isNull.value
                                      ? AppColors.black
                                      : controller.isCondition4.value 
                                        ? AppColors.blue 
                                        : AppColors.red
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -22,
                            width: 70.w,
                            child: PrimaryButtonWidget(
                              buttonText: "Confirm", 
                              onPressed: (){}
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}