// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryInfo _$DeliveryInfoFromJson(Map<String, dynamic> json) => DeliveryInfo(
      BigInt.parse(json['id'] as String),
      json['receiver'] as String,
      json['phoneNumber'] as String,
      json['address'] as String,
      json['note'] as String,
      json['isDefault'] as bool,
    );

Map<String, dynamic> _$DeliveryInfoToJson(DeliveryInfo instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'receiver': instance.receiver,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'note': instance.note,
      'isDefault': instance.isDefault,
    };
