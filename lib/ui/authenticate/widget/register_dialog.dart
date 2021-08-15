import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/model/user.dart';
import 'package:coffeehome/ui/animation/wave_coffee.dart';
import 'package:coffeehome/ui/authenticate/provider/auth_provider.dart';
import 'package:coffeehome/ui/authenticate/provider/signin_validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RegisterDialog extends StatelessWidget {
  const RegisterDialog({
    Key? key,
    required this.authProvider,
    required this.signInValidate,
  }) : super(key: key);

  final AuthProvider authProvider;
  final SignInValidate signInValidate;

  @override
  Widget build(BuildContext context) {
    User _user = User.all(
      fullName: signInValidate.fullname.data!,
      dateOfBirth: signInValidate.dateBirth!,
      email: signInValidate.email.data!,
      username: signInValidate.username.data!,
      reward: "New",
      point: 0,
      isActived: true,
    );

    return StreamBuilder(
      stream: authProvider.register(
        _user,
        signInValidate.password.data!,
      ),
      initialData: Status.Registering,
      builder: (context, snapshot) {
        switch (snapshot.data) {
          case Status.Registering:
            return CoffeeAnimation();
          case Status.NotRegistered:
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
          case Status.Registered:
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pop(
                context,
                true,
              );
            });
            return Container(
              height: 0,
              width: 0,
            );
          default:
            return Container(
              child: Text("Wrong!"),
            );
        }
      },
    );
  }
}
