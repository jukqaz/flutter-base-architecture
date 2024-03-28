import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/gen/assets.gen.dart';
import 'package:flutter_base_architecture/src/core/router/routes.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) context.goNamed(Routes.signIn.name);
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Assets.images.splashBg.image(fit: BoxFit.cover),
        ),
      );
}
