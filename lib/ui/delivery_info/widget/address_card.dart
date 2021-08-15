import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      width: size.width,
      decoration: BoxDecoration(
        color: lightblue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Anderson",
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SvgPicture.asset(pathToIcons + "ic_location.svg"),
            ],
          ),
          Text("+84961465453", style: Theme.of(context).textTheme.subtitle2),
          Text(
            "Nguyen Van Troi, Mo Lao, Ha Dong, Ha Noi",
            style: Theme.of(context).textTheme.subtitle2,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Note: ",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
