// Alert dialog box for starting the match once the player role has been chosen
// ignore_for_file: public_member_api_docs, type_annotate_public_apis, inference_failure_on_function_return_type, inference_failure_on_function_invocation, lines_longer_than_80_chars, file_names, always_declare_return_types

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/theme/colors.dart';
import 'package:result_e/gen/assets.gen.dart';

class CustomDialogBox {
  static normalDialogBox({
    BuildContext? context,
    String? title,
    String? content,
    void Function()? leftOnPressed,
    void Function()? rightOnPressed,
    String? leftButtonTitle,
    String? rightButtonTitle,
  }) {
    showDialog(
      context: context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          contentPadding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 5),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$title',
                style: context.textTheme.bodyLarge!.copyWith(
                  color: errorShadeColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              const Gap(15),
              Text(
                '$content',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: midShadeColor,
                ),
              ),
              const Gap(10),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (leftButtonTitle != null) ...{
                    TextButton(
                      onPressed: leftOnPressed,
                      style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: Text(
                        leftButtonTitle,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: errorShadeColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  },
                  if (rightButtonTitle != null) ...{
                    TextButton(
                      onPressed: rightOnPressed,
                      style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: Text(
                        rightButtonTitle,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  },
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static loadingIndicator({required BuildContext context}) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          // shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 140, vertical: 180),
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              Assets.images.logo.keyName,
              height: 100,
            ),
          ),
        );
      },
    );
  }
}
