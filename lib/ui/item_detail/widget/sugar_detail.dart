import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/ui/item_detail/provider/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SugarInDetail extends StatelessWidget {
  const SugarInDetail({
    Key? key,
    required ItemProvider? itemProvider,
  })  : _itemProvider = itemProvider,
        super(key: key);

  final ItemProvider? _itemProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Sugar",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _itemProvider?.setSugar(Sugar.Sugar50);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(7),
                    width: 45,
                    height: 45,
                    child: SvgPicture.asset(
                      pathToIcons + "ic_sugar.svg",
                      color:
                          context.watch<ItemProvider>().sugar == Sugar.Sugar50
                              ? blacknavy
                              : whitegray.withOpacity(0.5),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _itemProvider?.setSugar(Sugar.Sugar70);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(3),
                    width: 45,
                    height: 45,
                    child: SvgPicture.asset(
                      pathToIcons + "ic_sugar.svg",
                      color:
                          context.watch<ItemProvider>().sugar == Sugar.Sugar70
                              ? blacknavy
                              : whitegray.withOpacity(0.5),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _itemProvider?.setSugar(Sugar.Sugar100);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(0),
                    width: 45,
                    height: 45,
                    child: SvgPicture.asset(
                      pathToIcons + "ic_sugar.svg",
                      color:
                          context.watch<ItemProvider>().sugar == Sugar.Sugar100
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
