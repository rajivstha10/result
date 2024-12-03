// ignore_for_file: avoid_void_async

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:result_e/app_router.dart';
import 'package:result_e/gen/assets.gen.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
class SplashScreen extends StatefulWidget {
  ///
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? onBoardingViewed;

  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
    seenOnBoarding();
  }

  Future<void> seenOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    final onBoard = prefs.getInt('onBoard');
    setState(() {
      onBoardingViewed = onBoard;
    });
  }

  void _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (onBoardingViewed != 0) {
        context.go(AppRouter.onboardingScreen);
      } else {
        context.go(AppRouter.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.images.logo.keyName,
          scale: 6,
        ),
      ),
    );
  }
}
