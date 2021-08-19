import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/model/bill.dart';
import 'package:coffeehome/model/item.dart';
import 'package:coffeehome/model/order.dart';
import 'package:coffeehome/ui/order/view/bill_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class BillCard extends StatelessWidget {
  const BillCard({Key? key, required this.bill}) : super(key: key);

  final Bill bill;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BillDetailScreen(
              bill: bill,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 15,
          bottom: 8,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${DateFormat("d MMMM y").format(
                    DateTime.parse(bill.order.orderDate),
                  )} |",
                  style: TextStyle(
                    color: whitegray.withOpacity(0.7),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${NumberFormat.simpleCurrency(locale: "vi_VN").format(bill.amount)}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SvgPicture.asset(
                    pathToIcons + "ic_coffeecup.svg",
                  ),
                ),
                Expanded(
                  child: Text(
                    _itemsInOrder(bill.order),
                    style: TextStyle(
                        color: blacknavy,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SvgPicture.asset(
                    pathToIcons + "ic_pin.svg",
                  ),
                ),
                Expanded(
                  child: Text(
                    bill.order.shipment.deliveryInfo.address,
                    style: TextStyle(
                        color: blacknavy,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  String _itemsInOrder(Order order) {
    String items = "";
    for (Item item in order.items) {
      items += "${item.product.name}, ";
    }
    return items;
  }
}
