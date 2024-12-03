import 'dart:io';

import 'package:result_e/data/models/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> loginResponse({
    required String email,
    required String password,
  });
}
