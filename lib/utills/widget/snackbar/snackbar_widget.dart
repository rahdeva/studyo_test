import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyo_test/resources/resources.dart';

void showSnackbar({required title, required subtitle, required icon}){
  Get.snackbar(
    title,
    subtitle,
    snackPosition: SnackPosition.BOTTOM,
    icon: icon,
    backgroundColor: AppColors.white,
    borderRadius: 20,
    margin: const EdgeInsets.all(20),
    colorText: AppColors.black,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

