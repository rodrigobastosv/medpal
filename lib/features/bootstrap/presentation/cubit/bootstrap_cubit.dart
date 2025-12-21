import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/auth/domain/use_cases/get_user_use_case.dart';
import 'package:medpal/features/bootstrap/domain/is_first_launch_use_case.dart';
import 'package:medpal/features/bootstrap/presentation/cubit/bootstrap_presentation_events.dart';

class BootstrapCubit extends Cubit<void> with BlocPresentationMixin<void, BootstrapPresentationEvent> {
  BootstrapCubit({required IsFirstLaunchUseCase isFirstLaunchUseCase, required GetUserUseCase getUserUseCase})
    : _isFirstLaunchUseCase = isFirstLaunchUseCase,
      _getUserUseCase = getUserUseCase,
      super(null);

  final IsFirstLaunchUseCase _isFirstLaunchUseCase;
  final GetUserUseCase _getUserUseCase;

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1));

    final isFirstLaunch = _isFirstLaunchUseCase();
    if (isFirstLaunch) {
      emitPresentation(FirstLaunchEvent());
      return;
    }

    final user = _getUserUseCase;
    if (user is AuthenticatedUser) {
      emitPresentation(UserSignedInEvent());
    }

    emitPresentation(UserSignedInEvent());
  }
}
