import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/ui/animation/wave_coffee.dart';
import 'package:coffeehome/ui/authenticate/provider/auth_provider.dart';
import 'package:coffeehome/ui/authenticate/provider/user_provider.dart';
import 'package:coffeehome/ui/home/provider/product_provider.dart';
import 'package:coffeehome/ui/home/view/home_screen.dart';
import 'package:coffeehome/ui/welcome/view/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({
    Key? key,
    this.authProvider,
    required this.username,
    required this.password,
  }) : super(key: key);

  final AuthProvider? authProvider;
  final String username, password;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Status>(
      stream: authProvider!.login(context, username, password),
      initialData: Status.Authenticating,
      builder: (BuildContext context, AsyncSnapshot<Status> snapshot) {
        switch (snapshot.data) {
          case Status.Authenticating:
            return CoffeeAnimation();
          case Status.NotLoggedIn:
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: bloodred,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    pathToImages + "coffee_machine.svg",
                    height: 20,
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        Provider.of<AuthProvider>(context, listen: false).log ??
                            "",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        softWrap: true,
                      ),
                    ),
                  )
                ],
              ),
            );
          case Status.LoggedIn:
            WidgetsBinding.instance!.addPostFrameCallback((_) async {
              await Provider.of<UserProvider>(context, listen: false)
                  .getUserInfo();
              await Provider.of<ProductProvider>(context, listen: false)
                  .fetchProduct();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BaseBottomNav(),
                ),
              );
            });
            return Container(
              height: 0,
              width: 0,
            );
          default:
            return Container();
        }
      },
    );
  }
}
