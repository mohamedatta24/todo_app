import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_images.dart';
import 'package:todo_app/features/onBoarding/data/models/on_boarding_item_model.dart';
import 'package:todo_app/features/onBoarding/presentation/views/widgets/on_boarding_item.dart';

class OnBoardingItemPageView extends StatefulWidget {
  const OnBoardingItemPageView({super.key, required this.controller});

  final PageController controller;

  @override
  State<OnBoardingItemPageView> createState() => _OnBoardingItemPageViewState();
}

class _OnBoardingItemPageViewState extends State<OnBoardingItemPageView> {
  final List<OnBoardingItemModel> items = const [
    OnBoardingItemModel(
      title: "Organize your day easily",
      description:
          "Plan your daily tasks quickly and easily to stay more productive every day.",
      image: Assets.imagesOnBoarding1,
    ),
    OnBoardingItemModel(
      title: "Track your progress step by step",
      description:
          "See how much you’ve achieved and how many tasks you’ve completed stay focused on progress.",
      image: Assets.imagesOnBoarding2,
    ),
    OnBoardingItemModel(
      title: "Get things done and relax",
      description:
          "Make progress a daily habit and reach your goals with clarity and focus.",
      image: Assets.imagesOnBoarding3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.controller,
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return OnBoardingItem(onBoardingItemModel: items[index]);
      },
    );
  }
}
