import 'package:flutter_base_architecture/src/core/network/supabase_client.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'remote_auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) => RemoteAuthRepository(
      ref.watch(supabaseClientProvider),
    );

class RemoteAuthRepository extends AuthRepository {
  RemoteAuthRepository(this.dataSource);

  final SupabaseClient dataSource;

  @override
  Future<UserEntity> signUp(String email, String password) async {
    final response = await dataSource.auth.signUp(email: email, password: password);
    final user = response.user;
    if (user == null) throw Exception('Failed to sign up');
    return UserEntity(
      id: user.id,
      email: user.email ?? email,
    );
  }

  @override
  Future<UserEntity> signIn(String email, String password) async {
    final response = await dataSource.auth.signInWithPassword(email: email, password: password);
    final user = response.user;
    if (user == null) throw Exception('Failed to sign in');
    return UserEntity(
      id: user.id,
      email: user.email ?? email,
    );
  }

  @override
  Future<void> signOut() => dataSource.auth.signOut();
}
