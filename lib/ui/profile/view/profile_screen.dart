import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/model/user.dart';
import 'package:coffeehome/ui/a_widget_reduce/appbar_back.dart';
import 'package:coffeehome/ui/profile/view/change_password_screen.dart';
import 'package:coffeehome/ui/profile/widget/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarBack(
        safeAreaTop: MediaQuery.of(context).padding.top,
        title: "My Profile",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCard(
              icon: "ic_name.svg",
              title: "Fullname",
              content: user.fullName,
            ),
            ProfileCard(
              icon: "ic_calendar.svg",
              title: "Date of birth",
              content: user.dateOfBirth,
            ),
            ProfileCard(
              icon: "ic_email.svg",
              title: "Email",
              content: user.email,
            ),
            ProfileCard(
              icon: "ic_person.svg",
              title: "Username",
              content: user.username,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen()));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
}
