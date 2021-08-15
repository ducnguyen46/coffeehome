// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      BigInt.parse(json['id'] as String),
      (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['orderDate'] as String,
      Shipment.fromJson(json['shipment'] as Map<String, dynamic>),
      json['voucher'] == null
          ? null
          : Voucher.fromJson(json['voucher'] as Map<String, dynamic>),
      User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id.toString(),
      'items': instance.items,
      'orderDate': instance.orderDate,
      'shipment': instance.shipment,
      'voucher': instance.voucher,
      'user': instance.user,
    };
