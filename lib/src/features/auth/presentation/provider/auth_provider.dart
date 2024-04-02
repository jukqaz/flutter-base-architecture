import 'package:flutter/foundation.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/use_case/sign_in_use_case.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  AsyncValue<UserEntity?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      final signIn = ref.read(signInUseCaseProvider);
      return signIn((email: email, password: password));
    });
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final signUp = ref.read(signUpUseCaseProvider);
      await signUp((email: email, password: password));
      return null;
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.data(null);
  }
}

@Riverpod(keepAlive: true)
Raw<ValueNotifier<UserEntity?>> currentUser(CurrentUserRef ref) {
  ref.listen(authControllerProvider, (prev, current) {
    ref.state = ValueNotifier(current.valueOrNull);
  });

  final user = ref.watch(authControllerProvider).valueOrNull;
  return ValueNotifier(user);
}
