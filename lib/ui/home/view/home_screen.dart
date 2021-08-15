import 'dart:math';

import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/model/product.dart';
import 'package:coffeehome/model/user.dart';
import 'package:coffeehome/ui/a_widget_reduce/toast.dart';
import 'package:coffeehome/ui/authenticate/provider/user_provider.dart';
import 'package:coffeehome/ui/cart/view/cart_screen.dart';
import 'package:coffeehome/ui/home/provider/product_provider.dart';
import 'package:coffeehome/ui/home/widget/product_card.dart';
import 'package:coffeehome/ui/home/widget/reward_card.dart';
import 'package:coffeehome/ui/item_detail/view/item_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product>? _products;
  User? _user;

  @override
  Widget build(BuildContext context) {
    _user = context.watch<UserProvider>().user;
    _products = context.watch<ProductProvider>().products;
    final _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: HomeSliverAppbar(
              user: _user!,
              minHeight: kToolbarHeight + _mediaQuery.padding.top,
              maxHeight: kToolbarHeight + _mediaQuery.padding.top + 150,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ItemDetailScreen(
                                  product: _products![index],
                                )));
                    if (result) {
                      FToast fToast = FToast();
                      fToast.init(context);
                      fToast.showToast(
                        gravity: ToastGravity.BOTTOM,
                        toastDuration: Duration(seconds: 2),
                        child: ToastView(
                            content: "Add item successful", success: true),
                      );
                    }
                  },
                  child: ProductCard(product: _products![index]),
                ),
                childCount: _products!.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeSliverAppbar extends SliverPersistentHeaderDelegate {
  late final double minHeight;
  late final double maxHeight;
  late User user;

  HomeSliverAppbar({
    required this.minHeight,
    required this.maxHeight,
    required this.user,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double percent = min(shrinkOffset / (maxExtent - minExtent), 1);
    print(percent);
    return Container(
        child: Column(
      children: [
        _appBar(context),
        _rewardCard(percent),
      ],
    ));
  }

  Widget _appBar(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: kToolbarHeight + mediaQuery.padding.top,
      width: size.width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hi, ",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    TextSpan(
                      text: "${user.fullName}",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CartScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(pathToIcons + "ic_cart.svg"),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(pathToIcons + "ic_person.svg"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _rewardCard(double percent) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: max((1 - percent), 0),
      child: FittedBox(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: RewardCard(
          user: user,
        ),
      )),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
