import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/model/item.dart';
import 'package:coffeehome/ui/animation/wave_coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ItemReward extends StatelessWidget {
  const ItemReward({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: lightblue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item.product.name}",
                    style: Theme.of(context).textTheme.subtitle1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    getPropertyDetail(item),
                    style: Theme.of(context).textTheme.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Text(
            "+${item.quantity}",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  String getPropertyDetail(Item item) {
    return "${item.type} | ${item.size} | ${item.ice} | ${item.sugar}";
  }
}
