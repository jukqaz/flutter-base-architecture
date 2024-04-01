import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/src/features/auth/presentation/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: const Text('Main'),
        ),
        body: Center(
          child: ref.watch(authControllerProvider).when(
                data: (user) => Text('Welcome ${user?.email ?? 'Guest'}'),
                loading: () => const CircularProgressIndicator(),
                error: (error, _) => Text('Error: $error'),
              ),
        ),
      );
}
