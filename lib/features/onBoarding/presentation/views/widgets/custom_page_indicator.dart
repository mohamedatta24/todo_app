import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/core/theme/app_colors.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({super.key, this.controller});

  final PageController? controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller!,
      count: 3,
      axisDirection: Axis.horizontal,
      effect: ExpandingDotsEffect(
        spacing: 8.0,
        radius: 4.0,
        dotWidth: 24.0,
        dotHeight: 8.0,
        paintStyle: PaintingStyle.fill,
        dotColor: AppColors.textColor,
        activeDotColor: AppColors.secondaryColor,
      ),
    );
  }
}
