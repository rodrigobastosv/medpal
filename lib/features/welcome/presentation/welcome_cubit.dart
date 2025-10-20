import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/features/welcome/domain/set_first_launch_use_case.dart';
import 'package:medpal/features/welcome/presentation/welcome_presentation_events.dart';

class WelcomeCubit extends Cubit<void> with BlocPresentationMixin<void, WelcomePresentationEvent> {
  WelcomeCubit({required SetFirstLaunchUseCase setFirstLaunchUseCase}) : _setFirstLaunchUseCase = setFirstLaunchUseCase, super(null);

  final SetFirstLaunchUseCase _setFirstLaunchUseCase;

  Future<void> finishIntro() async {
    await _setFirstLaunchUseCase(isFirstLaunch: false);
    emitPresentation(IntroCompletedEvent());
  }
}
