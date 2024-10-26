import 'package:flutter/material.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/theme/colors.dart';

class ColorBoxWidget extends StatefulWidget {
  const ColorBoxWidget({required this.color, required this.label, super.key});

  final Color color;
  final String label;
  @override
  State<ColorBoxWidget> createState() => _ColorBoxWidgetState();
}

class _ColorBoxWidgetState extends State<ColorBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Text(
          widget.label,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
