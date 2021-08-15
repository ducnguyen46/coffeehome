import 'package:coffeehome/model/item.dart';
import 'package:coffeehome/model/product.dart';
import 'package:coffeehome/ui/cart/provider/cart_provider.dart';
import 'package:coffeehome/ui/item_detail/provider/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({
    Key? key,
    required double amount,
    required this.itemProvider,
  })  : _amount = amount,
        super(key: key);

  final double _amount;
  final ItemProvider? itemProvider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      width: size.width,
      height: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD3E4EE),
            offset: Offset(-4, 0),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                "${NumberFormat.simpleCurrency(locale: 'vi_VN').format(_amount)}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // WidgetsBinding.instance!.addPostFrameCallback((_) {

              // });
              if (itemProvider != null) {
                Product product = itemProvider!.product!;
                double priceIn = itemProvider!.priceIn!;
                int quantity = itemProvider!.quantity;
                String type = itemProvider!.type.toString().split(".").last;
                String size = itemProvider!.size.toString().split(".").last;
                String ice = itemProvider!.ice.toString().split(".").last;
                String sugar = itemProvider!.sugar.toString().split(".").last;

                Item item = Item(
                    id: 0,
                    product: product,
                    priceIn: priceIn,
                    quantity: quantity,
                    type: type,
                    size: size,
                    ice: ice,
                    sugar: sugar);
                context.read<CartProvider>().setAddItem(item);
                Navigator.pop(context, true);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  "Select item",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
