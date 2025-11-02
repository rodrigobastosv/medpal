class SignInState {
  SignInState({required this.email, required this.password});

  factory SignInState.initial() => SignInState(email: '', password: '');

  final String email;
  final String password;

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  SignInState copyWith({String? email, String? password}) => SignInState(email: email ?? this.email, password: password ?? this.password);
}
