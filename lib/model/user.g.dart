// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User.all(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      reward: json['reward'] as String,
      point: json['point'] as int,
      isActived: json['isActived'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'dateOfBirth': instance.dateOfBirth,
      'email': instance.email,
      'username': instance.username,
      'reward': instance.reward,
      'point': instance.point,
      'isActived': instance.isActived,
    };
