// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'package:flutter/material.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/theme/colors.dart';

///
class StandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  ///
  const StandardAppBar({
    required this.titleText,
    super.key,
    this.onPressed,
    this.isPrimaryColor,
  });

  ///
  final String titleText;

  ///
  final VoidCallback? onPressed;

  ///
  final bool? isPrimaryColor;

  ///

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: primaryColor,
      elevation: 0,
      toolbarHeight: 54,
      flexibleSpace: Container(
        // padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isPrimaryColor == true ? primaryColor : primaryColor,
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.chevron_left,
              color: backgroundColor, //The color of the icon should be white.
            ),
          ),
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: size.width * 0.7,
                  child: Text(
                    titleText,
                    style: context.textTheme.labelLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
