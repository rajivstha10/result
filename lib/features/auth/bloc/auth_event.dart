// ignore_for_file: public_member_api_docs

part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialSignInEvent extends AuthEvent {}

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
