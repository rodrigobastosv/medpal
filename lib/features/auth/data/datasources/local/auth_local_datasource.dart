import 'package:medpal/core/services/local_storage/local_storage_service.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';

class AuthLocalDatasource {
  AuthLocalDatasource({required LocalStorageService localStorageService}) : _localStorageService = localStorageService;

  final LocalStorageService _localStorageService;

  Future<void> saveUser(AuthenticatedUser user) => _localStorageService.writeJsonValue(key: 'user', value: user.toJson());

  User getUser() {
    final json = _localStorageService.readJsonValue('user');
    if (json == null) {
      return GuestUser();
    }
    return AuthenticatedUser.fromJson(json);
  }
}
