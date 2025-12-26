// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map json) => Patient(
  id: json['id'] as String,
  name: json['name'] as String,
  dateOfBirth: const TimestampDateTimeConverter().fromJson(
    json['dateOfBirth'] as Object,
  ),
  phoneNumber: json['phoneNumber'] as String?,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  notes: json['notes'] as String,
);

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'dateOfBirth': const TimestampDateTimeConverter().toJson(
    instance.dateOfBirth,
  ),
  'phoneNumber': instance.phoneNumber,
  'gender': _$GenderEnumMap[instance.gender]!,
  'notes': instance.notes,
};

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};
