import 'package:medpal/features/auth/domain/entities/user.dart';

class HomeState {
  HomeState({required this.user});

  factory HomeState.initial({required User user}) => HomeState(user: user);

  final User user;
}
