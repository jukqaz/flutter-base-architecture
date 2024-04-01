import 'package:flutter_base_architecture/src/core/use_case/empty_params_use_case.dart';
import 'package:flutter_base_architecture/src/features/auth/data/repository/remote_auth_repository.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_out_use_case.g.dart';

@Riverpod(keepAlive: true)
SignOutUseCase signOutUseCase(SignOutUseCaseRef ref) => SignOutUseCase(ref.watch(authRepositoryProvider));

class SignOutUseCase extends EmptyParamsUseCase<void> {
  SignOutUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<void> call() => repository.signOut();
}
