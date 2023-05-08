import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/onboarding/views/my_animated_switcher_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [enum]
/// [AnimatedCrossFade]
/// [onPanUpdate]
/// [onPanEnd]

enum Direction { right, left }

enum Page { first, second }

class MyAnimatedCrossFadeView extends StatefulWidget {
  static String routeUrl = '/onboard';
  static String routeName = 'onboard';
  const MyAnimatedCrossFadeView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAnimatedCrossFadeView> createState() =>
      _MyAnimatedCrossFadeViewState();
}

class _MyAnimatedCrossFadeViewState extends State<MyAnimatedCrossFadeView> {
  // bool _isFirst = true;
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  /// right to left = negative
  /// left to right = positive
  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      _direction = Direction.right;
    } else {
      _direction = Direction.left;
    }
    setState(() {});
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      _showingPage = Page.second;
    } else {
      _showingPage = Page.first;
    }
    setState(() {});
  }

  void _onAnimatedSwitcherTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MyAnimatedSwitcherView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
            ),
            child: AnimatedCrossFade(
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(
                milliseconds: 300,
              ),
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    'First Area',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  Gaps.v20,
                  Text(
                    'Animated Cross Fade View',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  Gaps.v20,
                  Text(
                    'Description of this page.',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    'Second Area',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  Gaps.v20,
                  Text(
                    'Animated Cross Fade View',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  Gaps.v20,
                  Text(
                    'Description of this page.',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.size32,
            bottom: Sizes.size64,
            left: Sizes.size24,
            right: Sizes.size24,
          ),
          child: AnimatedOpacity(
            opacity: _showingPage == Page.second ? 1 : 0,
            duration: const Duration(
              milliseconds: 300,
            ),
            child: CupertinoButton(
              onPressed:
                  _showingPage == Page.second ? _onAnimatedSwitcherTap : null,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              child: Text(
                'Animated Switcher View',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
