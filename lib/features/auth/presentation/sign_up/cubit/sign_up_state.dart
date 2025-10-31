class SignUpState {
  SignUpState({
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  factory SignUpState.initial() => SignUpState(name: '', lastName: '', email: '', password: '', passwordConfirmation: '');

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

  SignUpState copyWith({String? name, String? lastName, String? email, String? password, String? passwordConfirmation}) => SignUpState(
    name: name ?? this.name,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    password: password ?? this.password,
    passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
  );
}
