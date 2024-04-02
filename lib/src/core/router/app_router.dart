import 'package:flutter/foundation.dart';
import 'package:flutter_base_architecture/src/core/router/routes.dart';
import 'package:flutter_base_architecture/src/features/auth/presentation/provider/auth_provider.dart';
import 'package:flutter_base_architecture/src/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:flutter_base_architecture/src/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:flutter_base_architecture/src/features/home/presentation/screen/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final userNotifier = ref.watch(currentUserProvider);
  return GoRouter(
    initialLocation: Routes.signIn.path,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      final user = userNotifier.value;
      if (user == null && state.matchedLocation != Routes.signIn.path && state.matchedLocation != Routes.signUp.path) {
        return Routes.signIn.path;
      }
      if (user != null) {
        return Routes.home.path;
      }
      return null;
    },
    refreshListenable: userNotifier,
    routes: [
      AppRoute(
        Routes.signIn,
        builder: (context, state) => const SignInScreen(),
      ),
      AppRoute(
        Routes.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      AppRoute(
        Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
