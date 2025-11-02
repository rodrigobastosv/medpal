import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/features/auth/domain/errors/sign_in_error.dart';
import 'package:medpal/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:medpal/features/auth/presentation/sign_in/cubit/sign_in_presentation_events.dart';
import 'package:medpal/features/auth/presentation/sign_in/cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> with BlocPresentationMixin<SignInState, SignInPresentationEvent> {
  SignInCubit({required SignInUseCase signInUseCase}) : _signInUseCase = signInUseCase, super(SignInState.initial());

  final SignInUseCase _signInUseCase;

  void changeEmail(String? email) => emit(state.copyWith(email: email));

  void changePassword(String? password) => emit(state.copyWith(password: password));

  Future<void> signIn() async {
    emitPresentation(ShowLoadingEvent());
    final signInResult = await _signInUseCase(email: state.email, password: state.password);
    emitPresentation(HideLoadingEvent());

    signInResult.when(
      (error) => emitPresentation(switch (error) {
        InvalidEmailSignInError() => InvalidEmailSignInErrorEvent(),
        UserDisabledSignInError() => InvalidEmailSignInErrorEvent(),
        UserNotFoundSignInError() => InvalidEmailSignInErrorEvent(),
        InvalidCredentialsSignInError() => InvalidEmailSignInErrorEvent(),
        WrongPasswordSignInError() => InvalidEmailSignInErrorEvent(),
        UnknownSignInError() => InvalidEmailSignInErrorEvent(),
      }),
      (user) => emitPresentation(UserSignedInEvent()),
    );
  }
}
