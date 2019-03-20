// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Email _$EmailFromJson(Map<String, dynamic> json) {
  return Email(
      message: json['message'] as String, title: json['title'] as String);
}

Map<String, dynamic> _$EmailToJson(Email instance) =>
    <String, dynamic>{'message': instance.message, 'title': instance.title};
