import 'package:go_router/go_router.dart';

enum Routes {
  signIn('/sign-in'),
  signUp('/sign-up'),
  home('/home');

  const Routes(this.path);

  final String path;
}

class AppRoute extends GoRoute {
  AppRoute(
    Routes route, {
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.redirect,
    super.onExit,
    super.routes = const <RouteBase>[],
  }) : super(path: route.path, name: route.name);
}
