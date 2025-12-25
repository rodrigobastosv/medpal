import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/auth/domain/use_cases/get_user_use_case.dart';
import 'package:medpal/features/profile/domain/use_cases/sign_out_use_case.dart';
import 'package:medpal/features/profile/presentation/cubit/profile_presentation_events.dart';
import 'package:medpal/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> with BlocPresentationMixin<ProfileState, ProfilePresentationEvent> {
  ProfileCubit({required GetUserUseCase getUserUseCase, required SignOutUseCase signOutUseCase})
    : _signOutUseCase = signOutUseCase,
      super(ProfileState.initial(user: getUserUseCase() as AuthenticatedUser));

  final SignOutUseCase _signOutUseCase;

  Future<void> signOut() async {
    final signOutResult = await _signOutUseCase();
    signOutResult.when(
      (error) => emitPresentation(ErrorEvent(errorMessage: error.errorMessage)),
      (_) => emitPresentation(UserSignedOutEvent()),
    );
  }
}
