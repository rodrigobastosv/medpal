sealed class ProfilePresentationEvent {}

class ShowLoadingEvent extends ProfilePresentationEvent {}

class HideLoadingEvent extends ProfilePresentationEvent {}

class ErrorEvent extends ProfilePresentationEvent {
  ErrorEvent({required this.errorMessage});

  final String errorMessage;
}

class UserSignedOutEvent extends ProfilePresentationEvent {}
