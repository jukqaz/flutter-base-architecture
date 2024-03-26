import 'package:flutter_base_architecture/src/core/use_case/use_case.dart';

typedef Params = void;

class SignInUseCase extends UseCase<void, Params> {
  SignInUseCase();

  @override
  Future<void> call(Params params) async {}
}
