// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:image_picker/image_picker.dart';

class AuthCubitState {
  final String email;
  final String username;
  final String phone;
  final String location;
  final String password;
  final String confirmPassword;
  final bool showPassword;
  final bool showConfirmPassword;
  XFile? profileImage;

  AuthCubitState({
    this.email = '',
    this.username = '',
    this.phone = '',
    this.location = '',
    this.password = '',
    this.confirmPassword = '',
    this.showPassword = true,
    this.showConfirmPassword = true,
    this.profileImage,
  });

  AuthCubitState copyWith({
    String? email,
    String? username,
    String? phone,
    String? location,
    String? password,
    String? confirmPassword,
    bool? showPassword,
    bool? showConfirmPassword,
    XFile? profileImage,
  }) {
    return AuthCubitState(
      email: email ?? this.email,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      showPassword: showPassword ?? this.showPassword,
      showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
