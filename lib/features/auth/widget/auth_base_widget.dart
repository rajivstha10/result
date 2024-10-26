// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/theme/colors.dart';

class AuthBaseWidget extends StatefulWidget {
  const AuthBaseWidget({
    required this.message,
    required this.buttonLabel,
    required this.onPressed,
    super.key,
  });

  ///
  final String message;

  ///
  final String buttonLabel;

  ///
  final VoidCallback onPressed;

  @override
  State<AuthBaseWidget> createState() => _AuthBaseWidgetState();
}

class _AuthBaseWidgetState extends State<AuthBaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.message,
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: midShadeColor,
          ),
        ),
        TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.buttonLabel,
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: midShadeColor,
            ),
          ),
        ),
      ],
    );
  }
}
