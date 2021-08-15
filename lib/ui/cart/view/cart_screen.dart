import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/model/item.dart';
import 'package:coffeehome/ui/a_widget_reduce/appbar_back.dart';
import 'package:coffeehome/ui/a_widget_reduce/toast.dart';
import 'package:coffeehome/ui/cart/provider/cart_provider.dart';
import 'package:coffeehome/ui/cart/widget/item_card.dart';
import 'package:coffeehome/ui/delivery_info/view/delivery_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    items = context.watch<CartProvider>().items;
    return Scaffold(
      appBar: AppBarBack(
        safeAreaTop: MediaQuery.of(context).padding.top,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 8, bottom: 10),
              child: Text(
                "My cart",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Expanded(
                child: items.isNotEmpty
                    ? ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) => Slidable(
                          endActionPane: ActionPane(
                            extentRatio: 0.2,
                            motion: ScrollMotion(),
                            children: [
                              CustomSlidableAction(
                                backgroundColor: Colors.transparent,
                                onPressed: (context) {
                                  context
                                      .read<CartProvider>()
                                      .removeItem(index);
                                },
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: bloodred.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                        pathToIcons + "ic_bin.svg"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          child: ItemCard(item: items[index]),
                        ),
                      )
                    : Container(
                        child: Center(
                          child:
                              SvgPicture.asset(pathToImages + "empty_box.svg"),
                        ),
                      )),
            Container(
              height: 100,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total price",
                          style: TextStyle(
                            color: whitegray,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${NumberFormat.simpleCurrency(locale: 'vi_VN').format(context.read<CartProvider>().totalPrice)}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      items.isNotEmpty
                          ? _showBottomSheet(context, size)
                          : _showToast(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SvgPicture.asset(
                              pathToIcons + "ic_cart.svg",
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          Text(
                            "Check out",
                            style: Theme.of(context).textTheme.button,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: size.width,
        height: size.height * 0.7,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(vertical: 35),
              width: size.width,
              child: Text("Order Confirmation",
                  style: Theme.of(context).textTheme.headline6),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Delivery",
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: lightblue,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(pathToIcons + "ic_delivery.svg"),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Anderson",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text("+84961465453",
                            style: Theme.of(context).textTheme.caption),
                        Text(
                          "Nguyen Van Troi, Mo Lao, Ha Dong, Ha Noi",
                          style: Theme.of(context).textTheme.caption,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeliveryInfoScreen(),
                          ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(left: 20),
                      child: SvgPicture.asset(pathToIcons + "ic_more.svg"),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 100,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total price",
                          style: TextStyle(
                            color: whitegray,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${NumberFormat.simpleCurrency(locale: 'vi_VN').format(context.read<CartProvider>().totalPrice)}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SvgPicture.asset(
                              pathToIcons + "ic_cart.svg",
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          Text(
                            "Order now",
                            style: Theme.of(context).textTheme.button,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    fToast.showToast(
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
        child: ToastView(content: "Nothing in cart", success: false));
  }
}
