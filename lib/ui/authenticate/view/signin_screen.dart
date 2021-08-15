import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/ui/a_widget_reduce/appbar_back.dart';
import 'package:coffeehome/ui/a_widget_reduce/normal_field.dart';
import 'package:coffeehome/ui/a_widget_reduce/password_field.dart';
import 'package:coffeehome/ui/a_widget_reduce/toast.dart';
import 'package:coffeehome/ui/authenticate/provider/auth_provider.dart';
import 'package:coffeehome/ui/authenticate/provider/signin_validate.dart';
import 'package:coffeehome/ui/authenticate/view/signup_screen.dart';
import 'package:coffeehome/ui/authenticate/widget/login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  FToast? _fToast;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<SignInValidate>(context, listen: false).init();
    });
    _fToast = FToast();
    _fToast?.init(context);
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
          Container(
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
                    "Sign in",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Welcome back",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
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
                  validate: (password) {
                    signInValidate.setPassword(password);
                  },
                  showPassword: () {
                    signInValidate.setOnShowPassword();
                  },
                  isObscureText: context.watch<SignInValidate>().isObscureText,
                ),
                const SizedBox(
                  height: 16,
                ),
                Opacity(
                  opacity:
                      context.watch<SignInValidate>().error == null ? 0.0 : 1.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      context.watch<SignInValidate>().error ??
                          "Every thing fine",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
                // Spacer(),
                Row(
                  children: [
                    Text(
                      "New member? ",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final bool result = await Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpScreen()));
                        if (result) {
                          _fToast?.showToast(
                            gravity: ToastGravity.BOTTOM,
                            toastDuration: Duration(seconds: 2),
                            child: ToastView(
                                content: "Register successful!", success: true),
                          );
                        }
                      },
                      child: Text(
                        "Sign up",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 50,
            child: GestureDetector(
              onTap: () {
                if (signInValidate.isValidLogin()) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: LoginDialog(
                        authProvider: authProvider,
                        username: signInValidate.username.data!,
                        password: signInValidate.password.data!,
                      ),
                    ),
                  );
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
                  child: Text(
                    "Sign in",
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
