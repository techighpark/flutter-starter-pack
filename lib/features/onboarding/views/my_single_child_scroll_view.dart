import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/onboarding/views/my_animated_cross_fade_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_tab_bar_view.dart';
import 'package:dev_app_1/features/onboarding/widgets/single_child_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class MySingleChildScrollView extends StatefulWidget {
  static String routeUrl = '/onboard';
  static String routeName = 'onboard';
  final String email;
  const MySingleChildScrollView({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<MySingleChildScrollView> createState() =>
      _MySingleChildScrollViewState();
}

class _MySingleChildScrollViewState extends State<MySingleChildScrollView> {
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
    if (_interestList.length > 3) {
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

  void _onTabBarViewTab() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MyTabBarView(),
      ),
    );
  }

  void _onAnimatedCrossFadeViewTab() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MyAnimatedCrossFadeView(),
      ),
    );
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

                /// TODO [Wrap]
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
                onPressed: _disabledButton ? null : _onAnimatedCrossFadeViewTab,
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
                    onPressed: _disabledButton ? null : _onTabBarViewTab,
                    child: Text(
                      'Tab Bar View',
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
                    onPressed:
                        _disabledButton ? null : _onAnimatedCrossFadeViewTab,
                    child: Text(
                      'Animated Cross Fade View',
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
