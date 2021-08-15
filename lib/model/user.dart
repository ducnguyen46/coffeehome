import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  late String fullName;
  late String dateOfBirth;
  late String email;
  late String username;
  late String reward;
  late int point;
  late bool isActived;

  User.init();

  User.all({
    this.id,
    required this.fullName,
    required this.dateOfBirth,
    required this.email,
    required this.username,
    required this.reward,
    required this.point,
    required this.isActived,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
