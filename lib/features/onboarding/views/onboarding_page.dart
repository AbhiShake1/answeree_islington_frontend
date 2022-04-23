import 'package:answeree_islington_frontend/core/preferences.dart';
import 'package:answeree_islington_frontend/features/home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class OnboardingPage extends HookWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  static const _assetPath = 'assets/lottie';

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    const animationCurve = Curves.ease;
    const animationDuration = Duration(milliseconds: 500);
    const List<_CustomPage> pages = [
      _CustomPage(assetPath: '$_assetPath/intro_1.json'),
      _CustomPage(assetPath: '$_assetPath/intro_2.json'),
      _CustomPage(assetPath: '$_assetPath/intro_3.json'),
    ];

    void navigateToHome() => Navigator.of(context)
        .pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        )
        .whenComplete(() => setBool('intro_shown_key', true));

    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          children: pages,
        ).pOnly(bottom: 80),
        bottomSheet: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => pageController.page == pages.length - 1
                    ? navigateToHome()
                    : pageController.nextPage(
                        duration: animationDuration,
                        curve: animationCurve,
                      ),
                child: const Text('Next'),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  effect: const SlideEffect(),
                  count: pages.length,
                  onDotClicked: (i) => pageController.animateToPage(i,
                      duration: animationDuration, curve: animationCurve),
                ),
              ),
              TextButton(
                onPressed: () => navigateToHome(),
                child: const Text('Skip'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomPage extends StatelessWidget {
  const _CustomPage({Key? key, required this.assetPath}) : super(key: key);

  final String assetPath;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Lottie.asset(assetPath),
          ],
        ),
      );
}
