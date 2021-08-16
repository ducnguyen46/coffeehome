import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NormalTextField extends StatefulWidget {
  const NormalTextField({
    Key? key,
    required this.fieldName,
    required this.iconName,
    required this.validate,
    required this.expanded,
  }) : super(key: key);

  final String fieldName;
  final String iconName;
  final bool expanded;
  final Function(String) validate;

  @override
  State<NormalTextField> createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {
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
                    onChanged: (data) {
                      widget.validate.call(data);
                    },
                    cursorColor: bluewood,
                    cursorRadius: const Radius.circular(8.0),
                    maxLines: widget.expanded ? null : 1,
                    minLines: widget.expanded ? 1 : null,
                    maxLength: widget.expanded ? 200 : null,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      hintText: "${widget.fieldName}",
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
