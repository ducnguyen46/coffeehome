import 'package:coffeehome/config/color/color.dart';
import 'package:flutter/material.dart';

class ToastView extends StatelessWidget {
  const ToastView({Key? key, required this.content, required this.success})
      : super(key: key);

  final String content;
  final bool success;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: success ? Colors.greenAccent[400] : bloodred,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          success
              ? Icon(Icons.check, color: lightwhite)
              : Icon(Icons.error, color: lightwhite),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "$content",
            style: TextStyle(
              color: lightwhite,
            ),
          ),
        ],
      ),
    );
  }
}
