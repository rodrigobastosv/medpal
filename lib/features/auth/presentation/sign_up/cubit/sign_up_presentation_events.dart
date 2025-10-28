sealed class SignUpPresentationEvent {}

class UserSignedUpEvent extends SignUpPresentationEvent {}

class EmailAlreadyInUseSignUpError extends SignUpPresentationEvent {}

class InvalidEmailSignUpError extends SignUpPresentationEvent {}

class WeakPasswordSignUpError extends SignUpPresentationEvent {}

class UnknownSignUpError extends SignUpPresentationEvent {}
