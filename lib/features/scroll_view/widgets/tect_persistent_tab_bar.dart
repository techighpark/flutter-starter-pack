import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TechPersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 0.5,
          ),
        ),
      ),
      child: const TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        tabs: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Icon(
              CupertinoIcons.game_controller,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Icon(
              CupertinoIcons.heart,
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
