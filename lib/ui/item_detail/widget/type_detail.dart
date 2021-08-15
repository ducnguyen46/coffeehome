import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/ui/item_detail/provider/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TypeInDetail extends StatelessWidget {
  const TypeInDetail({
    Key? key,
    required ItemProvider? itemProvider,
  })  : _itemProvider = itemProvider,
        super(key: key);

  final ItemProvider? _itemProvider;

  @override
  Widget build(BuildContext context) {
    var _type = context.watch<ItemProvider>().type;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Type",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                //chip
                GestureDetector(
                  onTap: () {
                    _itemProvider?.setType(Types.Hot);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      pathToIcons + "ic_hot.svg",
                      color: _type == Types.Hot
                          ? blacknavy
                          : whitegray.withOpacity(0.5),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _itemProvider?.setType(Types.Cold);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      pathToIcons + "ic_cold.svg",
                      color: _type == Types.Cold
                          ? blacknavy
                          : whitegray.withOpacity(0.5),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
