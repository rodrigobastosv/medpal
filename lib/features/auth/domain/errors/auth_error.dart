import 'package:medpal/core/error/mp_error.dart';

sealed class AuthError extends MPError {
  AuthError() : super(errorMessage: '');
}

class EmailAlreadyInUseAuthError extends AuthError {}

class InvalidEmailAuthError extends AuthError {}

class WeakPasswordAuthError extends AuthError {}

class UnknownAuthError extends AuthError {}
