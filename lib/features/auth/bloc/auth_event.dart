// ignore_for_file: public_member_api_docs

part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialSignInEvent extends AuthEvent {}

class InitialSignUpEvent extends AuthEvent {}

///
class SignInUserEvent extends AuthEvent {
  ///
  SignInUserEvent({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  ///
  final String email;

  ///
  final String password;

  ///
  final bool rememberMe;
}

class SignUpUserEvent extends AuthEvent {
  ///
  SignUpUserEvent({
    required this.email,
    required this.password,
    required this.symbolNumber,
    required this.registrationNumber,
    required this.profilePic,
    required this.batchId,
    required this.programId,
  });

  ///
  final String email;

  ///
  final String password;

  ///
  final String symbolNumber;

  ///
  final String registrationNumber;

  ///
  File? profilePic;

  ///
  final int batchId;

  ///
  final int programId;
}
