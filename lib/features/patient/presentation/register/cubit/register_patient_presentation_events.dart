sealed class RegisterPatientPresentationEvent {}

class ShowLoadingEvent extends RegisterPatientPresentationEvent {}

class HideLoadingEvent extends RegisterPatientPresentationEvent {}

class ErrorEvent extends RegisterPatientPresentationEvent {
  ErrorEvent({required this.errorMessage});

  final String errorMessage;
}

class PatientRegisteredEvent extends RegisterPatientPresentationEvent {}
