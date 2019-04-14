import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  Contact(
      this.id, this.name, this.username, this.email, this.phone, this.website);

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, username: $username, email: $email, phone: $phone, website: $website}';
  }
}
