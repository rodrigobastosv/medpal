import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/features/auth/domain/errors/auth_error.dart';
import 'package:medpal/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_presentation_events.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> with BlocPresentationMixin<SignUpState, SignUpPresentationEvent> {
  SignUpCubit({required SignUpUseCase signUpUseCase}) : _signUpUseCase = signUpUseCase, super(SignUpState.initial());

  final SignUpUseCase _signUpUseCase;

  void changeEmail(String? email) => emit(state.copyWith(email: email));

  void changePassword(String? password) => emit(state.copyWith(password: password));

  Future<void> signUp() async {
    final signUpResult = await _signUpUseCase(email: state.email, password: state.password);
    signUpResult.when(
      (error) {
        emitPresentation(switch (error) {
          EmailAlreadyInUseAuthError() => EmailAlreadyInUseSignUpError(),
          InvalidEmailAuthError() => InvalidEmailSignUpError(),
          WeakPasswordAuthError() => WeakPasswordSignUpError(),
          UnknownAuthError() => UnknownSignUpError(),
        });
      },
      (_) {
        emitPresentation(UserSignedUpEvent());
      },
    );
  }
}
