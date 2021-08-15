import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/ui/item_detail/provider/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class IceInDetail extends StatelessWidget {
  const IceInDetail({
    Key? key,
    required ItemProvider? itemProvider,
  })  : _itemProvider = itemProvider,
        super(key: key);

  final ItemProvider? _itemProvider;

  @override
  Widget build(BuildContext context) {
    var _ice = context.read<ItemProvider>().ice;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Ice",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _itemProvider?.setIce(Ice.Ice50);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(15),
                    width: 45,
                    height: 45,
                    child: SvgPicture.asset(
                      pathToIcons + "ic_ice_1.svg",
                      color: _ice == Ice.Ice50
                          ? blacknavy
                          : whitegray.withOpacity(0.5),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _itemProvider?.setIce(Ice.Ice70);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(10),
                    width: 45,
                    height: 45,
                    child: SvgPicture.asset(
                      pathToIcons + "ic_ice_2.svg",
                      color: _ice == Ice.Ice70
                          ? blacknavy
                          : whitegray.withOpacity(0.5),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _itemProvider?.setIce(Ice.Ice100);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(10),
                    width: 45,
                    height: 45,
                    child: SvgPicture.asset(
                      pathToIcons + "ic_ice_3.svg",
                      color: _ice == Ice.Ice100
                          ? blacknavy
                          : whitegray.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
