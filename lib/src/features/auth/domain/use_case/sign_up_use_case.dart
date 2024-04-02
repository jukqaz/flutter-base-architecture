import 'package:flutter_base_architecture/src/core/use_case/use_case.dart';
import 'package:flutter_base_architecture/src/features/auth/data/repository/local_auth_repository.dart';
import 'package:flutter_base_architecture/src/features/auth/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_use_case.g.dart';

@Riverpod(keepAlive: true)
SignUpUseCase signUpUseCase(SignUpUseCaseRef ref) => SignUpUseCase(ref.watch(authRepositoryProvider));

typedef Params = ({String email, String password});

class SignUpUseCase extends UseCase<void, Params> {
  SignUpUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<void> call(Params params) => repository.signUp(params.email, params.password);
}
