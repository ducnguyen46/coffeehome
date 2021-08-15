import 'package:coffeehome/config/themes/theme.dart';
import 'package:coffeehome/ui/authenticate/provider/auth_provider.dart';
import 'package:coffeehome/ui/authenticate/provider/signin_validate.dart';
import 'package:coffeehome/ui/authenticate/provider/user_provider.dart';
import 'package:coffeehome/ui/cart/provider/cart_provider.dart';
import 'package:coffeehome/ui/home/provider/product_provider.dart';
import 'package:coffeehome/ui/item_detail/provider/item_provider.dart';
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        home: WelcomeScreen(),
      ),
    );
  }
}
