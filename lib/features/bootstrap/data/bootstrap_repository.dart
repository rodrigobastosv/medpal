import 'package:medpal/features/bootstrap/data/datasources/local/bootstrap_local_datasource.dart';

class BootstrapRepository {
  BootstrapRepository({required BootstrapLocalDatasource bootstrapLocalDatasource}) : _bootstrapLocalDatasource = bootstrapLocalDatasource;

  final BootstrapLocalDatasource _bootstrapLocalDatasource;

  bool isFirstLaunch() => _bootstrapLocalDatasource.isFirstLaunch();
}
