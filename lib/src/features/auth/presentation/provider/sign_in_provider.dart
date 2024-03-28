import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_provider.g.dart';

@riverpod
FutureOr<bool> signIn(SignInRef ref) => Future.delayed(
      const Duration(seconds: 3),
      () => Random().nextBool(),
    );
