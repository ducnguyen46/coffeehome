import 'package:coffeehome/model/item.dart';
import 'package:json_annotation/json_annotation.dart';

class OrderDto {
  late List<Item> items;
  late int voucherId;
  late int deliveryId;

  OrderDto({
    required this.items,
    required this.voucherId,
    required this.deliveryId,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) => OrderDto(
        items: (json['items'] as List<dynamic>)
            .map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        voucherId: json['voucherId'] as int,
        deliveryId: json['deliveryId'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'items': items,
        'voucherId': voucherId,
        'deliveryId': deliveryId,
      };
}
