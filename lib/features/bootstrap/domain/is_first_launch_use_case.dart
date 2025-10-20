import 'package:medpal/features/bootstrap/data/bootstrap_repository.dart';

class IsFirstLaunchUseCase {
  IsFirstLaunchUseCase({required BootstrapRepository bootstrapRepository}) : _bootstrapRepository = bootstrapRepository;

  final BootstrapRepository _bootstrapRepository;

  bool call() => _bootstrapRepository.isFirstLaunch();
}
