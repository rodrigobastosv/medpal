import 'package:medpal/features/appointment/domain/entities/appointment.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/patient/domain/entities/patient.dart';

class HomeState {
  HomeState({required this.user, required this.patients, required this.appointments});

  factory HomeState.initial({required AuthenticatedUser user}) => HomeState(user: user, patients: [], appointments: []);

  final AuthenticatedUser user;
  final List<Patient> patients;
  final List<Appointment> appointments;

  HomeState copyWith({AuthenticatedUser? user, List<Patient>? patients, List<Appointment>? appointments}) =>
      HomeState(user: user ?? this.user, patients: patients ?? this.patients, appointments: appointments ?? this.appointments);
}
