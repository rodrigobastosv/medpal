// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticatedUser _$AuthenticatedUserFromJson(Map json) => AuthenticatedUser(
  profilePhotoUrl: json['profilePhotoUrl'] as String?,
  userId: json['userId'] as String,
  name: json['name'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$AuthenticatedUserToJson(AuthenticatedUser instance) =>
    <String, dynamic>{
      'profilePhotoUrl': instance.profilePhotoUrl,
      'userId': instance.userId,
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
    };
