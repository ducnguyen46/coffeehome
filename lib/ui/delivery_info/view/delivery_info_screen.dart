import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/ui/common/appbar_back.dart';
import 'package:coffeehome/ui/delivery_info/provider/delivery_provider.dart';
import 'package:coffeehome/ui/delivery_info/view/new_address_screen.dart';
import 'package:coffeehome/ui/delivery_info/widget/address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DeliveryInfoScreen extends StatefulWidget {
  const DeliveryInfoScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryInfoScreen> createState() => _DeliveryInfoScreenState();
}

class _DeliveryInfoScreenState extends State<DeliveryInfoScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var deliveryInfos = context.watch<DeliveryInfoProvider>().deliveryInfos;

    return Scaffold(
      appBar: AppBarBack(
        safeAreaTop: MediaQuery.of(context).padding.top,
        title: "Address delivery",
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NewAddressScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add new delivery address",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(pathToIcons + "ic_add.svg"),
                  )
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: deliveryInfos.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context
                        .read<DeliveryInfoProvider>()
                        .setDeliveryInfo(deliveryInfos[index]);
                    Navigator.pop(context);
                  },
                  child: AddressCard(
                    deliveryInfo: deliveryInfos[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
