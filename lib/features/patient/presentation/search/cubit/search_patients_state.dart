class SearchPatientsState {
  SearchPatientsState({required this.name});

  factory SearchPatientsState.initial() => SearchPatientsState(name: '');

  final String name;

  bool get isFormValid => name.isNotEmpty;

  SearchPatientsState copyWith({String? name}) => SearchPatientsState(name: name ?? this.name);
}
