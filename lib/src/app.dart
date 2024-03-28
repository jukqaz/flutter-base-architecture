import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/src/core/router/app_router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: appRouter,
      );
}
