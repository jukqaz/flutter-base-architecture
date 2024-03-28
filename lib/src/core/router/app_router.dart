import 'package:flutter/foundation.dart';
import 'package:flutter_base_architecture/src/core/router/routes.dart';
import 'package:flutter_base_architecture/src/features/auth/presentation/screen/home_screen.dart';
import 'package:flutter_base_architecture/src/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:flutter_base_architecture/src/features/auth/presentation/screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: kDebugMode,
  redirect: (context, state) {
    return null;
  },
  routes: [
    AppRoute(
      Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    AppRoute(
      Routes.signIn,
      builder: (context, state) => const SignInScreen(),
    ),
    AppRoute(
      Routes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
