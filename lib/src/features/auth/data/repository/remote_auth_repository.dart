import 'package:dio/dio.dart';
import 'package:flutter_base_architecture/src/core/network/api_client.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) => RemoteAuthRepository(
      ref.watch(dioProvider),
    );

class RemoteAuthRepository extends AuthRepository {
  RemoteAuthRepository(this.dataSource);

  final Dio dataSource;

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
