class SignUpState {
  SignUpState({required this.email, required this.password});

  factory SignUpState.initial() => SignUpState(email: '', password: '');

  final String email;
  final String password;

  SignUpState copyWith({String? email, String? password}) => SignUpState(email: email ?? this.email, password: password ?? this.password);
}
