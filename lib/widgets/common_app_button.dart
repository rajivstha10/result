// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:result_e/core/theme/colors.dart';

///
enum ButtonType {
  ///
  primary,

  ///
  secondary,

  ///
  error,
}

///
class CommonAppButton extends StatelessWidget {
  ///
  const CommonAppButton({
    required this.label,
    required this.buttonType,
    this.isLoading = false,
    this.hasIcon = false,
    this.onPressed,
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
  final String label;

  ///
  final TextStyle? textStyle;

  ///
  final ButtonType buttonType;

  ///
  final VoidCallback? onPressed;

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
      onTap: isLoading ? () {} : onPressed,
      child: Container(
        width: width ?? 366.w,
        height: height,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: buttonType == ButtonType.primary
              ? primaryColor
              : buttonType == ButtonType.error
                  ? Colors.red[700]
                  : const Color(0xffE5E9F0),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: const CircularProgressIndicator(
                    color: Color(0xffE5E9F0),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: textStyle ??
                          TextStyle(
                            color: buttonType == ButtonType.primary ||
                                    buttonType == ButtonType.error
                                ? Colors.white
                                : primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
