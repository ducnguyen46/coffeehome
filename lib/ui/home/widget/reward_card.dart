import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RewardCard extends StatelessWidget {
  RewardCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(
        horizontal: size.shortestSide < 600 ? 25 : size.width - 25,
        vertical: 17,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "${user.reward} card",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "${_checkReward(user.point)}/8",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            width: size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 1; i <= 8; i++)
                  i <= _checkReward(user.point) // check here
                      ? Container(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            pathToIcons + "ic_award_enable.svg",
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            pathToIcons + "ic_award_disable.svg",
                          ),
                        )
              ],
            ),
          ),
        ],
      ),
    );
  }

  int _checkReward(int point) {
    if (point == 0) return 0;

    if (point > 40) return 8;

    if (point % 8 == 0) {
      return 8;
    } else {
      return point % 8;
    }
  }
}
