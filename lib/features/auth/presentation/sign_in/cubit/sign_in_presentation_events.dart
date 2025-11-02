sealed class SignInPresentationEvent {}

class ShowLoadingEvent extends SignInPresentationEvent {}

class HideLoadingEvent extends SignInPresentationEvent {}

class UserSignedInEvent extends SignInPresentationEvent {}

class InvalidEmailSignInErrorEvent extends SignInPresentationEvent {}

class UserDisabledSignInErrorEvent extends SignInPresentationEvent {}

class UserNotFoundSignInErrorEvent extends SignInPresentationEvent {}

class InvalidCredentialsSignInErrorEvent extends SignInPresentationEvent {}

class WrongPasswordSignInErrorEvent extends SignInPresentationEvent {}

class UnknownSignUpErrorEvent extends SignInPresentationEvent {}
