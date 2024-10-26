// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:result_e/app_router.dart';
import 'package:result_e/core/utils/onboarding_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  // ignore: inference_failure_on_function_return_type, type_annotate_public_apis, always_declare_return_types
  void goToNextPage(int currentPage, BuildContext context) {
    if (currentPage < slideList.length - 1) {
      _pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(currentPage + 1);
    } else {
      updateOnboardingStatus();
      context.go(AppRouter.login);
    }
  }

  Future<void> updateOnboardingStatus() async {
    const isViewed = 0;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  void setPage(int page) {
    emit(page);
  }

  @override
  Future<void> close() {
    _pageController.dispose();
    return super.close();
  }
}
