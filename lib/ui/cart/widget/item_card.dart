import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeehome/config/color/color.dart';
import 'package:coffeehome/model/item.dart';
import 'package:coffeehome/ui/animation/wave_coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 100,
      decoration: BoxDecoration(
        color: lightblue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: "${item.product.image}",
              errorWidget: (context, _, error) => Center(
                child: CoffeeAnimation(),
              ),
              placeholder: (context, url) => Center(
                child: CoffeeAnimation(),
              ),
            ),
          ),
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
                  Spacer(),
                  Text(
                    "x ${item.quantity}",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "${NumberFormat.simpleCurrency(locale: 'vi_VN').format(item.priceIn)}",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 14,
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
