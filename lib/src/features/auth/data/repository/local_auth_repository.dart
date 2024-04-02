import 'package:drift/drift.dart';
import 'package:flutter_base_architecture/src/core/database/database.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) => LocalAuthRepository(
      ref.watch(appDatabaseProvider),
    );

class LocalAuthRepository extends AuthRepository {
  LocalAuthRepository(this.dataSource);

  final AppDatabase dataSource;

  @override
  Future<UserEntity> signUp(String email, String password) async {
    final generatedId = await dataSource.into(dataSource.user).insert(
          UserCompanion.insert(
            email: email,
            password: password,
          ),
        );

    return UserEntity(
      id: generatedId,
      email: email,
    );
  }

  @override
  Future<UserEntity> signIn(String email, String password) async {
    final user = await (dataSource.select(dataSource.user)
          ..where((tbl) => tbl.email.equals(email) & tbl.password.equals(password)))
        .getSingle();
    return UserEntity(
      id: user.id,
      email: user.email,
    );
  }

  @override
  Future<void> signOut() => dataSource.delete(dataSource.user).go();
}
