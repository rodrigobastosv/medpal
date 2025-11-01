import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/features/auth/domain/errors/auth_error.dart';
import 'package:medpal/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_presentation_events.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> with BlocPresentationMixin<SignUpState, SignUpPresentationEvent> {
  SignUpCubit({required SignUpUseCase signUpUseCase}) : _signUpUseCase = signUpUseCase, super(SignUpState.initial());

  final SignUpUseCase _signUpUseCase;

  void changeName(String? name) => emit(state.copyWith(name: name));

  void changeLastName(String? lastName) => emit(state.copyWith(lastName: lastName));

  void changeEmail(String? email) => emit(state.copyWith(email: email));

  void changePassword(String? password) => emit(state.copyWith(password: password));

  void changePasswordConfirmation(String? passwordConfirmation) => emit(state.copyWith(passwordConfirmation: passwordConfirmation));

  Future<void> signUp() async {
    emitPresentation(ShowLoadingEvent());
    final signUpResult = await _signUpUseCase(name: state.name, lastName: state.lastName, email: state.email, password: state.password);
    emitPresentation(HideLoadingEvent());

    signUpResult.when((error) {
      emitPresentation(switch (error) {
        EmailAlreadyInUseAuthError() => EmailAlreadyInUseSignUpErrorEvent(),
        InvalidEmailAuthError() => InvalidEmailSignUpErrorEvent(),
        WeakPasswordAuthError() => WeakPasswordSignUpErrorEvent(),
        UnknownAuthError() => UnknownSignUpErrorEvent(),
      });
    }, (_) => emitPresentation(UserSignedUpEvent()));
  }
}
