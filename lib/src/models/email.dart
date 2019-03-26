import 'package:json_annotation/json_annotation.dart';

part 'email.g.dart';

@JsonSerializable()
class Email {
  final String message;
  final String title;

  Email({this.message, this.title});

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);

  Map<String, dynamic> toJson() => _$EmailToJson(this);

  @override
  String toString() {
    return 'Email{message: $message, title: $title}';
  }
}
