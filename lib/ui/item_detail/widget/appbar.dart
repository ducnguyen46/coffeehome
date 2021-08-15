import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/ui/cart/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarDetail extends StatelessWidget with PreferredSizeWidget {
  AppBarDetail({Key? key, this.safeAreaTop}) : super(key: key);

  final double? safeAreaTop;

  @override
  Size get preferredSize {
    if (safeAreaTop == null) return Size.fromHeight(kToolbarHeight);
    return Size.fromHeight(kToolbarHeight + safeAreaTop!);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      height:
          safeAreaTop == null ? kToolbarHeight : kToolbarHeight + safeAreaTop!,
      width: size.width,
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                pathToIcons + "ic_arrow_left.svg",
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
                child: Center(
              child:
                  Text("Detail", style: Theme.of(context).textTheme.subtitle1),
            )),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartScreen()));
              },
              child: Container(
                child: SvgPicture.asset(pathToIcons + "ic_cart.svg"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
