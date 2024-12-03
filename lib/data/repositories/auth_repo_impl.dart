// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars, avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:result_e/core/helper/dio_helper.dart';
import 'package:result_e/data/models/login_response.dart';
import 'package:result_e/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final dioHelper = DioHelper();

  @override
  Future<LoginResponse> loginResponse({
    required String email,
    required String password,
  }) async {
    try {
      final formData = FormData.fromMap({
        'email': email,
        'password': password,
      });

      final res = await dioHelper.postData(
        endpoint: 'user/login/',
        formData: formData,
      );
      if (res != null) {
        return LoginResponse.fromJson(res as Map<String, dynamic>);
      } else {
        return const LoginResponse();
      }
    } catch (e) {
      log('Login error: $e');
      rethrow;
    }
  }
}
