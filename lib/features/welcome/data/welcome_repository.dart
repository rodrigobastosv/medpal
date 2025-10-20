import 'package:medpal/core/services/local_storage/local_storage_service.dart';

class WelcomeRepository {
  WelcomeRepository({required LocalStorageService localStorageService}) : _localStorageService = localStorageService;

  final LocalStorageService _localStorageService;

  Future<void> setFirstLaunch({required bool isFirstLaunch}) =>
      _localStorageService.writeBoolValue(key: 'is_first_launch', value: isFirstLaunch);
}
