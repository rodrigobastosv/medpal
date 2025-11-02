import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/auth/data/auth_repository.dart';
import 'package:medpal/features/auth/domain/errors/sign_up_error.dart';

class SignUpUseCase {
  SignUpUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<Result<SignUpError, void>> call({
    required String name,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final signUpResult = await _authRepository.signUp(name: name, lastName: lastName, email: email, password: password);
    return signUpResult.when(Error.new, (user) async {
      await _authRepository.addUser(user: user);
      return const Success(null);
    });
  }
}
