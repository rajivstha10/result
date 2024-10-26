// ignore_for_file: strict_raw_type, cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:result_e/app_router.dart';
import 'package:result_e/core/helper/secure_storage_helper.dart';
import 'package:result_e/features/auth/cubit/auth_cubit.dart';
import 'package:result_e/features/onboarding/cubit/onboarding_cubit.dart';

/// GET_IT instance
final locator = GetIt.instance;

/// DI initialization
Future<void> init() async {
  /// Datasource

  /// Repositories

  /// Usecases

  /// Blocs && Cubit
  locator.registerFactory(
    OnboardingCubit.new,
  );
  locator.registerFactory(
    AuthCubit.new,
  );

  // locator.registerFactory(
  //   () => AuthBloc(authRepository: locator(), secureStorageHelper: locator()),
  // );

  /// Route
  locator
    ..registerSingleton<RouteObserver<PageRoute>>(RouteObserver<PageRoute>())
    ..registerSingleton(
      AppRouter(
        routeObserver: locator<RouteObserver<PageRoute>>(),
      ),
    )
    ..registerSingleton<GoRouter>(locator<AppRouter>().router);

  /// Local DB
  locator.registerLazySingleton<SecureStorageHelper>(
    () => SecureStorageHelperImpl(flutterSecureStorage: locator()),
  );

// /// External
// final flutterSecureStorage = FlutterSecureStorage(
//   aOptions: AndroidOptions(encryptedSharedPreferences: true),
// );
// locator.registerLazySingleton(() => flutterSecureStorage);
}
