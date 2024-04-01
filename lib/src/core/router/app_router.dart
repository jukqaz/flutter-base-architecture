import 'package:flutter/foundation.dart';
import 'package:flutter_base_architecture/src/core/router/routes.dart';
import 'package:flutter_base_architecture/src/core/utils/logger.dart';
import 'package:flutter_base_architecture/src/features/auth/presentation/provider/auth_provider.dart';
import 'package:flutter_base_architecture/src/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:flutter_base_architecture/src/features/home/presentation/screen/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) => GoRouter(
      initialLocation: Routes.home.path,
      debugLogDiagnostics: kDebugMode,
      redirect: (context, state) {
        final user = ref.read(authControllerProvider).valueOrNull;
        talker.log('Redirecting to ${state.path}, User: $user');
        if (user == null) return Routes.signIn.path;
        if (state.path == Routes.signIn.path) return Routes.home.path;
        return null;
      },
      routes: [
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
