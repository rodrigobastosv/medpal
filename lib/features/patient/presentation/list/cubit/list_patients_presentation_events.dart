sealed class ListPatientsPresentationEvent {}

class ShowLoadingEvent extends ListPatientsPresentationEvent {}

class HideLoadingEvent extends ListPatientsPresentationEvent {}

class ErrorEvent extends ListPatientsPresentationEvent {
  ErrorEvent({required this.errorMessage});

  final String errorMessage;
}
