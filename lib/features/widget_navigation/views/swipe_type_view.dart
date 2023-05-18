import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/onboarding/views/my_animated_cross_fade_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_animated_switcher_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_single_child_scroll_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_tab_bar_view.dart';
import 'package:dev_app_1/features/widget_navigation/widgets/buttons/stack_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwipeTypeView extends StatefulWidget {
  const SwipeTypeView({Key? key}) : super(key: key);

  @override
  State<SwipeTypeView> createState() => _ButtonTypeViewState();
}

class _ButtonTypeViewState extends State<SwipeTypeView> {
  final ScrollController _scrollController = ScrollController();

  void _onSwipeTap(String type) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          if (type == 'tabbar') {
            return const MyTabBarView();
          } else if (type == 'singlechild') {
            return const MySingleChildScrollView(email: '123');
          } else if (type == 'cross') {
            return const MyAnimatedCrossFadeView();
          } else {
            return const MyAnimatedSwitcherView();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipe Type'),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size24,
                    horizontal: Sizes.size56,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: CupertinoButton(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          onPressed: () => _onSwipeTap('tabbar'),
                          child: Text(
                            'Tab Bar',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                      Gaps.v20,
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: CupertinoButton(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          onPressed: () => _onSwipeTap('singlechild'),
                          child: Text(
                            'Single Child Scroll',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                      Gaps.v20,
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: CupertinoButton(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          onPressed: () => _onSwipeTap('cross'),
                          child: Text(
                            'Animated Cross Fade',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                      Gaps.v20,
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: CupertinoButton(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          onPressed: () => _onSwipeTap('switcher'),
                          child: Text(
                            'Animated Switcher',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
