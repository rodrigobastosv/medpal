import 'package:flutter/foundation.dart';

class SignUpState {
  SignUpState({
    required this.profilePhoto,
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  factory SignUpState.initial() =>
      SignUpState(profilePhoto: null, name: '', lastName: '', email: '', password: '', passwordConfirmation: '');

  final Uint8List? profilePhoto;
  final String name;
  final String lastName;
  final String email;
  final String password;
  final String passwordConfirmation;

  bool get isFormValid =>
      name.isNotEmpty &&
      lastName.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      passwordConfirmation.isNotEmpty &&
      password == passwordConfirmation;

  SignUpState copyWith({
    Uint8List? profilePhoto,
    String? name,
    String? lastName,
    String? email,
    String? password,
    String? passwordConfirmation,
  }) => SignUpState(
    profilePhoto: profilePhoto ?? this.profilePhoto,
    name: name ?? this.name,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    password: password ?? this.password,
    passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
  );
}
