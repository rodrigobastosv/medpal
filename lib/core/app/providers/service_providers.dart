import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/core/services/local_storage/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<RepositoryProvider> serviceProviders(SharedPreferences prefs) => [
  RepositoryProvider<LocalStorageService>(create: (context) => LocalStorageService(prefs: prefs)),
];
