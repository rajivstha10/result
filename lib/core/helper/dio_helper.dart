// ignore_for_file: prefer_single_quotes, avoid_print, public_member_api_docs, unused_local_variable, duplicate_ignore, lines_longer_than_80_chars

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:result_e/core/strings/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
class DioHelper {
  ///
  static late Dio dio;

  ///
  static void init() {
    final options = BaseOptions(
      connectTimeout: const Duration(
        seconds: 120,
      ),
      receiveTimeout: const Duration(
        seconds: 120,
      ),
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  ///
  Future<dynamic> postData({
    required String endpoint,
    dynamic formData,
  }) async {
    try {
      log('POST $baseURL$endpoint');

      final prefs = await SharedPreferences.getInstance();
      final access = prefs.getString('access');
      print(access);
      print(formData);

      final response = await dio.post<dynamic>(
        "$baseURL$endpoint",
        data: formData,
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $access',
          },
        ),
      );
      // Map result = response.data;
      print(response);
      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.data;
      } else {
        var errorMsg = '';
        if (response.data is Map<String, dynamic>) {
          final data = response.data as Map<String, dynamic>;
          if (data.entries.first.value is List) {
            final errorList = data.entries.first.value as List<dynamic>;
            errorMsg = errorList.first as String;
          } else {
            errorMsg = data.entries.first.value as String;
          }
        }

        if (response.data is List) {
          final errorList = response.data as List<dynamic>;
          errorMsg = errorList.first as String;
        }

        print(response);
        throw Exception(errorMsg);
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  ///
  Future<dynamic> getData({
    required String endpoint,
    Map<String, dynamic>? query,
    bool tokenRequired = false,
  }) async {
    try {
      log('GET $baseURL$endpoint');
      String? access;
      if (tokenRequired) {
        final prefs = await SharedPreferences.getInstance();
        access = prefs.getString('access');
      }

      final response = await dio.get<dynamic>(
        "$baseURL$endpoint",
        queryParameters: query,
        options: tokenRequired
            ? Options(
                validateStatus: (_) => true,
                contentType: Headers.jsonContentType,
                responseType: ResponseType.json,
                headers: {
                  HttpHeaders.authorizationHeader: 'Bearer $access',
                },
              )
            : null,
      );
      log('GET $baseURL$endpoint$query');

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
