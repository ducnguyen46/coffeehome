import 'dart:convert';
import 'dart:io';

import 'package:coffeehome/constant/api_path.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/core/storage_key.dart';
import 'package:coffeehome/ui/animation/wave_coffee.dart';
import 'package:coffeehome/ui/authenticate/provider/user_provider.dart';
import 'package:coffeehome/ui/authenticate/view/signin_screen.dart';
import 'package:coffeehome/ui/home/provider/product_provider.dart';
import 'package:coffeehome/ui/home/view/home_screen.dart';
import 'package:coffeehome/ui/welcome/view/bottom_navbar.dart';
import 'package:coffeehome/ui/welcome/view/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: autoLogin(context),
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasError) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container(
                  width: 100,
                  height: 100,
                  child: Center(child: CoffeeAnimation()));
            default:
              return snapshot.data!
                  ? MyBottomNavigation()
                  : WelcomeView(
                      size: size,
                    );
          }
        }
        return ErrorScreen();
      },
    );
  }

  // a little controller
  Future<bool> autoLogin(BuildContext context) async {
    Map<String, dynamic> loginData =
        await UserStorageInfo().getUsernamePassword();
    final response = await http.post(Uri.parse(Api.login),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        },
        body: jsonEncode(loginData));

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      final keyStorage = UserStorageInfo();
      await keyStorage.saveToken(responseJson["data"]);

      await Provider.of<UserProvider>(context, listen: false).getUserInfo();
      await Provider.of<ProductProvider>(context, listen: false).fetchProduct();
      return true;
    }
    return false;
  }
}

class WelcomeView extends StatelessWidget {
  const WelcomeView({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: SvgPicture.asset(
                      "${pathToImages}coffee_machine2.svg",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      right: 18,
                      top: 60,
                    ),
                    child: Text(
                      "Making your days with our coffee.",
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "The best grain, the finest roast, the most powerful flavor.",
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // Continue button
            Positioned(
              bottom: 50,
              right: 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SignInScreen(),
                    ),
                  );
                },
                child: Container(
                  width: size.width / 6,
                  height: size.width / 6,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "${pathToIcons}ic_arrow_right.svg",
                      height: 32,
                      width: 32,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
