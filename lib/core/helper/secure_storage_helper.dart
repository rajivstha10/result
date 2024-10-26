// ignore_for_file: one_member_abstracts, avoid_print

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:result_e/core/strings/storage_keys.dart';

///
abstract class SecureStorageHelper {
  ///
  void setUserDetails(String email, String password);

  ///
  Future<Map<String, String>?> getUserDetails();

  ///
  void clearStores(String email, String password);
}

///
class SecureStorageHelperImpl implements SecureStorageHelper {
  ///
  SecureStorageHelperImpl({required this.flutterSecureStorage});

  ///
  final FlutterSecureStorage flutterSecureStorage;

  @override
  Future<void> setUserDetails(String email, String password) async =>
      flutterSecureStorage.write(
        key: userDetails,
        value: '$email,$password',
      );

  @override
  Future<Map<String, String>?> getUserDetails() async {
    final res = await flutterSecureStorage.read(key: userDetails);
    print(res);
    if (res != null) {
      final parts = res.split(',');
      return {'email': parts[0], 'password': parts[1]};
    }
    return null;
  }

  @override
  Future<void> clearStores(String email, String password) async {
    //rewrites the shared preference and saves email only
    // ignore: unawaited_futures
    flutterSecureStorage.write(
      key: userDetails,
      value: '$email,',
    );
  }
}
