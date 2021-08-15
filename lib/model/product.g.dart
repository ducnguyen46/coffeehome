// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as int,
      json['name'] as String,
      (json['price'] as num).toDouble(),
      json['image'] as String,
      Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id.toString(),
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'category': instance.category,
    };
