// ignore_for_file: avoid_dynamic_calls, public_member_api_docs, lines_longer_than_80_chars, prefer_if_elements_to_conditional_expressions, inference_failure_on_function_invocation, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:result_e/app_router.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/helper/snackbar_msg_helper.dart';
import 'package:result_e/core/theme/colors.dart';
import 'package:result_e/widgets/custom_dialog_boxe.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  ///
  const CustomAppBar({
    this.showLogout = false,
    super.key,
  });

  final bool showLogout;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      toolbarHeight: 80,
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        decoration: const BoxDecoration(
          color: primaryColor,
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          leading: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              foregroundImage: NetworkImage(
                // '${userProfile.picture ?? 'https://picsum.photos/300/300/'}',

                'https://picsum.photos/300/300/',
              ),
              child: Center(
                child: Text(
                  'U',
                  // userProfile.fullName != null &&
                  //         userProfile.fullName!.isNotEmpty
                  //     ? userProfile.fullName![0].toUpperCase()
                  //     : 'U',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          title: GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Name'
                  //todo: implement name
                  // '${userProfile.fullName != null && userProfile.fullName!.isNotEmpty ? userProfile.fullName : 'USER'}'
                  //     .toUpperCase(),
                  ,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Gap(4),
                Text(
                  'Sym463646',
                  //  todo: symbol no impl
                  style: context.textTheme.labelMedium
                      ?.copyWith(color: whiteColor),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Badge.count(
                count: 2,
                textColor: blackColor,
                textStyle: context.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w700),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: whiteColor,
                ),
              ),
            ),
            // widget.showLogout
            // ? IconButton(
            //   onPressed: () async {
            //     CustomDialogBox.normalDialogBox(
            //       title: 'Logout',
            //       content: 'Are you sure you want to logout?',
            //       context: context,
            //       leftButtonTitle: 'Logout',
            //       rightButtonTitle: 'Cancel',
            //       leftOnPressed: () async {
            //         // Remove the 'access' key from SharedPreferences
            //         final prefs = await SharedPreferences.getInstance();
            //         await prefs.remove('access');
            //         final savedData = prefs.getString('access');
            //         //todo: impl secure storege

            //         // await SecureStorageHelperImpl(
            //         //   flutterSecureStorage: const FlutterSecureStorage(),
            //         // ).clearStores('${userProfile.email}', '');

            //         log('$savedData');
            //         if (savedData == null) {
            //           CustomDialogBox.loadingIndicator(context: context);
            //           Future.delayed(const Duration(seconds: 1), () {
            //             context
            //               ..pop()
            //               ..go(AppRouter.login);

            //             // show message
            //             SnackBarMsg.snackBarSuccess(
            //               context: context,
            //               duration: const Duration(seconds: 2),
            //               message: 'Logged Out Successfully',
            //             );
            //           });
            //         }
            //       },
            //       rightOnPressed: () {
            //         context.pop();
            //       },
            //     );
            //   },
            //   icon: const Icon(
            //     Icons.logout_rounded,
            //     color: blackColor,
            //   ),
            // )
            // : const Gap(0),
          ],
        ),
      ),
    );
  }
}
