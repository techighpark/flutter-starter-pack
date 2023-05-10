import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Direction { right, left }

const switcherText = [
  'First Switcher',
  'Second Switcher',
  'Third Switcher',
  'Fourth Switcher',
  'Fifth Switcher',
];

class MyAnimatedSwitcherView extends StatefulWidget {
  const MyAnimatedSwitcherView({Key? key}) : super(key: key);

  @override
  State<MyAnimatedSwitcherView> createState() => _MyAnimatedSwitcherViewState();
}

class _MyAnimatedSwitcherViewState extends State<MyAnimatedSwitcherView> {
  Direction _direction = Direction.right;
  int _index = 0;

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
      if (_index == switcherText.length - 1) {
        _index = 0;
      } else {
        _index += 1;
      }
    } else {
      if (_index == 0) {
        _index = switcherText.length - 1;
      } else {
        _index -= 1;
      }
    }
    setState(() {});
  }

  void _onNextTap() {
    if (_index < switcherText.length - 1) {
      _index += 1;
    } else if (_index == switcherText.length - 1) {
      _index = 0;
    }
    setState(() {});
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
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Column(
                key: ValueKey<int>(_index),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    switcherText[_index],
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  Gaps.v20,
                  Text(
                    'Animated Switcher View',
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
          child: CupertinoButton(
            onPressed: _onNextTap,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            child: Text(
              'Next',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
