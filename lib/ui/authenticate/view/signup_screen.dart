import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/ui/common/appbar_back.dart';
import 'package:coffeehome/ui/common/normal_field.dart';
import 'package:coffeehome/ui/common/password_field.dart';
import 'package:coffeehome/ui/authenticate/provider/auth_provider.dart';
import 'package:coffeehome/ui/authenticate/provider/signin_validate.dart';
import 'package:coffeehome/ui/authenticate/widget/date_birth_field.dart';
import 'package:coffeehome/ui/authenticate/widget/register_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<SignInValidate>(context, listen: false).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var signInValidate = Provider.of<SignInValidate>(context);
    var authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBarBack(safeAreaTop: MediaQuery.of(context).padding.top),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              width: size.width,
              height: size.height -
                  (kToolbarHeight + MediaQuery.of(context).padding.top),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 23, bottom: 12),
                    child: Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Create an account here",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),

                  NormalTextField(
                    fieldName: "Fullname",
                    iconName: "ic_name.svg",
                    expanded: false,
                    validate: (data) {
                      signInValidate.setFullname(data);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  //date of birth
                  DateField(
                    fieldName: "Date of birth",
                    iconName: "ic_calendar.svg",
                    dayValidate: (date) {
                      signInValidate.setDateBirth(date);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  NormalTextField(
                    fieldName: "Email",
                    iconName: "ic_email.svg",
                    expanded: false,
                    validate: (data) {
                      signInValidate.setEmail(data);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  //username
                  NormalTextField(
                    fieldName: "Username",
                    iconName: "ic_person.svg",
                    expanded: false,
                    validate: (data) {
                      signInValidate.setUsername(data);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  PasswordField(
                    hintText: "Password",
                    validate: (password) {
                      signInValidate.setPassword(password);
                    },
                    showPassword: () {
                      signInValidate.setOnShowPassword();
                    },
                    isObscureText:
                        context.watch<SignInValidate>().isObscureText,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Opacity(
                    opacity: context.watch<SignInValidate>().error == null
                        ? 0.0
                        : 1.0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        context.watch<SignInValidate>().error ??
                            "Every thing fine",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 50,
            child: GestureDetector(
              onTap: () async {
                if (signInValidate.isValidSignUp()) {
                  final bool result = await showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: RegisterDialog(
                        signInValidate: signInValidate,
                        authProvider: authProvider,
                      ),
                    ),
                  ) as bool;
                  if (result) {
                    Navigator.pop(context, true);
                  }
                }
              },
              child: Container(
                width: size.width / 6,
                height: size.width / 6,
                decoration: BoxDecoration(
                  color: bluewood,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text("Sign up",
                      style: Theme.of(context).textTheme.button),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
