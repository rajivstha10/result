// ignore_for_file: public_member_api_docs

part of 'auth_bloc.dart';

enum SignInState { initial, loading, success, failure }

class AuthState extends Equatable {
  const AuthState({
    this.signInState = SignInState.initial,
    this.signInSuccessMessage = '',
    this.signInErrorMessage = '',
    this.loginResponse = const LoginResponse(),
  });

  final SignInState signInState;
  final String signInSuccessMessage;
  final String signInErrorMessage;
  final LoginResponse loginResponse;

  @override
  List<Object?> get props {
    return [
      signInState,
      signInSuccessMessage,
      signInErrorMessage,
      loginResponse,
    ];
  }

  AuthState copyWith({
    SignInState? signInState,
    String? signInSuccessMessage,
    String? signInErrorMessage,
    LoginResponse? loginResponse,
  }) {
    return AuthState(
      signInState: signInState ?? this.signInState,
      signInSuccessMessage: signInSuccessMessage ?? this.signInSuccessMessage,
      signInErrorMessage: signInErrorMessage ?? this.signInErrorMessage,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }
}
