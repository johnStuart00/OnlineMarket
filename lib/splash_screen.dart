import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_market/main_page_controller.dart';
import 'package:online_market/utils/screen_size.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const SplashWidget(),
      nextScreen: const MainPageContoller(),
      animationDuration: const Duration(seconds: 10),
      splashIconSize: ScreenUtil.screenHeight(context),
      backgroundColor: Colors.white,
    );
  }
}

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Image.asset(
                'assets/project_logo/han_moda.png',
                width: ScreenUtil.setWidth(context, 0.5),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: LottieBuilder.asset(
                'assets/project_logo/gadymy_kerwen.json',
                width: ScreenUtil.setWidth(context, 0.3),
              ))
        ],
      ),
    );
  }
}
