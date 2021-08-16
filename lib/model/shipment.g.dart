// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shipment _$ShipmentFromJson(Map<String, dynamic> json) => Shipment(
      id: json['id'] as int,
      deliveryInfo:
          DeliveryInfo.fromJson(json['deliveryInfo'] as Map<String, dynamic>),
      isCompleted: json['isCompleted'] as bool,
      shipperId: json['shipperId'] as String,
      shipperName: json['shipperName'] as String,
      shipperPhone: json['shipperPhone'] as String,
    );

Map<String, dynamic> _$ShipmentToJson(Shipment instance) => <String, dynamic>{
      'id': instance.id,
      'deliveryInfo': instance.deliveryInfo,
      'isCompleted': instance.isCompleted,
      'shipperId': instance.shipperId,
      'shipperName': instance.shipperName,
      'shipperPhone': instance.shipperPhone,
    };
