// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Voucher _$VoucherFromJson(Map<String, dynamic> json) => Voucher(
      BigInt.parse(json['id'] as String),
      json['code'] as String,
      json['description'] as String,
      json['name'] as String,
      (json['value'] as num).toDouble(),
      json['startDate'] as String,
      json['expiryDate'] as String,
    );

Map<String, dynamic> _$VoucherToJson(Voucher instance) => <String, dynamic>{
      'id': instance.id.toString(),
      'code': instance.code,
      'description': instance.description,
      'name': instance.name,
      'value': instance.value,
      'startDate': instance.startDate,
      'expiryDate': instance.expiryDate,
    };
