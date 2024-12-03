// ignore_for_file: public_member_api_docs

part of 'auth_bloc.dart';

enum SignInState { initial, loading, success, failure }

enum SignUpState { initial, loading, success, failure }

class AuthState extends Equatable {
  const AuthState({
    this.signInState = SignInState.initial,
    this.signUpState = SignUpState.initial,
    this.signInSuccessMessage = '',
    this.signInErrorMessage = '',
    this.signUpSuccessMessage = '',
    this.signUpErrorMessage = '',
    this.loginResponse = const LoginResponse(),
  });

  final SignInState signInState;
  final SignUpState signUpState;

  final String signInSuccessMessage;
  final String signInErrorMessage;
  final String signUpSuccessMessage;
  final String signUpErrorMessage;
  final LoginResponse loginResponse;

  @override
  List<Object?> get props {
    return [
      signInState,
      signInState,
      signInSuccessMessage,
      signInErrorMessage,
      signUpSuccessMessage,
      signUpErrorMessage,
      loginResponse,
    ];
  }

  AuthState copyWith({
    SignInState? signInState,
    SignUpState? signUpState,
    String? signInSuccessMessage,
    String? signInErrorMessage,
    String? signUpSuccessMessage,
    String? signUpErrorMessage,
    LoginResponse? loginResponse,
  }) {
    return AuthState(
      signInState: signInState ?? this.signInState,
      signUpState: signUpState ?? this.signUpState,
      signInSuccessMessage: signInSuccessMessage ?? this.signInSuccessMessage,
      signInErrorMessage: signInErrorMessage ?? this.signInErrorMessage,
      signUpSuccessMessage: signUpSuccessMessage ?? this.signUpSuccessMessage,
      signUpErrorMessage: signUpErrorMessage ?? this.signUpErrorMessage,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }
}
