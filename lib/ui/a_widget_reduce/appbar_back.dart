import 'package:coffeehome/constant/app_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarBack extends StatelessWidget with PreferredSizeWidget {
  const AppBarBack({Key? key, this.safeAreaTop, this.title}) : super(key: key);

  final double? safeAreaTop;
  final String? title;

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
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  pathToIcons + "ic_arrow_left.svg",
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Center(
              child: Text(
                title ?? "",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
