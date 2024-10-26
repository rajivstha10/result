// ignore_for_file: inference_failure_on_function_invocation, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:result_e/app_router.dart';

import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/theme/colors.dart';
import 'package:result_e/features/auth/widget/auth_base_widget.dart';
import 'package:result_e/gen/assets.gen.dart';
import 'package:result_e/widgets/custom_app_button.dart';
import 'package:result_e/widgets/label_text_form_field.dart';

///
class ForgotPasswordScreen extends StatefulWidget {
  ///
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 14,
              bottom: 5,
            ),
            // margin: const EdgeInsets.only(left: 24, top: 24),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: primaryColor,
            ),
            child: const Center(
              child: Icon(
                Icons.chevron_left,
                color: backgroundColor,
                size: 25,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 150),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // const Gap(40),

              Image.asset(
                Assets.images.resultInLetter.keyName,
                scale: 2,
              ),
              // const Gap(40),
              Text(
                'Forgot Password?',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const Gap(4),
              Text(
                'Enter the email or phone number to recover your account',
                style: context.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              const Gap(40),

              //for email

              LabelTextFormField(
                label: 'Email',
                textEditingController: emailController,
                inputType: TextInputType.emailAddress,
                textFieldType: TextFieldType.email,
                hintText: 'Enter your email',
              ),

              const Gap(40),
              CustomAppButton(
                height: 50,
                buttonLabel: 'Continue',
                buttonType: ButtonType.primary,
                onButtonPressed: () {},
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
    );
  }
}
