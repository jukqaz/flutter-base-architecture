import 'package:flutter_base_architecture/src/features/auth/domain/entity/user_entity.dart';

// Dart에서 void는 모든 타입의 상위 타입으로 간주됩니다.
// 즉, 어떤 값이든 void로 처리할 수 있으며, 이는 값을 단순히 무시하거나 사용하지 않음으로써 가능합니다.
// by ChatGPT
abstract class AuthRepository {
  Future<void> signUp(String email, String password);
  Future<UserEntity> signIn(String email, String password);
  Future<void> signOut();
}
