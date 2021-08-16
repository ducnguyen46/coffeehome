// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryInfo _$DeliveryInfoFromJson(Map<String, dynamic> json) => DeliveryInfo(
      id: json['id'] as int?,
      receiver: json['receiver'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      note: json['note'] as String,
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$DeliveryInfoToJson(DeliveryInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receiver': instance.receiver,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'note': instance.note,
      'isDefault': instance.isDefault,
    };
