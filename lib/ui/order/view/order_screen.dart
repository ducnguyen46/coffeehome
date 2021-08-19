import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/model/bill.dart';
import 'package:coffeehome/ui/a_widget_reduce/appbar_center_title.dart';
import 'package:coffeehome/ui/animation/wave_coffee.dart';
import 'package:coffeehome/ui/order/provider/bill_order_provider.dart';
import 'package:coffeehome/ui/order/view/order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Bill>? billOnGoing;
  List<Bill>? billComplete;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await context.read<BillOrderProvider>().getOrderOnGoing();
      await context.read<BillOrderProvider>().getOrderComplete();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    billOnGoing = context.watch<BillOrderProvider>().billOnGoing;
    billComplete = context.watch<BillOrderProvider>().billComplete;

    return Scaffold(
      appBar: AppBarCenterTitle(
          safeAreaTop: MediaQuery.of(context).padding.top, title: "Order"),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: blacknavy,
            unselectedLabelColor: blacknavy.withOpacity(0.7),
            labelStyle: Theme.of(context).textTheme.subtitle1,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: blacknavy,
            // isScrollable: true,
            tabs: [
              Tab(
                text: "On going",
              ),
              Tab(
                text: "History",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                billOnGoing!.isNotEmpty
                    ? OrderView(key: GlobalKey(), bills: billOnGoing!)
                    : Center(
                        child: Text("No thing here",
                            style: Theme.of(context).textTheme.caption),
                      ),
                billComplete!.isNotEmpty
                    ? OrderView(key: GlobalKey(), bills: billComplete!)
                    : Center(
                        child: Text("No thing here",
                            style: Theme.of(context).textTheme.caption),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
