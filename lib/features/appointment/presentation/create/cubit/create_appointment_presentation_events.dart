sealed class CreateAppointmentPresentationEvent {}

class ShowLoadingEvent extends CreateAppointmentPresentationEvent {}

class HideLoadingEvent extends CreateAppointmentPresentationEvent {}

class ErrorEvent extends CreateAppointmentPresentationEvent {
  ErrorEvent({required this.errorMessage});

  final String errorMessage;
}

class AppointmentCreatedEvent extends CreateAppointmentPresentationEvent {}
