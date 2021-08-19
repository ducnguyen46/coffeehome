import 'package:coffeehome/model/bill.dart';
import 'package:coffeehome/ui/order/widget/bill_card.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key, required this.bills}) : super(key: key);

  final List<Bill> bills;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      itemCount: 10,
      itemBuilder: (context, index) => BillCard(
        bill: bills.elementAt(index),
      ),
    );
  }
}
