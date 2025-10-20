import 'package:medpal/features/welcome/data/welcome_repository.dart';

class SetFirstLaunchUseCase {
  SetFirstLaunchUseCase({required WelcomeRepository welcomeRepository}) : _welcomeRepository = welcomeRepository;

  final WelcomeRepository _welcomeRepository;

  Future<void> call({required bool isFirstLaunch}) => _welcomeRepository.setFirstLaunch(isFirstLaunch: isFirstLaunch);
}
