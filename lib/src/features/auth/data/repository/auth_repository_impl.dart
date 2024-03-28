import 'package:flutter_base_architecture/src/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<UserEntity> signUp(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signIn(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
