import 'package:medpal/features/auth/domain/errors/auth_error.dart';

sealed class SignInError extends AuthError {}

class InvalidEmailSignInError extends SignInError {}

class UserDisabledSignInError extends SignInError {}

class UserNotFoundSignInError extends SignInError {}

class InvalidCredentialsSignInError extends SignInError {}

class WrongPasswordSignInError extends SignInError {}

class UnknownSignInError extends SignInError {}
