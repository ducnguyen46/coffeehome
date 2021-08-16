// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Voucher _$VoucherFromJson(Map<String, dynamic> json) => Voucher(
      id: json['id'] as int,
      code: json['code'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      value: (json['value'] as num).toDouble(),
      startDate: json['startDate'] as String,
      expiryDate: json['expiryDate'] as String,
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
