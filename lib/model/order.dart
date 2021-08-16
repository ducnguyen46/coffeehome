import 'package:coffeehome/model/shipment.dart';
import 'package:coffeehome/model/user.dart';
import 'package:coffeehome/model/voucher.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'order.g.dart';

@JsonSerializable()
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

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
