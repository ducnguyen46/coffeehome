import 'package:coffeehome/ui/a_widget_reduce/appbar_back.dart';
import 'package:coffeehome/ui/delivery_info/widget/address_card.dart';
import 'package:flutter/material.dart';

class DeliveryInfoScreen extends StatelessWidget {
  const DeliveryInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            Flexible(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => AddressCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
