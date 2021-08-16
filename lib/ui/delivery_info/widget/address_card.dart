import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/model/delivery_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    required this.deliveryInfo,
  }) : super(key: key);

  final DeliveryInfo deliveryInfo;

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
                  "${deliveryInfo.receiver}",
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SvgPicture.asset(pathToIcons + "ic_location.svg"),
            ],
          ),
          Text("${deliveryInfo.phoneNumber}",
              style: Theme.of(context).textTheme.subtitle2),
          Text(
            "${deliveryInfo.address}",
            style: Theme.of(context).textTheme.subtitle2,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Note: ${deliveryInfo.note}",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
