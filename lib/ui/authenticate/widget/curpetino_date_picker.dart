import 'package:coffeehome/config/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurpetinoDatePicker extends StatefulWidget {
  const CurpetinoDatePicker({Key? key}) : super(key: key);

  @override
  _CurpetinoDatePickerState createState() => _CurpetinoDatePickerState();
}

class _CurpetinoDatePickerState extends State<CurpetinoDatePicker> {
  @override
  Widget build(BuildContext context) {
    DateTime? dateSelected;
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CupertinoDatePicker(
              onDateTimeChanged: (dateTime) {
                dateSelected = dateTime;
              },
              initialDateTime: DateTime.now(),
              maximumDate: DateTime.now(),
              minimumDate: DateTime.utc(1900),
              mode: CupertinoDatePickerMode.date,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context, rootNavigator: true).pop(),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: lightwhite,
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: bloodred,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .pop(dateSelected),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: bluewood,
                    ),
                    child: Center(
                      child: Text(
                        "OK",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
