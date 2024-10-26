import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:flutter/material.dart';

///
class OrWidget extends StatelessWidget {
  ///
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width / 3,
          child: Divider(
            color: context.colorScheme.primary,
            thickness: 1,
          ),
        ),
        Text(
          'OR',
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: size.width / 3,
          child: Divider(
            color: context.colorScheme.primary,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
