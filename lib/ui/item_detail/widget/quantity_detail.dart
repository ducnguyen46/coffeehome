import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/ui/item_detail/provider/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class QuantityInDetail extends StatelessWidget {
  const QuantityInDetail({
    Key? key,
    required ItemProvider? itemProvider,
  })  : _itemProvider = itemProvider,
        super(key: key);

  final ItemProvider? _itemProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "${_itemProvider?.product?.name}",
                style: Theme.of(context).textTheme.subtitle1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: whitegray.withOpacity(0.4),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _itemProvider?.decreseQuantity();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 8.0),
                    child: SvgPicture.asset(pathToIcons + "ic_decrease.svg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${context.watch<ItemProvider>().quantity}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _itemProvider?.increseQuantity();
                  },
                  child: Container(
                    // color: Colors.amber,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 8.0),
                    child: SvgPicture.asset(pathToIcons + "ic_increase.svg"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
