import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/src/features/auth/presentation/screen/sign_in_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: SignInScreen(),
      );
}
