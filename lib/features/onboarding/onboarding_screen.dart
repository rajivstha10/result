// ignore_for_file: public_member_api_docs, inference_failure_on_function_return_type, type_annotate_public_apis, always_declare_return_types, use_build_context_synchronously, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:result_e/app_router.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/theme/colors.dart';
import 'package:result_e/core/utils/onboarding_utils.dart';
import 'package:result_e/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:result_e/features/onboarding/slide_items.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () async {
                await context.read<OnboardingCubit>().updateOnboardingStatus();

                context.go(AppRouter.login);
              },
              child: Text(
                'Skip',
                style: context.textTheme.labelLarge
                    ?.copyWith(color: midShadeColor),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<OnboardingCubit, int>(
                builder: (context, currentPage) {
                  final cubit = context.read<OnboardingCubit>();
                  return PageView.builder(
                    controller: cubit.pageController,
                    onPageChanged: (index) => cubit.setPage(index),
                    itemCount: slideList.length,
                    itemBuilder: (ctx, i) => SlideItem(
                      index: i,
                      onNext: () => cubit.goToNextPage(currentPage, context),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
