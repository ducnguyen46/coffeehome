// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shipment _$ShipmentFromJson(Map<String, dynamic> json) => Shipment(
      BigInt.parse(json['id'] as String),
      DeliveryInfo.fromJson(json['deliveryInfo'] as Map<String, dynamic>),
      json['isCompleted'] as bool,
      json['shipperId'] as String,
      json['shipperName'] as String,
      json['shipperPhone'] as String,
    );

Map<String, dynamic> _$ShipmentToJson(Shipment instance) => <String, dynamic>{
      'id': instance.id.toString(),
      'deliveryInfo': instance.deliveryInfo,
      'isCompleted': instance.isCompleted,
      'shipperId': instance.shipperId,
      'shipperName': instance.shipperName,
      'shipperPhone': instance.shipperPhone,
    };
