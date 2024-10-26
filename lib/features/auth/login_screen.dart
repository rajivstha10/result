// ignore_for_file: use_build_context_synchronously, avoid_print, unused_element, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:result_e/app_router.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/theme/colors.dart';
import 'package:result_e/features/auth/widget/auth_base_widget.dart';
import 'package:result_e/widgets/custom_app_button.dart';
import 'package:result_e/widgets/label_text_form_field.dart';

///
class LoginScreen extends StatefulWidget {
  ///
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool showPassword = true;

//for focus node
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          padding: EdgeInsets.only(
            top: isMobile ? 40 : 80,
            left: isMobile ? 20 : 150,
            right: isMobile ? 20 : 150,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(120),
                  Text(
                    'Login ',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  const Gap(
                    4,
                  ),
                  Text(
                    'Lorem Ipsum as their default',
                    style: context.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const Gap(
                    40,
                  ),
                  LabelTextFormField(
                    label: 'Identifier',
                    textEditingController: emailController,
                    textFieldType: TextFieldType.email,
                    hintText: 'Enter your Email or Symbol no.',
                    inputType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                      return null;
                    },
                  ),
                  const Gap(
                    12,
                  ),
                  LabelTextFormField(
                    label: 'Password',
                    textEditingController: passwordController,
                    textFieldType: TextFieldType.text,
                    hintText: 'Enter your password',
                    inputType: TextInputType
                        .visiblePassword, //This will hide the word suggestions
                    obsecureText: showPassword,
                    focusNode: passwordFocusNode,
                    textInputAction: TextInputAction.done,

                    suffixIcon: InkWell(
                      onTap: () => setState(() {
                        showPassword = !showPassword;
                      }),
                      child: Icon(
                        showPassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                      ),
                    ),
                  ),
                  const Gap(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              rememberMe = !rememberMe;
                            }),
                            child: Row(
                              children: [
                                Icon(
                                  rememberMe
                                      ? Icons.check_box_outlined
                                      : Icons.check_box_outline_blank,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Remember me',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          context.push(AppRouter.forgotPasswordScreen);
                        },
                        child: Text(
                          'Forgot password?',
                          style: context.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: midShadeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(40),
                  CustomAppButton(
                    height: 50,
                    buttonLabel: 'Log In',
                    buttonType: ButtonType.primary,
                    onButtonPressed: () {
                      context.go(AppRouter.homeScreen);

                      if (_formKey.currentState!.validate()) {
                        // context.read<AuthBloc>().add(
                        //       SignInUserEvent(
                        //         email: emailController.text.trim(),
                        //         password: passwordController.text.trim(),
                        //         // rememberMe: rememberMe,
                        //       ),
                        //     );
                      }
                    },
                  ),
                  const Gap(20),
                  AuthBaseWidget(
                    message: 'Don’t have an account?',
                    buttonLabel: 'Sign Up',
                    onPressed: () {
                      context.push(
                        AppRouter.register,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
