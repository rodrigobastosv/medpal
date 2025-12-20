class RegisterPatientState {
  RegisterPatientState({required this.name});

  factory RegisterPatientState.initial() => RegisterPatientState(name: '');

  final String name;

  bool get isFormValid => name.isNotEmpty;

  RegisterPatientState copyWith({String? name}) => RegisterPatientState(name: name ?? this.name);
}
