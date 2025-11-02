import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/auth/data/auth_repository.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/auth/domain/errors/sign_in_error.dart';

class SignInUseCase {
  SignInUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<Result<SignInError, User>> call({required String email, required String password}) =>
      _authRepository.signIn(email: email, password: password);
}
