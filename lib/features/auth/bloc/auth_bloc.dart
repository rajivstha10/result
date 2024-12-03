import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:result_e/core/helper/secure_storage_helper.dart';
import 'package:result_e/data/models/login_response.dart';
import 'package:result_e/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository, required this.secureStorageHelper})
      : super(const AuthState()) {
    ///Signup / Register

    ///Signin
    on<InitialSignInEvent>((event, emit) {
      emit(
        state.copyWith(
          signInState: SignInState.initial,
          signInErrorMessage: '',
          signInSuccessMessage: '',
        ),
      );
    });

    on<SignInUserEvent>(
      (event, emit) async {
        try {
          emit(state.copyWith(signInState: SignInState.loading));
          final res = await authRepository.loginResponse(
            email: event.email,
            password: event.password,
          );
          if (res.user != null) {
            final prefs = await SharedPreferences.getInstance();
            // await prefs.setString('access', res.accessToken.toString());
            // await prefs.setString('refreshToken', res.refreshToken.toString());

            // if remember me then
            if (event.rememberMe) {
              secureStorageHelper.setUserDetails(
                event.email,
                event.password,
              );
              print(
                'Data stored in Storage: ${event.email}, ${event.password}',
              );
            } else {
              secureStorageHelper.clearStores(
                event.email,
                event.password,
              );
              print(
                'Data cleared from Storage: ${event.email}, ${event.password}',
              );
            }

            emit(
              state.copyWith(
                signInState: SignInState.success,
                signInSuccessMessage: 'Login Successful.',
                loginResponse: res,
              ),
            );
          } else {
            emit(
              state.copyWith(
                signInState: SignInState.failure,
                signInErrorMessage: res.message,
              ),
            );
          }
        } catch (e) {
          if (e is DioException) {
            final errorMessage = e.response?.statusMessage;
            final statusCode = e.response?.statusCode;

            // Handle HTTP error
            if (e.response != null) {
              emit(
                state.copyWith(
                  signInState: SignInState.failure,
                  signInErrorMessage: '$statusCode $errorMessage',
                ),
              );
            } else {
              // Handles network issues
              emit(
                state.copyWith(
                  signInState: SignInState.failure,
                  signInErrorMessage: 'Network Error',
                ),
              );
            }
          } else {
            emit(
              state.copyWith(
                signInState: SignInState.failure,
                signInErrorMessage: '$e',
              ),
            );
          }
        }
      },
    );
  }

  ///
  final AuthRepository authRepository;

  ///
  final SecureStorageHelper secureStorageHelper;
}
