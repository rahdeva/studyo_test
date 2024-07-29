import 'package:flutter/material.dart';
import 'package:studyo_test/resources/resources.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.purple,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.black, width: 2)
      ),
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_rounded,
          color: AppColors.black,
          size: 24,
        ),
      ),
    );
  }
}

