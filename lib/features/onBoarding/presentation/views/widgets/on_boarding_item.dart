import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/theme/app_text_styles.dart';

import 'package:todo_app/features/onBoarding/data/models/on_boarding_item_model.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key, required this.onBoardingItemModel});

  final OnBoardingItemModel onBoardingItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(onBoardingItemModel.image),
        const SizedBox(height: 32.0),
        Text(
          onBoardingItemModel.title,
          style: AppTextStyles.bold22.copyWith(color: AppColors.textColor),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            textAlign: TextAlign.center,
            onBoardingItemModel.description,
            style: AppTextStyles.medium16.copyWith(color: AppColors.grayColor),
          ),
        ),
      ],
    );
  }
}
