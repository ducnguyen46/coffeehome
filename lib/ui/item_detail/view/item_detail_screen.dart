import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/model/product.dart';
import 'package:coffeehome/ui/animation/wave_coffee.dart';
import 'package:coffeehome/ui/item_detail/provider/item_provider.dart';
import 'package:coffeehome/ui/item_detail/widget/appbar.dart';
import 'package:coffeehome/ui/item_detail/widget/ice_detail.dart';
import 'package:coffeehome/ui/item_detail/widget/quantity_detail.dart';
import 'package:coffeehome/ui/item_detail/widget/size_detail.dart';
import 'package:coffeehome/ui/item_detail/widget/sugar_detail.dart';
import 'package:coffeehome/ui/item_detail/widget/total_amount_detail.dart';
import 'package:coffeehome/ui/item_detail/widget/type_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  ItemProvider? _itemProvider;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _itemProvider = Provider.of<ItemProvider>(context, listen: false);
      _itemProvider?.init(widget.product);
      print("Init state");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    Size size = MediaQuery.of(context).size;
    double _amount = context.watch<ItemProvider>().amount;

    return Scaffold(
      appBar: AppBarDetail(safeAreaTop: MediaQuery.of(context).padding.top),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: size.width,
            height: size.height -
                (120 + kToolbarHeight + MediaQuery.of(context).padding.top),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 16),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: size.width,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    color: lightblue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${context.read<ItemProvider>().product?.image}",
                        errorWidget: (context, _, error) => Center(
                          child: CoffeeAnimation(),
                        ),
                        placeholder: (context, url) => Center(
                          child: CoffeeAnimation(),
                        ),
                      ),
                    ),
                  ),
                ),
                QuantityInDetail(itemProvider: _itemProvider),
                DividerHere,
                TypeInDetail(itemProvider: _itemProvider),
                //
                DividerHere,
                SizeInDetail(itemProvider: _itemProvider),
                //
                DividerHere,
                IceInDetail(itemProvider: _itemProvider),
                //
                DividerHere,
                SugarInDetail(itemProvider: _itemProvider),
              ],
            ),
          ),
          TotalAmount(itemProvider: _itemProvider, amount: _amount),
        ],
      ),
    );
  }

  static const Widget DividerHere = Divider(
    thickness: 2,
    color: Color(0xFFF4F5F7),
  );
}
