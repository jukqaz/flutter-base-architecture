import 'package:flutter_base_architecture/src/core/use_case/use_case.dart';
import 'package:flutter_base_architecture/src/features/auth/data/repository/remote_auth_repository.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_use_case.g.dart';

@Riverpod(keepAlive: true)
SignUpUseCase signUpUseCase(SignUpUseCaseRef ref) => SignUpUseCase(ref.watch(authRepositoryProvider));

typedef Params = ({String email, String password});

class SignUpUseCase extends UseCase<UserEntity, Params> {
  SignUpUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<UserEntity> call(Params params) => repository.signUp(params.email, params.password);
}
