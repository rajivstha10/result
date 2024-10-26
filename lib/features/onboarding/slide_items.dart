// ignore_for_file: use_colored_box, use_build_context_synchronously, inference_failure_on_function_return_type, always_declare_return_types, type_annotate_public_apis, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/theme/colors.dart';
import 'package:result_e/core/utils/onboarding_utils.dart';

///
class SlideItem extends StatefulWidget {
  ///
  const SlideItem({required this.index, required this.onNext, super.key});

  ///
  final int index;

  ///
  final VoidCallback onNext;

  @override
  State<SlideItem> createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  // testing onboarding screen
  // updateOnboardingStatus() async {
  //   const isViewed = 0;
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('onBoard', isViewed);
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.5,
            child: Image.asset(slideList[widget.index].imageUrl),
          ),

          // const Gap(20),
          Text(
            slideList[widget.index].title,
            style: context.textTheme.headlineLarge
                ?.copyWith(fontWeight: FontWeight.w600, color: blackColor),
          ),
          const Gap(20),

          SizedBox(
            width: size.width * 0.8,
            child: Text(
              slideList[widget.index].description,
              textAlign: TextAlign.center,
            ),
          ),

          const Gap(40),
          GestureDetector(
            onTap: widget.onNext,
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chevron_right_outlined,
                color: backgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
