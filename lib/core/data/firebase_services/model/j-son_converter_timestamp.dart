import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimestampConverter implements JsonConverter<Timestamp, dynamic> {
  const TimestampConverter();

  @override
  Timestamp fromJson(dynamic json) {
    return (json as Timestamp);
  }

  @override
  dynamic toJson(Timestamp object) {
    return object;
  }
}
