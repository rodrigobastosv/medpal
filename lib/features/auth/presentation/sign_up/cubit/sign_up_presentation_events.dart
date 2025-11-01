sealed class SignUpPresentationEvent {}

class ShowLoadingEvent extends SignUpPresentationEvent {}

class HideLoadingEvent extends SignUpPresentationEvent {}

class UserSignedUpEvent extends SignUpPresentationEvent {}

class EmailAlreadyInUseSignUpErrorEvent extends SignUpPresentationEvent {}

class InvalidEmailSignUpErrorEvent extends SignUpPresentationEvent {}

class WeakPasswordSignUpErrorEvent extends SignUpPresentationEvent {}

class UnknownSignUpErrorEvent extends SignUpPresentationEvent {}
