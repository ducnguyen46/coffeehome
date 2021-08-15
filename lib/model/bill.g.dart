// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      BigInt.parse(json['id'] as String),
      (json['amount'] as num).toDouble(),
      Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'id': instance.id.toString(),
      'amount': instance.amount,
      'order': instance.order,
    };
