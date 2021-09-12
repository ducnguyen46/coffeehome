import 'package:coffeehome/model/shipment.dart';
import 'package:coffeehome/model/user.dart';
import 'package:coffeehome/model/voucher.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

class Order {
  int? id;
  late List<Item> items;
  late String orderDate;
  late Shipment shipment;
  Voucher? voucher;
  late User user;

  Order({
    this.id,
    required this.items,
    required this.orderDate,
    required this.shipment,
    this.voucher,
    required this.user,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['id'] as int,
        items: (json['items'] as List<dynamic>)
            .map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        orderDate: json['orderDate'] as String,
        shipment: Shipment.fromJson(json['shipment'] as Map<String, dynamic>),
        voucher: json['voucher'] == null
            ? null
            : Voucher.fromJson(json['voucher'] as Map<String, dynamic>),
        user: User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id.toString(),
        'items': items,
        'orderDate': orderDate,
        'shipment': shipment,
        'voucher': voucher,
        'user': user,
      };
}
