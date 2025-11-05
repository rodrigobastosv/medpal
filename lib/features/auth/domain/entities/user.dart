import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

sealed class User {
  bool get isAuthenticated => this is AuthenticatedUser;

  bool get isGuest => this is GuestUser;
}

class GuestUser extends User {}

@JsonSerializable()
class AuthenticatedUser extends User {
  AuthenticatedUser({required this.profilePhotoUrl, required this.userId, required this.name, required this.lastName, required this.email});

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) => _$AuthenticatedUserFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticatedUserToJson(this);

  final String? profilePhotoUrl;
  final String userId;
  final String name;
  final String lastName;
  final String email;
}
