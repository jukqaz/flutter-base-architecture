import 'package:flutter_base_architecture/src/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/use_case/sign_in_use_case.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/use_case/sign_out_use_case.dart';
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
    state = await AsyncValue.guard(() {
      final signUp = ref.read(signUpUseCaseProvider);
      return signUp((email: email, password: password));
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final signOut = ref.read(signOutUseCaseProvider);
      await signOut();
      return null;
    });
  }
}
