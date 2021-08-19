import 'package:coffeehome/constant/app_path.dart';
import 'package:coffeehome/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -10,
            left: -10,
            child: SvgPicture.asset(pathToImages + "bud.svg"),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 17,
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
                        "Points: ${user.point}",
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
                  child: Center(
                    child: RatingBar(
                      onRatingUpdate: (rating) {},
                      ignoreGestures: true,
                      updateOnDrag: false,
                      allowHalfRating: false,
                      initialRating: _checkReward(user.point).toDouble(),
                      minRating: 0,
                      itemCount: 8,
                      itemSize: 30,
                      glow: false,
                      ratingWidget: RatingWidget(
                        full: SvgPicture.asset(
                            pathToIcons + "ic_award_enable.svg"),
                        half: SvgPicture.asset(
                            pathToIcons + "ic_award_enable.svg"),
                        empty: SvgPicture.asset(
                            pathToIcons + "ic_award_disable.svg"),
                      ),
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
