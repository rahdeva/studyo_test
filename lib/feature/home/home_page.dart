import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyo_test/feature/home/home_controller.dart';
import '/utills/widget/button/primary_button.dart';
import '/resources/resources.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Selamat Datang",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 32,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  PrimaryButtonWidget(
                    buttonText: "Masuk ke Aplikasi",
                    borderRadius: 50,
                    customColors: Colors.black,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    onPressed: () async {
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

