// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/theme/colors.dart';
import 'package:result_e/widgets/common_app_button.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    this.label = '',
    this.primaryButtonLabel = '',
    this.secondaryButtonLabel = '',
    this.firstButtonLabel = '',
    this.secondButtonLabel = '',
    this.thirdButtonLabel = '',
    super.key,
    this.onPrimaryPressed,
    this.onSecondaryPressed,
    this.onfirstPressed,
    this.onSecondPressed,
    this.onthirdPressed,
  });
  final String label;

  final String firstButtonLabel;
  final String secondButtonLabel;
  final String thirdButtonLabel;
  final String primaryButtonLabel;
  final String secondaryButtonLabel;
  final VoidCallback? onfirstPressed;
  final VoidCallback? onSecondPressed;
  final VoidCallback? onthirdPressed;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(40),
        if (label.isNotEmpty) ...{
          Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: errorShadeColor,
            ),
          ),
          const Gap(20),
        },
        if (firstButtonLabel.isNotEmpty) ...{
          TextButton(
            onPressed: onfirstPressed,
            child: Text(
              firstButtonLabel,
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
        },
        if (secondButtonLabel.isNotEmpty) ...{
          const Divider(
            thickness: 1,
          ),
          TextButton(
            onPressed: onSecondPressed,
            child: Text(
              secondButtonLabel,
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
        },
        if (thirdButtonLabel.isNotEmpty) ...{
          const Divider(
            thickness: 1,
          ),
          TextButton(
            onPressed: onthirdPressed,
            child: Text(
              thirdButtonLabel,
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
        },
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              if (primaryButtonLabel.isNotEmpty) ...{
                CommonAppButton(
                  label: primaryButtonLabel,
                  buttonType: ButtonType.primary,
                  width: size.width,
                  onPressed: onPrimaryPressed,
                ),
                const Gap(12),
              } else if (secondButtonLabel.isNotEmpty) ...{
                CommonAppButton(
                  label: secondaryButtonLabel,
                  buttonType: ButtonType.secondary,
                  width: size.width,
                  onPressed: onSecondaryPressed,
                ),
              },
            ],
          ),
        ),
      ],
    );
  }
}
