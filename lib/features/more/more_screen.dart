import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:result_e/app_router.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/helper/snackbar_msg_helper.dart';
import 'package:result_e/widgets/custom_dialog_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/colors.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: StandardAppBar(
      //   titleText: 'Setting',
      //   onPressed: () {
      //     context.pushReplacement(AppRouter.homeScreen);
      //   },
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          context.push(AppRouter.profileScreen);
                        },
                        child: CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 36,
                          backgroundImage: NetworkImage(
                            '${'https://picsum.photos/300/300/'}',
                          ),
                          child: (Center(
                            child: Text(
                              'U',
                              style: const TextStyle(
                                color: whiteColor,
                              ),
                            ),
                          )),
                        )),
                    const Gap(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${'USER'}'.toUpperCase(),
                          style: context.textTheme.labelLarge?.copyWith(
                            color: errorShadeColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(3),
                        Text(
                          'USER',
                          style: context.textTheme.labelMedium?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(20),
                const Divider(
                  thickness: 1,
                ),
                const Gap(32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menu options',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Gap(20),
                    ListTile(
                      iconColor: errorShadeColor,
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.logout),
                      title: Text(
                        'Logout',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        CustomDialogBox.normalDialogBox(
                          content: 'Are you sure you want to logout?',
                          context: context,
                          title: 'Confirm Logout !',
                          leftButtonTitle: 'Confirm',
                          rightButtonTitle: 'Cancel',
                          leftOnPressed: () async {
                            // Remove the 'access' key from SharedPreferences
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.remove('access');
                            final savedData = prefs.getString('access');
                            // await SecureStorageHelperImpl(
                            //   fluttSerSecureStorage: const FlutterSecureStorage(),
                            // ).cleartores('${userProfile.email}', '');

                            // ).clearStores('${userProfile.email}', '');

                            log('$savedData');
                            if (savedData == null) {
                              CustomDialogBox.loadingIndicator(
                                context: context,
                              );
                              Future.delayed(const Duration(seconds: 1), () {
                                context
                                  ..pop()
                                  ..go(AppRouter.login);
                                // show message
                                SnackBarMsg.snackBarSuccess(
                                  context: context,
                                  duration: const Duration(seconds: 2),
                                  message: 'Logged Out Successfully',
                                );
                              });
                            }
                          },
                          rightOnPressed: () {
                            context.pop();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
