import 'package:medpal/features/auth/data/auth_repository.dart';

class GetUserAuthStatusUseCase {
  GetUserAuthStatusUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Stream<bool> call() => _authRepository.getUserAuthStatus;
}
