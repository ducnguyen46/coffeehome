import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/ui/authenticate/provider/signin_validate.dart';
import 'package:coffeehome/ui/authenticate/widget/curpetino_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

class DateField extends StatefulWidget {
  const DateField({
    Key? key,
    required this.fieldName,
    required this.iconName,
    required this.dayValidate,
  }) : super(key: key);

  final String fieldName;
  final String iconName;
  final Function(String) dayValidate;

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  late TextEditingController _dateOfBirthCtrl;

  @override
  void initState() {
    _dateOfBirthCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _dateOfBirthCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              bool iosPlatform = Platform.isIOS;
              DateTime? dateSelected;

              if (iosPlatform) {
                dateSelected = await showCupertinoDialog(
                  context: context,
                  builder: (context) => Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(20))),
                    child: CurpetinoDatePicker(),
                  ),
                );
              } else {
                dateSelected = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.utc(1900),
                    lastDate: DateTime.now(),
                    helpText: "SELECT YOUR DATE OF BIRTH",
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context),
                        child: child!,
                      );
                    });
              }
              if (dateSelected != null) {
                String dateFormat = DateFormat("y-MM-dd").format(dateSelected);
                widget.dayValidate.call(dateFormat);
                _dateOfBirthCtrl.text =
                    Provider.of<SignInValidate>(context, listen: false)
                            .dateBirth ??
                        "";
              }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    pathToIcons + "${widget.iconName}",
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
                      controller: _dateOfBirthCtrl,
                      readOnly: true,
                      cursorColor: null,
                      cursorRadius: const Radius.circular(8.0),
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                        hintText: "${widget.fieldName}",
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    pathToIcons + "ic_calendar.svg",
                    height: 18,
                    width: 18,
                  ),
                ),
              ],
            ),
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
