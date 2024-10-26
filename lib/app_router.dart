// ignore_for_file: strict_raw_type, public_member_api_docs, avoid_unused_constructor_parameters, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:result_e/features/auth/forgot_password_screen.dart';
import 'package:result_e/features/auth/login_screen.dart';
import 'package:result_e/features/auth/register_screen.dart';
import 'package:result_e/features/base/base_screen.dart';
import 'package:result_e/features/exam/exam_screen.dart';
import 'package:result_e/features/home/home_screen.dart';
import 'package:result_e/features/more/profile/profile_screen.dart';
import 'package:result_e/features/offer/offer_screen.dart';
import 'package:result_e/features/onboarding/onboarding_screen.dart';
import 'package:result_e/features/more/more_screen.dart';
import 'package:result_e/features/result/result_screen.dart';
import 'package:result_e/features/splash/splash_screen.dart';
import 'package:result_e/locator.dart';

///
class AppRouter {
  ///
  AppRouter({
    required RouteObserver<PageRoute> routeObserver,
  }) {
    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      observers: [locator<RouteObserver<PageRoute>>()],
      errorBuilder: (context, state) => Text(state.error.toString()),
      // redirect: (context, state) {},
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return BaseScreen(child: child);
          },
          routes: [
            GoRoute(
              path: homeScreen,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: HomeScreen());
              },
            ),
            GoRoute(
              path: resultScreen,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ResultScreen());
              },
            ),
            GoRoute(
              path: examScreen,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ExamScreen());
              },
            ),
            GoRoute(
              path: moreScreen,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: MoreScreen());
              },
            ),
          ],
        ),
        GoRoute(
          name: splash,
          path: splash,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          name: login,
          path: login,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: register,
          path: register,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          name: forgotPasswordScreen,
          path: forgotPasswordScreen,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
        GoRoute(
          name: onboardingScreen,
          path: onboardingScreen,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          name: profileScreen,
          path: profileScreen,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    );
  }

  ///
  late final GoRouter router;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static const splash = '/';
  static const onboardingScreen = '/onboarding-screen';
  static const login = '/login';
  static const register = '/register';
  static const forgotPasswordScreen = '/forgot-password-screen';
  static const homeScreen = '/home-screen';
  static const resultScreen = '/result-screen';
  static const examScreen = '/exam-screen';
  static const moreScreen = '/more-screen';
  static const profileScreen = '/profile-screen';
}
