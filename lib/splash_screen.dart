import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_market/main_page_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const SplashWidget(),
      nextScreen: const MainPageContoller(),
      animationDuration: const Duration(seconds: 1),
      splashIconSize: 200,
    );
  }
}

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/lottie/Animation001.json',
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
