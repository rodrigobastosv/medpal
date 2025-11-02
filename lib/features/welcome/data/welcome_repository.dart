import 'package:medpal/features/welcome/data/datasources/local/welcome_local_datasource.dart';

class WelcomeRepository {
  WelcomeRepository({required WelcomeLocalDatasource welcomeLocalDatasource}) : _welcomeLocalDatasource = welcomeLocalDatasource;

  final WelcomeLocalDatasource _welcomeLocalDatasource;

  Future<void> setFirstLaunch({required bool isFirstLaunch}) => _welcomeLocalDatasource.setFirstLaunch(isFirstLaunch: isFirstLaunch);
}
