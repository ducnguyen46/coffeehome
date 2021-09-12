import 'package:coffeehome/config/themes/theme.dart';
import 'package:coffeehome/ui/authenticate/provider/auth_provider.dart';
import 'package:coffeehome/ui/authenticate/provider/signin_validate.dart';
import 'package:coffeehome/ui/authenticate/provider/user_provider.dart';
import 'package:coffeehome/ui/cart/provider/cart_provider.dart';
import 'package:coffeehome/ui/delivery_info/provider/delivery_provider.dart';
import 'package:coffeehome/ui/home/provider/product_provider.dart';
import 'package:coffeehome/ui/item_detail/provider/item_provider.dart';
import 'package:coffeehome/ui/order/provider/bill_order_provider.dart';
import 'package:coffeehome/ui/profile/provider/change_password_provider.dart';
import 'package:coffeehome/ui/reward/provider/reward_provider.dart';
import 'package:coffeehome/ui/welcome/provider/bottom_nav_provider.dart';
import 'package:coffeehome/ui/welcome/view/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SignInValidate()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => DeliveryInfoProvider()),
        ChangeNotifierProvider(create: (_) => RewardProvider()),
        ChangeNotifierProvider(create: (_) => BillOrderProvider()),
        ChangeNotifierProvider(create: (_) => ChangePasswordProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: MaterialApp(
        theme: lightTheme,
        home: WelcomeScreen(),
      ),
    );
  }
}
