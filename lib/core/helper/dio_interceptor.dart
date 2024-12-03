// ignore_for_file: strict_raw_type, lines_longer_than_80_chars, inference_failure_on_function_invocation, avoid_dynamic_calls, use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:result_e/app_router.dart';
import 'package:result_e/core/helper/dio_helper.dart';
import 'package:result_e/core/strings/strings.dart';
import 'package:result_e/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access');

    // Only add Authorization header if accessToken exists
    if (accessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    }

    log('REQUEST[${options.method}] => PATH: ${options.path} HEADERS: ${options.headers}');
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} DATA: ${response.data}');

    // If the response status is 401 (Unauthorized)
    if (response.statusCode == 401) {
      log('401 Unauthorized error. Attempting token refresh...');

      final prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString('refreshToken');
      final isGuest = prefs.getBool('isGuest') ?? false;

      // If the user is a guest (both access and refresh tokens are null)
      if (isGuest || (refreshToken == null)) {
        log('Guest user or no refresh token, skipping token refresh and request retry');
        // Do nothing - allow the request to be handled as guest
        return super.onResponse(response, handler);
      }

      // Proceed with token refresh if refreshToken is available
      try {
        final newAccessToken = await _refreshToken(refreshToken);
        if (newAccessToken != null) {
          log('Token refreshed successfully');
          await prefs.setString('access', newAccessToken);
          final access = prefs.getString('access');
          print('New Access Token $access');

          // Retry the request with the new access token
          final retryOptions = response.requestOptions.copyWith(
            headers: {
              ...response.requestOptions.headers,
              HttpHeaders.authorizationHeader: 'Bearer $newAccessToken',
            },
          );

          final retryResponse = await DioHelper.dio.request(
            retryOptions.path,
            options: Options(
              method: retryOptions.method,
              headers: retryOptions.headers,
            ),
            data: retryOptions.data,
            queryParameters: retryOptions.queryParameters,
          );

          return handler
              .resolve(retryResponse); // Resolve with the new response
        } else {
          log('Token refresh failed.');
          await _handleLogout();
        }
      } catch (refreshError) {
        log('Token refresh failed: $refreshError');
        await _handleLogout();
      }
    }

    super.onResponse(response, handler); // Pass the response
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(
      err,
      handler,
    ); // Call super to handle the error if not resolved
  }

  Future<void> _handleLogout() async {
    log('Logging out user...');
    await showSessionOverMessage();

    // If token refresh fails, log out the user by clearing tokens
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access');
    await prefs.remove('refreshToken');
    await prefs.setBool('isGuest', true);

    //redirect to loginpage
    final goRouter = locator<GoRouter>();
    // ignore: cascade_invocations
    goRouter.go(AppRouter.login);
    log('User logged out. Tokens cleared.');
  }

  Future<String?> _refreshToken(String refreshToken) async {
    try {
      final response = await DioHelper.dio.post(
        '${baseURL}refresh-token/',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        return response.data['token'] as String?;
      }
    } catch (e) {
      log('Error refreshing token: $e');
    }
    return null;
  }

  Future<void> showSessionOverMessage() async {
    final context =
        locator<AppRouter>().router.routerDelegate.navigatorKey.currentContext;

    if (context != null) {
      unawaited(
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.logout, size: 64, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    'Session Over',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('You are being logged out.'),
                ],
              ),
            );
          },
        ),
      );

      // Add a delay before dismissing the dialog and logging out
      // ignore: inference_failure_on_instance_creation
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context, rootNavigator: true).pop(); // Close the dialog
    }
  }
}
