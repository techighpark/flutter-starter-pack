import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/main_navigation/views/tech_material_navigation_view.dart';
import 'package:dev_app_1/features/main_navigation/views/tech_cupertino_tab_bar_view.dart';
import 'package:dev_app_1/features/onboarding/views/tech_animated_cross_fade_view.dart';
import 'package:dev_app_1/features/onboarding/views/tech_animated_switcher_view.dart';
import 'package:dev_app_1/features/onboarding/views/tech_tab_bar_view.dart';
import 'package:dev_app_1/features/onboarding/widgets/single_child_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

/// [Scrollbar]
/// [SingleChildScrollView]
/// [AnimatedOpacity]
/// [Wrap]
/// [Material]
class TechSingleChildScrollView extends StatefulWidget {
  static String routeUrl = '/onboard';
  static String routeName = 'onboard';
  final String email;
  const TechSingleChildScrollView({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<TechSingleChildScrollView> createState() =>
      _TechSingleChildScrollViewState();
}

class _TechSingleChildScrollViewState extends State<TechSingleChildScrollView> {
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;
  final List<String> _interestList = [];
  bool _disabledButton = true;

  void _onInterestTap(String interest, bool isSelect) {
    if (isSelect) {
      _interestList.add(interest);
    } else {
      _interestList.remove(interest);
    }
    if (_interestList.isNotEmpty) {
      _disabledButton = false;
    } else {
      _disabledButton = true;
    }
    setState(() {});
  }

  void _onScroll() {
    if (_scrollController.offset > 110) {
      if (_showTitle != true) {
        _showTitle = true;
      }
    } else {
      _showTitle = false;
    }
    setState(() {});
  }

  void _onTabBarViewTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TechTabBarView(),
      ),
    );
  }

  void _onAnimatedCrossFadeViewTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TechAnimatedCrossFadeView(),
      ),
    );
  }

  void _onAnimatedSwitcherTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TechAnimatedSwitcherView(),
      ),
    );
  }

  void _onMainNavigationTap() {
    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(
    //     builder: (context) => const MainNavigationView(),
    //   ),
    //   (route) {
    //     /// true -> 이전 routes 제거되지 않음
    //     /// false -> 이전 routes 제거됨
    //     return false;
    //   },
    // );
    context.pushNamed(TechMaterialNavigationView.routeName);
  }

  void _onCupertinoTap() {
    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(
    //     builder: (context) => const MainNavigationView(),
    //   ),
    //   (route) {
    //     /// true -> 이전 routes 제거되지 않음
    //     /// false -> 이전 routes 제거됨
    //     return false;
    //   },
    // );
    context.pushNamed(TechCupertinoTabBarView.routeName);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: const Text(
            'Single Child Scroll View',
          ),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
              right: Sizes.size24,
              left: Sizes.size24,
              bottom: Sizes.size12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v20,
                Text(
                  'Single Child Scroll View',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                Gaps.v20,
                Text(
                  'Description of this page.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Gaps.v64,
                Wrap(
                  runSpacing: Sizes.size20,
                  spacing: Sizes.size20,
                  children: [
                    for (var interest in interests)
                      SingleChildButton(
                        interest: interest,
                        onInterestTap: (interest, isSelect) =>
                            _onInterestTap(interest, isSelect),
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.only(
            bottom: Sizes.size48,
            top: Sizes.size16,
            left: Sizes.size24,
            right: Sizes.size24,
          ),
          child: Wrap(
            runSpacing: Sizes.size20,
            spacing: Sizes.size40,
            children: [
              const Text('Important of Wrap'),
              const Text('not separated and should make space'),
              const Text('This button is inside of Wrap'),
              CupertinoButton(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                disabledColor: Theme.of(context).colorScheme.onPrimary,
                onPressed: _disabledButton ? null : _onTabBarViewTap,
                child: Text(
                  'Tab Bar View',
                  style: TextStyle(
                    color: _disabledButton
                        ? Theme.of(context).colorScheme.onPrimaryContainer
                        : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              CupertinoButton(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                disabledColor: Theme.of(context).colorScheme.onPrimary,
                onPressed: _disabledButton ? null : _onAnimatedCrossFadeViewTap,
                child: Text(
                  'Animated Cross Fade View',
                  style: TextStyle(
                    color: _disabledButton
                        ? Theme.of(context).colorScheme.onPrimaryContainer
                        : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              const Text('Bottom buttons are inside of Wrap > Column'),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Here start column'),
                  Gaps.v10,
                  CupertinoButton(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    disabledColor: Theme.of(context).colorScheme.onPrimary,
                    onPressed: _disabledButton ? null : _onMainNavigationTap,
                    child: Text(
                      'Main Navigation View',
                      style: TextStyle(
                        color: _disabledButton
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  Gaps.v10,
                  CupertinoButton(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    disabledColor: Theme.of(context).colorScheme.onPrimary,
                    onPressed: _disabledButton ? null : _onCupertinoTap,
                    child: Text(
                      'Cupertino Tab Bar View',
                      style: TextStyle(
                        color: _disabledButton
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
