import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/src/features/auth/presentation/provider/sign_in_provider.dart';
import 'package:flutter_base_architecture/src/features/auth/presentation/widgets/sign_in_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: const Text('Sign-In'),
        ),
        body: Center(
          child: SignInButton(
            onPressed: () => ref.invalidate(signInProvider),
          ),
        ),
      );
}
