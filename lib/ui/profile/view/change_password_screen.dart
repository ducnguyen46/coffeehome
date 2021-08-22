import 'package:coffeehome/ui/a_widget_reduce/appbar_back.dart';
import 'package:coffeehome/ui/a_widget_reduce/normal_field.dart';
import 'package:coffeehome/ui/profile/provider/change_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var passwordProvider = context.read<ChangePasswordProvider>();

    return Scaffold(
      appBar: AppBarBack(
        title: "Change password",
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: ListView(
          children: [
            NormalTextField(
              fieldName: "Username",
              iconName: "ic_person.svg",
              validate: (value) {
                passwordProvider.setUsername(value);
              },
              expanded: false,
            ),
            NormalTextField(
              fieldName: "Old password",
              iconName: "ic_lock.svg",
              validate: (value) {},
              expanded: false,
            ),
            NormalTextField(
              fieldName: "New password",
              iconName: "ic_lock.svg",
              validate: (value) {},
              expanded: false,
            ),
            NormalTextField(
              fieldName: "New password again",
              iconName: "ic_lock.svg",
              validate: (value) {},
              expanded: false,
            ),
          ],
        ),
      ),
    );
  }
}
