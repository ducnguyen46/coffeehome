// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int?,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      priceIn: (json['priceIn'] as num).toDouble(),
      quantity: json['quantity'] as int,
      type: json['type'] as String,
      size: json['size'] as String,
      ice: json['ice'] as String,
      sugar: json['sugar'] as String,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'priceIn': instance.priceIn,
      'quantity': instance.quantity,
      'type': instance.type,
      'size': instance.size,
      'ice': instance.ice,
      'sugar': instance.sugar,
    };
