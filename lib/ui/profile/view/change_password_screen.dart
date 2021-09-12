import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/ui/common/appbar_back.dart';
import 'package:coffeehome/ui/common/normal_field.dart';
import 'package:coffeehome/ui/common/password_field.dart';
import 'package:coffeehome/ui/animation/wave_coffee.dart';
import 'package:coffeehome/ui/profile/provider/change_password_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarBack(
        title: "Change password",
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          children: [
            const SizedBox(
              height: 25,
            ),
            NormalTextField(
              fieldName: "Username",
              iconName: "ic_person.svg",
              validate: (value) {
                context.read<ChangePasswordProvider>().setUsername(value);
              },
              expanded: false,
            ),
            const SizedBox(
              height: 25,
            ),
            // old password
            PasswordField(
              hintText: "Old password",
              validate: (value) {
                context.read<ChangePasswordProvider>().setOldPassword(value);
              },
              showPassword: () {
                context.read<ChangePasswordProvider>().setShowOldPassword();
              },
              isObscureText:
                  context.watch<ChangePasswordProvider>().showOldPassword,
            ),
            const SizedBox(
              height: 25,
            ),
            PasswordField(
              hintText: "New password",
              validate: (value) {
                context.read<ChangePasswordProvider>().setNewPassword(value);
              },
              showPassword: () {
                context.read<ChangePasswordProvider>().setShowNewPassword();
              },
              isObscureText:
                  context.watch<ChangePasswordProvider>().showNewPassword,
            ),
            const SizedBox(
              height: 25,
            ),
            PasswordField(
              hintText: "New password again",
              validate: (value) {
                context
                    .read<ChangePasswordProvider>()
                    .setNewPasswordAgain(value);
              },
              showPassword: () {
                context
                    .read<ChangePasswordProvider>()
                    .setShowNewPasswordAgain();
              },
              isObscureText:
                  context.watch<ChangePasswordProvider>().showNewPasswordAgain,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "${context.watch<ChangePasswordProvider>().error ?? ""}",
              style: TextStyle(
                color: bloodred,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                context.read<ChangePasswordProvider>().checkError();
                changePassword(
                    context, context.read<ChangePasswordProvider>().error);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: lightblue,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    "Change password",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changePassword(BuildContext context, String? error) async {
    if (error == null) {
      bool result = await showDialog(
        context: context,
        builder: (_) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: FutureBuilder(
            future: context.read<ChangePasswordProvider>().changePassword(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CoffeeAnimation(),
                  );
                case ConnectionState.none:
                  return Center(
                    child: Text(
                      "${context.watch<ChangePasswordProvider>().result?["data"] ?? ""}",
                      style: TextStyle(
                        color: bloodred,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );

                default:
                  return FittedBox(
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: lightgreen.withOpacity(0.6),
                              ),
                              Text(
                                "Change password successful",
                                style: TextStyle(
                                  color: lightgreen.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text(
                                "OK",
                                style: Theme.of(context).textTheme.subtitle1,
                              ))
                        ],
                      ),
                    ),
                  );
              }
            },
          ),
        ),
      );
      if (result) {
        Navigator.pop(context);
      }
    }
  }
}
