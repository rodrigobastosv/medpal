import 'package:medpal/core/services/local_storage/local_storage_service.dart';

class BootstrapRepository {
  BootstrapRepository({required LocalStorageService localStorageService}) : _localStorageService = localStorageService;

  final LocalStorageService _localStorageService;

  bool isFirstLaunch() => _localStorageService.readBoolValue('is_first_launch') ?? true;
}
