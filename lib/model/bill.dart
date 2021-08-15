import 'package:coffeehome/model/order.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bill.g.dart';

@JsonSerializable()
class Bill {
  late BigInt id;
  late double amount;
  late Order order;

  Bill(this.id, this.amount, this.order,);

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
  Map<String, dynamic> toJson() => _$BillToJson(this);
}