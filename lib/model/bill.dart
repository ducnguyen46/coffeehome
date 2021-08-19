import 'package:coffeehome/model/order.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bill.g.dart';

@JsonSerializable()
class Bill {
  late int id;
  late double amount;
  late Order order;

  Bill({
    required this.id,
    required this.amount,
    required this.order,
  });

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
  Map<String, dynamic> toJson() => _$BillToJson(this);
}
