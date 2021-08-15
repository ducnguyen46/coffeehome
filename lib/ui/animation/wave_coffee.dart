import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class CoffeeAnimation extends StatelessWidget {
  const CoffeeAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "assets/animations/ani_coffeebeans.json",
      height: 70,
    );
  }
}
