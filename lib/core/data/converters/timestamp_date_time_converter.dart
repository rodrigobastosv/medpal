import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampDateTimeConverter implements JsonConverter<DateTime, Object> {
  const TimestampDateTimeConverter();

  @override
  DateTime fromJson(Object json) {
    if (json is Timestamp) {
      return json.toDate();
    }

    return json as DateTime;
  }

  @override
  Object toJson(DateTime object) => Timestamp.fromDate(object);
}
