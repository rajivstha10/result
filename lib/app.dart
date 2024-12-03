import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:result_e/core/helper/secure_storage_helper.dart';
import 'package:result_e/core/theme/theme.dart';
import 'package:result_e/data/repositories/auth_repo_impl.dart';
import 'package:result_e/features/auth/bloc/auth_bloc.dart';
import 'package:result_e/features/auth/cubit/auth_cubit.dart';
import 'package:result_e/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:result_e/locator.dart';

///
class App extends StatelessWidget {
  ///
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //cubit providers
        BlocProvider(
          create: (context) => locator<OnboardingCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<AuthCubit>(),
        ),

        BlocProvider(
          create: (context) => AuthBloc(
            authRepository: AuthRepositoryImpl(),
            secureStorageHelper: SecureStorageHelperImpl(
              flutterSecureStorage: const FlutterSecureStorage(),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'result_e',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        routerConfig: locator<GoRouter>(),
      ),
    );
  }
}
