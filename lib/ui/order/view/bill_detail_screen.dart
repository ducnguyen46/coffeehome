import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/model/bill.dart';
import 'package:coffeehome/ui/a_widget_reduce/appbar_back.dart';
import 'package:coffeehome/ui/a_widget_reduce/toast.dart';
import 'package:coffeehome/ui/cart/widget/item_card.dart';
import 'package:coffeehome/ui/delivery_info/widget/address_card.dart';
import 'package:coffeehome/ui/order/provider/bill_order_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class BillDetailScreen extends StatelessWidget {
  const BillDetailScreen({Key? key, required this.bill}) : super(key: key);

  final Bill bill;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarBack(
        safeAreaTop: MediaQuery.of(context).padding.top,
        title: "Bill detail",
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    color: lightgreen.withOpacity(0.7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Thanks for chosing us!",
                          style: Theme.of(context).textTheme.button,
                        ),
                        SvgPicture.asset(
                          pathToImages + "thank-you.svg",
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(top: 25, bottom: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Delivery Infomation",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: AddressCard(
                        deliveryInfo: bill.order.shipment.deliveryInfo),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Items in order",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ItemCard(
                        item: bill.order.items[index],
                      ),
                    ),
                    childCount: bill.order.items.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total amount:",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          "${NumberFormat.simpleCurrency(locale: "vi_VN").format(bill.amount)}",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (bill.order.shipment.isCompleted == false) {
                final checkReceived =
                    await context.read<BillOrderProvider>().receivedOrder(bill);

                FToast fToast = FToast();
                fToast.init(context);
                if (checkReceived) {
                  fToast.showToast(
                      gravity: ToastGravity.BOTTOM,
                      toastDuration: Duration(seconds: 2),
                      child: ToastView(
                        content: "Thanks for chosing!",
                        success: true,
                      ));
                } else {
                  fToast.showToast(
                      gravity: ToastGravity.BOTTOM,
                      toastDuration: Duration(seconds: 2),
                      child: ToastView(
                        content: "Fail! Please try again later.",
                        success: false,
                      ));
                }
                Navigator.pop(context);
              }
            },
            child: Center(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
                padding: const EdgeInsets.all(10),
                width: size.width,
                decoration: BoxDecoration(
                  color: bill.order.shipment.isCompleted
                      ? lightgreen.withOpacity(0.5)
                      : lightgreen,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  "Received",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
