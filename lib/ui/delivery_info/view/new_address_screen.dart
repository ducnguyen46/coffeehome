import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/model/delivery_info.dart';
import 'package:coffeehome/ui/common/appbar_back.dart';
import 'package:coffeehome/ui/common/normal_field.dart';
import 'package:coffeehome/ui/common/phone_field.dart';
import 'package:coffeehome/ui/common/toast.dart';
import 'package:coffeehome/ui/delivery_info/provider/delivery_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({Key? key}) : super(key: key);

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  DeliveryInfoProvider? deliveryInfoProvider;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<DeliveryInfoProvider>().init();
      deliveryInfoProvider = context.read<DeliveryInfoProvider>();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarBack(
        safeAreaTop: MediaQuery.of(context).padding.top,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Flexible(
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 8, bottom: 20),
                    child: Text(
                      "New delivery info",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  NormalTextField(
                    fieldName: "Reciver's name",
                    iconName: "ic_person.svg",
                    expanded: false,
                    validate: (name) {
                      context.read<DeliveryInfoProvider>().setName(name);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PhoneField(
                    validate: (num) {
                      context.read<DeliveryInfoProvider>().setPhoneNumber(num);
                    },
                    countryCode: (code) {
                      context.read<DeliveryInfoProvider>().setCountryCode(code);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NormalTextField(
                    fieldName: "Address delivery",
                    iconName: "ic_pin.svg",
                    expanded: true,
                    validate: (address) {
                      context.read<DeliveryInfoProvider>().setAddress(address);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NormalTextField(
                    fieldName: "Note",
                    iconName: "ic_pen.svg",
                    expanded: true,
                    validate: (note) {
                      context.read<DeliveryInfoProvider>().setNote(note);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  deliveryInfoProvider?.error != null
                      ? Text(
                          "${deliveryInfoProvider!.error}",
                          style: TextStyle(
                            color: bloodred,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      : Container(),
                  GestureDetector(
                    onTap: () async {
                      if (deliveryInfoProvider?.name.data != null &&
                          deliveryInfoProvider?.phoneNumber.data != null &&
                          deliveryInfoProvider?.address.data != null) {
                        String name = deliveryInfoProvider!.name.data!;
                        String phoneNumber = deliveryInfoProvider!.countryCode +
                            deliveryInfoProvider!.phoneNumber.data!;
                        String address = deliveryInfoProvider!.address.data!;
                        String note = deliveryInfoProvider!.note;

                        DeliveryInfo deliveryInfo = DeliveryInfo(
                            id: 0,
                            receiver: name,
                            phoneNumber: phoneNumber,
                            address: address,
                            note: note,
                            isDefault: true);

                        await deliveryInfoProvider!
                            .addNewDeliveryInfo(deliveryInfo);

                        if (deliveryInfoProvider!.log?["status"] == "OK") {
                          FToast fToast = FToast();
                          fToast.init(context);
                          fToast.showToast(
                              gravity: ToastGravity.BOTTOM,
                              toastDuration: Duration(seconds: 2),
                              child: ToastView(
                                  content: deliveryInfoProvider!.log?["data"],
                                  success: true));
                          Navigator.pop(context);
                        } else {
                          FToast fToast = FToast();
                          fToast.init(context);
                          fToast.showToast(
                              gravity: ToastGravity.BOTTOM,
                              toastDuration: Duration(seconds: 2),
                              child: ToastView(
                                  content: deliveryInfoProvider!.log?["data"],
                                  success: false));
                        }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
