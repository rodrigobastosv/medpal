import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:medpal/core/services/camera/camera_service.dart';
import 'package:medpal/features/auth/domain/errors/sign_up_error.dart';
import 'package:medpal/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_presentation_events.dart';
import 'package:medpal/features/auth/presentation/sign_up/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> with BlocPresentationMixin<SignUpState, SignUpPresentationEvent> {
  SignUpCubit({required CameraService cameraService, required SignUpUseCase signUpUseCase})
    : _cameraService = cameraService,
      _signUpUseCase = signUpUseCase,
      super(SignUpState.initial());

  final CameraService _cameraService;
  final SignUpUseCase _signUpUseCase;

  void changeName(String? name) => emit(state.copyWith(name: name));

  void changeLastName(String? lastName) => emit(state.copyWith(lastName: lastName));

  void changeEmail(String? email) => emit(state.copyWith(email: email));

  void changePassword(String? password) => emit(state.copyWith(password: password));

  void changePasswordConfirmation(String? passwordConfirmation) => emit(state.copyWith(passwordConfirmation: passwordConfirmation));

  Future<void> getProfilePhoto() async {
    final imageFile = await _cameraService.takePicture();
    if (imageFile != null) {
      emit(state.copyWith(profilePhoto: imageFile));
    }
  }

  Future<void> signUp() async {
    emitPresentation(ShowLoadingEvent());
    final signUpResult = await _signUpUseCase(
      profilePhoto: state.profilePhoto,
      name: state.name,
      lastName: state.lastName,
      email: state.email,
      password: state.password,
    );
    emitPresentation(HideLoadingEvent());

    signUpResult.when(
      (error) => emitPresentation(switch (error) {
        EmailAlreadyInUseSignUpError() => EmailAlreadyInUseSignUpErrorEvent(),
        InvalidEmailSignUpError() => InvalidEmailSignUpErrorEvent(),
        WeakPasswordSignUpError() => WeakPasswordSignUpErrorEvent(),
        UnknownSignUpError() => UnknownSignUpErrorEvent(),
      }),
      (_) => emitPresentation(UserSignedUpEvent()),
    );
  }
}
