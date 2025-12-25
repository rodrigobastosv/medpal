import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';

class HomeState {
  HomeState({required this.user, required this.patients});

  factory HomeState.initial({required AuthenticatedUser user}) => HomeState(user: user, patients: []);

  final AuthenticatedUser user;
  final List<Patient> patients;

  HomeState copyWith({AuthenticatedUser? user, List<Patient>? patients}) =>
      HomeState(user: user ?? this.user, patients: patients ?? this.patients);
}
