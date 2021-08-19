import 'package:coffeehome/ui/a_widget_reduce/appbar_center_title.dart';
import 'package:coffeehome/ui/authenticate/provider/user_provider.dart';
import 'package:coffeehome/ui/home/widget/reward_card.dart';
import 'package:coffeehome/ui/item_detail/provider/item_provider.dart';
import 'package:coffeehome/ui/reward/provider/reward_provider.dart';
import 'package:coffeehome/ui/reward/widget/item_in_reward.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await context.read<RewardProvider>().getAllItemsUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var user = context.watch<UserProvider>().user;
    var items = context.watch<RewardProvider>().items;
    return Scaffold(
      appBar: AppBarCenterTitle(
        safeAreaTop: MediaQuery.of(context).padding.top,
        title: "Rewards",
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: size.width,
        height: size.height,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: RewardCard(user: user!),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 25, bottom: 5),
                child: Text(
                  "History Rewards",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ItemReward(item: items[index]),
                childCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
