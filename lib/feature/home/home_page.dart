import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyo_test/feature/home/home_controller.dart';
import 'package:studyo_test/resources/resources.dart';
import 'package:studyo_test/routes/page_names.dart';
import 'package:studyo_test/utills/widget/button/primary_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeController>(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Studyo.io Test',
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 36,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        'User : ${controller.userName}',
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 24),
                      PrimaryButtonWidget(
                        buttonText: "New Account",
                        customColors: AppColors.yellow, 
                        onPressed: (){
                          controller.newAccount();
                        }
                      ),
                      const SizedBox(height: 24),
                      PrimaryButtonWidget(
                        buttonText: "Profile", 
                        onPressed: (){
                          Get.toNamed(
                            PageName.PROFILE,
                            arguments: controller.userData?.uid
                          );
                        }
                      ),
                      const SizedBox(height: 24),
                      PrimaryButtonWidget(
                        buttonText: "Flutter Android Native", 
                        onPressed: (){
                          Get.toNamed(PageName.FLUTTER_ANDROID_NATIVE);
                        }
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