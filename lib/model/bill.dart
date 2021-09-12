import 'package:coffeehome/model/order.dart';

class Bill {
  late int id;
  late double amount;
  late Order order;

  Bill({
    required this.id,
    required this.amount,
    required this.order,
  });

  factory Bill.fromJson(Map<String, dynamic> json) => Bill(
        id: json['id'] as int,
        amount: (json['amount'] as num).toDouble(),
        order: Order.fromJson(json['order'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id.toString(),
        'amount': amount,
        'order': order,
      };
}
