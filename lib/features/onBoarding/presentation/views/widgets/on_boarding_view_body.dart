import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/features/onBoarding/presentation/views/widgets/custom_page_indicator.dart';
import 'package:todo_app/features/onBoarding/presentation/views/widgets/on_boarding_item_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingItemPageView(controller: _pageController)),
        CustomPageIndicator(controller: _pageController),
        const SizedBox(height: 32.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomButton(
            onTap: () {
              if (currentPage < 2) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              } else {}
            },
            text: currentPage < 2 ? 'Next' : 'Get Started',
          ),
        ),
        const SizedBox(height: 50.0),
      ],
    );
  }
}
