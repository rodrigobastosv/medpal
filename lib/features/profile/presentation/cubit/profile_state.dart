import 'package:medpal/features/auth/domain/entities/user.dart';

class ProfileState {
  ProfileState({required this.user});

  factory ProfileState.initial({required AuthenticatedUser user}) => ProfileState(user: user);

  final AuthenticatedUser user;
}
