import 'package:coffeehome/config/color/color.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({
    Key? key,
    required this.validate,
    required this.countryCode,
  }) : super(key: key);
  final Function(String) validate;
  final Function(String) countryCode;

  @override
  _PhoneFieldState createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CountryCodePicker(
                onChanged: (countrycode) {
                  widget.countryCode(countrycode.code!);
                },
                initialSelection: "+84",
                textStyle: Theme.of(context).textTheme.subtitle2,
                dialogTextStyle: Theme.of(context).textTheme.subtitle2,
                dialogSize: Size(size.width - 80, size.height - 160),
                searchDecoration: InputDecoration(
                  border: InputBorder.none,
                ),
                searchStyle: Theme.of(context).textTheme.subtitle1,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    onChanged: (data) {
                      widget.validate.call(data);
                    },
                    cursorColor: bluewood,
                    cursorRadius: const Radius.circular(8.0),
                    style: Theme.of(context).textTheme.bodyText1,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Phone number",
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
            ],
          ),
          Container(
            width: size.width,
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
