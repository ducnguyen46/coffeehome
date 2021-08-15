import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/ui/item_detail/provider/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SizeInDetail extends StatelessWidget {
  const SizeInDetail({
    Key? key,
    required ItemProvider? itemProvider,
  })  : _itemProvider = itemProvider,
        super(key: key);

  final ItemProvider? _itemProvider;

  @override
  Widget build(BuildContext context) {
    var _size = _itemProvider?.size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Size",
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
                    _itemProvider?.setSize(Sizes.M);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: 50,
                    child: SvgPicture.asset(
                      pathToIcons + "ic_size.svg",
                      color: _size == Sizes.M
                          ? blacknavy
                          : whitegray.withOpacity(0.5),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _itemProvider?.setSize(Sizes.L);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 50,
                    child: SvgPicture.asset(
                      pathToIcons + "ic_size.svg",
                      color: _size == Sizes.L
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
