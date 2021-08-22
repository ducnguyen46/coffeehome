import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required this.validate,
    required this.showPassword,
    required this.isObscureText,
    required this.hintText,
  }) : super(key: key);

  final Function(String) validate;
  final Function() showPassword;
  final bool isObscureText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 80,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  pathToIcons + "ic_lock.svg",
                  height: 18,
                  width: 18,
                ),
              ),
              Container(
                width: 1,
                height: 26,
                decoration: BoxDecoration(
                  color: whitegray,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    onChanged: validate,
                    obscureText: isObscureText,
                    cursorColor: bluewood,
                    cursorRadius: const Radius.circular(8.0),
                    style: Theme.of(context).textTheme.bodyText1,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                      border: InputBorder.none,
                      errorStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: bloodred,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: showPassword,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isObscureText
                      ? SvgPicture.asset(
                          pathToIcons + "ic_eye.svg",
                          width: 18,
                          height: 18,
                        )
                      : SvgPicture.asset(
                          pathToIcons + "ic_hide.svg",
                          width: 18,
                          height: 18,
                        ),
                ),
              )
            ],
          ),
          Container(
            width: size.width - 100,
            height: 1,
            decoration: BoxDecoration(
              color: whitegray,
            ),
          ),
        ],
      ),
    );
  }
}
