import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/ui/home/view/home_screen.dart';
import 'package:coffeehome/ui/order/view/order_screen.dart';
import 'package:coffeehome/ui/reward/view/reward_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  PersistentTabController? _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
      items: _navbarItems,
      screens: [
        HomeScreen(),
        RewardScreen(),
        OrderScreen(),
      ],
    );
  }

  List<PersistentBottomNavBarItem> _navbarItems = [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        pathToIcons + "ic_home.svg",
        color: bluewood,
      ),
      title: "Home",
      activeColorPrimary: bluewood,
      inactiveColorPrimary: whitegray,
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        pathToIcons + "ic_rewards.svg",
        color: lightgreen,
      ),
      title: "Rewards",
      activeColorPrimary: lightgreen,
      inactiveColorPrimary: whitegray,
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        pathToIcons + "ic_bill.svg",
        color: bloodred,
      ),
      title: "Orders",
      activeColorPrimary: bloodred,
      inactiveColorPrimary: whitegray,
    ),
  ];
}
