import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/ui/home/view/home_screen.dart';
import 'package:coffeehome/ui/order/view/order_screen.dart';
import 'package:coffeehome/ui/reward/view/reward_screen.dart';
import 'package:coffeehome/ui/welcome/provider/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BaseBottomNav extends StatefulWidget {
  const BaseBottomNav({Key? key}) : super(key: key);

  @override
  State<BaseBottomNav> createState() => _BaseBottomNavState();
}

class _BaseBottomNavState extends State<BaseBottomNav> {
  var _screen = [
    HomeScreen(),
    RewardScreen(),
    OrderScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[context.watch<BottomNavProvider>().currentPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          context.read<BottomNavProvider>().onTapBar(index);
        },
        currentIndex: context.watch<BottomNavProvider>().currentPage,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: SvgPicture.asset(
              pathToIcons + "ic_home.svg",
            ),
            activeIcon: SvgPicture.asset(
              pathToIcons + "ic_home.svg",
              color: blacknavy.withOpacity(0.7),
            ),
          ),
          BottomNavigationBarItem(
            label: "Rewards",
            icon: SvgPicture.asset(
              pathToIcons + "ic_rewards.svg",
            ),
            activeIcon: SvgPicture.asset(
              pathToIcons + "ic_rewards.svg",
              color: blacknavy.withOpacity(0.7),
            ),
          ),
          BottomNavigationBarItem(
            label: "Orders",
            icon: SvgPicture.asset(
              pathToIcons + "ic_bill.svg",
            ),
            activeIcon: SvgPicture.asset(
              pathToIcons + "ic_bill.svg",
              color: blacknavy.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
