// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:result_e/features/auth/cubit/auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitState());

  final ImagePicker _picker = ImagePicker();
// final get image=> state.state.profileImage;
  void togglePasswordVisibility() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void toggleConfirmPasswordVisibility() {
    emit(state.copyWith(showConfirmPassword: !state.showConfirmPassword));
  }


  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      emit(state.copyWith(profileImage: pickedFile));
    }
  }

  // void showImageOptions(BuildContext context) {
  //   // ignore: inference_failure_on_function_invocation
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return PickImageDialog(
  //           onSelect: (source) => pickImage(context, source));
  //     },
  //   );
  // }

  void clearProfileImage() {
    if (state.profileImage != null) {
      // ignore: avoid_redundant_argument_values
      emit(state.copyWith(profileImage: null));
    }
  }
}
