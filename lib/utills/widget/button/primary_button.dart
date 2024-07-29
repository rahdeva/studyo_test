import 'package:flutter/material.dart';
import '/resources/resources.dart';
import 'package:sizer/sizer.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key, 
    required this.buttonText, 
    required this.onPressed, 
    this.width, 
    this.customColors, 
    this.height,
  });

  final String buttonText;
  final double? width;
  final double? height;
  final Color? customColors;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100.w,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            customColors ?? AppColors.green,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(
                color: AppColors.black,
                width: 2
              )
            )
          )
        ),
        onPressed: onPressed, 
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w500
            )
          ),
        )
      ),
    );
  }
}