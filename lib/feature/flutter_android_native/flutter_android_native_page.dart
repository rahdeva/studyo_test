import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyo_test/feature/flutter_android_native/flutter_android_native_controller.dart';
import 'package:studyo_test/resources/resources.dart';

class FlutterAndroidNativePage extends StatelessWidget {
  const FlutterAndroidNativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<FlutterAndroidNativeController>(
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
              ],
            );
          },
        ),
      ),
    );
  }
}