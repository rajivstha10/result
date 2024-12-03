// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'user') User? user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'role') String? role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
