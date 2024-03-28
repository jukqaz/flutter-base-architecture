import 'package:flutter_base_architecture/src/core/utils/logger.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/entity/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  UserEntity? build() {
    return null;
  }

  Future<void> signIn(String email, String password) async {
    talker.log('Sign in with email: $email, password: $password');
  }

  void signOut() {}
}
