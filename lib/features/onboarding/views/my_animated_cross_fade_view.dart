import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    /// [DefaultTabController] > [TabBarView] & [TabPageSelector]
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size48,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TabPageSelector(
                color: Colors.blue,
                selectedColor: Colors.red,
                borderStyle: BorderStyle.none,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text(
                      'First Tab',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text(
                      'Second Tab',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text(
                      'Third Tab',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
