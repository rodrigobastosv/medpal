import 'package:medpal/features/auth/domain/entities/user.dart';

class HomeState {
  HomeState({required this.user});

  factory HomeState.initial({required AuthenticatedUser user}) => HomeState(user: user);

  final AuthenticatedUser user;
}
