// ignore_for_file: inference_failure_on_function_invocation, lines_longer_than_80_chars

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:result_e/app_router.dart';
import 'package:result_e/core/extensions/app_theme_extensions.dart';
import 'package:result_e/core/theme/colors.dart';
import 'package:result_e/features/auth/cubit/auth_cubit.dart';
import 'package:result_e/features/auth/cubit/auth_cubit_state.dart';
import 'package:result_e/features/auth/widget/auth_base_widget.dart';
import 'package:result_e/widgets/custom_app_button.dart';
import 'package:result_e/widgets/label_dropdown_widget.dart';
import 'package:result_e/widgets/label_text_form_field.dart';

///
class RegisterScreen extends StatefulWidget {
  ///
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  // TextEditingController userNameController = TextEditingController();
  TextEditingController symbolController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  TextEditingController programIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool showProfileErrMessagge = false;

  List<String> batchYears = List.generate(
    30, // Number of years to display
    (index) => (DateTime.now().year - index).toString(),
  );

  String? selectedBatchYear;

  //for focus node
  final emailFocusNode = FocusNode();
  final symbolFocusNode = FocusNode();
  final registrationFocusNode = FocusNode();
  final batchFocusNode = FocusNode();
  final programFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

//Pick image dialog
  void _showImageOptions(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Container(
            alignment: Alignment.center,
            child: Text(
              'Pick Image',
              style: context.textTheme.labelMedium
                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          content: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    authCubit.pickImage(context, ImageSource.gallery);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.image,
                        size: 50,
                        color: primaryColor,
                      ),
                      const Gap(10),
                      Text(
                        'Gallery',
                        style: context.textTheme.labelMedium?.copyWith(
                          fontSize: 15,
                          color: midShadeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    authCubit.pickImage(context, ImageSource.camera);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.camera_alt_rounded,
                        size: 50,
                        color: primaryColor,
                      ),
                      const Gap(10),
                      Text(
                        'Camera',
                        style: context.textTheme.labelMedium?.copyWith(
                          fontSize: 15,
                          color: midShadeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

//show picked image dialog
  void _showProfileImageDialog(BuildContext context, XFile? profileImage) {
    if (profileImage == null) return;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: InteractiveViewer(
            child: Image.file(
              File(profileImage.path),
              height: 300,
              width: 250,
            ),
          ),
        );
      },
    );
  }

//for focus node
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    // userNameController.dispose();
    symbolController.dispose();
    emailController.dispose();
    registrationController.dispose();
    programIdController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailFocusNode.dispose();
    symbolFocusNode.dispose();
    registrationFocusNode.dispose();
    batchFocusNode.dispose();
    programFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

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
      // body: BlocConsumer<AuthBloc, AuthState>(
      //   listener: (context, state) {
      //     if (state.signUpState == SignUpState.success) {
      //       context.pushReplacement(
      //         AppRouter.login,
      //       );
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(
      //           duration: const Duration(seconds: 2),
      //           content: Text(state.signUpSuccessMessage),
      //           backgroundColor: Colors.green,
      //         ),
      //       );
      //       context.read<AuthBloc>().add(InitialSignUpEvent());
      //     }

      //     if (state.signUpState == SignUpState.failure) {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(
      //           duration: const Duration(seconds: 2),
      //           content: Text(
      //             state.signUpErrorMessage,
      //             // state.signUpErrorMessage.replaceRange(
      //             //   11,
      //             //   12,
      //             //   state.signUpErrorMessage[11].toUpperCase(),
      //             // ),
      //           ),
      //           backgroundColor: Colors.red,
      //         ),
      //       );
      //       context.read<AuthBloc>().add(InitialSignUpEvent());
      //     }
      //   },
      //   builder: (context, state) {
      body: BlocBuilder<AuthCubit, AuthCubitState>(
        builder: (context, cubitState) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 150,
            ),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  // Center(
                  //   child: Image.asset(
                  //     Assets.images.palmLogo.keyName,
                  //     scale: 8,
                  //   ),
                  // ),

                  const Gap(80),
                  Text(
                    'Register to Result E',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const Gap(12),
                  Text(
                    'We make it easy for everyone to view their result Seamlessly.',
                    style: context.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(40),

                  //for email

                  // LabelTextFormField(
                  //   label: 'Username',
                  //   textEditingController: userNameController,
                  //   inputType: TextInputType.name,
                  //   textFieldType: TextFieldType.name,
                  //   hintText: 'Username',
                  //   focusNode: nameFocusNode,
                  //   textInputAction: TextInputAction.next,
                  //   onFieldSubmitted: (p0) {
                  //     FocusScope.of(context).requestFocus(phoneFocusNode);
                  //     return null;
                  //   },
                  //   // enabled: state.signInState != SignInState.loading,
                  // ),
                  // const Gap(12),

                  LabelTextFormField(
                    label: 'Email',
                    textEditingController: emailController,
                    inputType: TextInputType.emailAddress,
                    textFieldType: TextFieldType.email,
                    hintText: 'Enter Email address',
                    focusNode: emailFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (p2) {
                      FocusScope.of(context).requestFocus(symbolFocusNode);
                      return null;
                    },
                    // enabled: state.signInState != SignInState.loading,
                  ),

                  const Gap(12),
                  LabelTextFormField(
                    label: 'Symbol No.',
                    textEditingController: symbolController,
                    inputType: TextInputType.phone,
                    textFieldType: TextFieldType.phone,
                    hintText: 'Symbol No.',
                    focusNode: symbolFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (p1) {
                      FocusScope.of(context)
                          .requestFocus(registrationFocusNode);
                      return null;
                    },
                    // enabled: state.signInState != SignInState.loading,
                  ),
                  const Gap(12),
                  LabelTextFormField(
                    label: 'Registration No.',
                    textEditingController: registrationController,
                    inputType: TextInputType.text,
                    textFieldType: TextFieldType.text,
                    hintText: 'Registration No.',
                    focusNode: registrationFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (p3) {
                      FocusScope.of(context).requestFocus(batchFocusNode);
                      return null;
                    },
                    // enabled: state.signInState != SignInState.loading,
                  ),
                  const Gap(12),

                  LabelDropdownWidget(
                    label: 'Batch Year',
                    hint: 'Select Batch Year',
                    onChanged: (value) {
                      setState(() {
                        selectedBatchYear = value;
                      });
                      FocusScope.of(context).requestFocus(programFocusNode);
                    },
                    value: selectedBatchYear,
                    items: batchYears,
                    focusNode: batchFocusNode,
                    isLabelBold: true,
                  ),

                  const Gap(12),
                  LabelTextFormField(
                    label: 'Program Id.',
                    textEditingController: programIdController,
                    inputType: TextInputType.text,
                    textFieldType: TextFieldType.text,
                    hintText: 'Program Id.',
                    focusNode: programFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (p3) {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                      return null;
                    },
                    // enabled: state.signInState != SignInState.loading,
                  ),
                  const Gap(12),
                  LabelTextFormField(
                    label: 'Password',
                    textEditingController: passwordController,
                    inputType: TextInputType
                        .visiblePassword, //This will hide the word suggestions
                    hintText: 'Password',
                    focusNode: passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (p4) {
                      FocusScope.of(context)
                          .requestFocus(confirmPasswordFocusNode);
                      return null;
                    },
                    // enabled: state.signInState != SignInState.loading,

                    textFieldType: TextFieldType.password,
                    obsecureText: cubitState.showPassword,
                    // enabled: state.signInStatus != SignInStatus.loading,
                    suffixIcon: InkWell(
                      onTap: () => setState(() {
                        context.read<AuthCubit>().togglePasswordVisibility();
                      }),
                      child: Icon(
                        cubitState.showPassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                      ),
                    ),
                  ),

                  const Gap(12),
                  LabelTextFormField(
                    label: 'Confirm Password',
                    textEditingController: confirmPasswordController,
                    inputType: TextInputType
                        .visiblePassword, //This will hide the word suggestions
                    hintText: 'Confirm Password',
                    // enabled: state.signInState != SignInState.loading,
                    focusNode: confirmPasswordFocusNode,
                    textInputAction: TextInputAction.done,

                    textFieldType: TextFieldType.password,
                    obsecureText: cubitState.showConfirmPassword,
                    // enabled: state.signInStatus != SignInStatus.loading,
                    suffixIcon: InkWell(
                      onTap: () => setState(() {
                        context
                            .read<AuthCubit>()
                            .toggleConfirmPasswordVisibility();
                      }),
                      child: Icon(
                        cubitState.showConfirmPassword
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                      ),
                    ),
                  ),
                  const Gap(12),
                  Text(
                    'Profile Picture',
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: blackColor,
                    ),
                  ),
                  const Gap(10),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: lightShadeColor),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        if (cubitState.profileImage == null) {
                          // First tap, open gallery
                          _showImageOptions(context);
                        } else {
                          // Second tap, show the selected image
                          _showProfileImageDialog(
                            context,
                            cubitState.profileImage,
                          );
                        }
                      },
                      leading: const Gap(10),
                      title: Center(
                        child: cubitState.profileImage == null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.file_upload_outlined,
                                    size: 18,
                                    color: midShadeColor,
                                  ),
                                  const Gap(4),
                                  Text(
                                    'Upload  picture', //_profileImage!.name,
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: midShadeColor,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                'Image: Profile Picture', //_profileImage!.name,
                                style: context.textTheme.bodySmall?.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: midShadeColor,
                                ),
                              ),
                      ),
                      trailing: cubitState.profileImage != null
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  cubitState.profileImage = null;
                                });
                                // context
                                //     .read<AuthCubit>()
                                //     .clearProfileImage();
                              },
                              icon: const Icon(
                                Icons.cancel_outlined,
                                size: 20,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  if (showProfileErrMessagge && cubitState.profileImage == null)
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'Please select your Profile Image',
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  const Gap(40),
                  CustomAppButton(
                    height: 50,
                    buttonLabel: 'Sign Up',
                    buttonType: ButtonType.primary,
                    // isLoading: state.signUpState == SignUpState.loading,
                    onButtonPressed: () {
                      if (_formKey.currentState!.validate() &&
                          cubitState.profileImage != null) {
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text(
                                "Password and Confirm Password Doesn't match",
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          // context.read<AuthBloc>().add(
                          //       SignUpUserEvent(
                          //         userName: userNameController.text.trim(),
                          //         phone: phoneController.text.trim(),
                          //         email: emailController.text.trim(),
                          //         location: locationController.text.trim(),
                          //         password: passwordController.text.trim(),
                          //         confirmPassword:
                          //             confirmPasswordController.text.trim(),
                          //         profilePic: cubitState.profileImage !=
                          //                 null
                          //             ? File(cubitState.profileImage!.path)
                          //             : null,
                          //       ),
                          //     );
                        }
                      } else {
                        setState(() {
                          showProfileErrMessagge =
                              cubitState.profileImage == null;
                        });
                        print('Form Validation Failed'); // Debug print
                      }
                    },
                  ),

                  const Gap(20),
                  AuthBaseWidget(
                    message: 'Already have an account?',
                    buttonLabel: 'Sign In',
                    onPressed: () {
                      context.pushReplacement(
                        AppRouter.login,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
        //   );
        // },
      ),
    );
  }
}
