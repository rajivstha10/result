// ignore_for_file: deprecated_member_use

import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///
enum ButtonType {
  ///
  primary,

  ///
  secondary,

  ///
  error,

  ///
  tertiary,
}

///
class CustomAppButton extends StatelessWidget {
  ///
  const CustomAppButton({
    required this.buttonLabel,
    required this.buttonType,
    this.isLoading = false,
    this.hasIcon = false,
    this.onButtonPressed,
    this.icon,
    super.key,
    this.height,
    this.width,
    this.textStyle,
    this.svgIcon,
  });

  /// Button height
  final double? height;

  /// Button width
  final double? width;

  ///
  final String buttonLabel;

  ///
  final TextStyle? textStyle;

  ///
  final ButtonType buttonType;

  ///
  final VoidCallback? onButtonPressed;

  ///
  final bool isLoading;

  ///
  final bool hasIcon;

  ///
  final IconData? icon;

  ///
  final String? svgIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? () {} : onButtonPressed,
      child: Container(
        width: width ?? 366,
        height: height ?? 60,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: buttonType == ButtonType.tertiary
              ? Border.all(
                  color: context.colorScheme.primary,
                  width: 2,
                )
              : null,
          color: buttonType == ButtonType.primary
              ? primaryColor
              : buttonType == ButtonType.tertiary
                  ? context.colorScheme.background
                  : buttonType == ButtonType.error
                      ? Colors.red[700]
                      : const Color(0xffE5E9F0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: buttonType == ButtonType.tertiary
                        ? context.colorScheme.primary
                        : context.colorScheme.background,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (hasIcon) ...[
                      if (icon != null)
                        Icon(
                          icon,
                          color: Colors.white,
                        )
                      else
                        SvgPicture.asset(svgIcon!),
                      const SizedBox(width: 8),
                    ] else
                      const SizedBox(),
                    Text(
                      buttonLabel,
                      style: textStyle ??
                          context.textTheme.titleSmall?.copyWith(
                            color: buttonType == ButtonType.primary ||
                                    buttonType == ButtonType.error
                                ? Colors.white
                                : buttonType == ButtonType.tertiary
                                    ? Colors.black
                                    : primaryColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
