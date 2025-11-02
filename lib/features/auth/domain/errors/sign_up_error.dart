import 'package:medpal/features/auth/domain/errors/auth_error.dart';

sealed class SignUpError extends AuthError {}

class EmailAlreadyInUseSignUpError extends SignUpError {}

class InvalidEmailSignUpError extends SignUpError {}

class WeakPasswordSignUpError extends SignUpError {}

class UnknownSignUpError extends SignUpError {}
