import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/auth/data/auth_repository.dart';

class SignUpUseCase {
  SignUpUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<Result<MPError, void>> call({required String email, required String password}) async {
    await _authRepository.signUp(email: email, password: password);
    return const Success(null);
  }
}
