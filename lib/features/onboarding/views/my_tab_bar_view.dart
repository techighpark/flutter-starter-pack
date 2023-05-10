import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/main_navigation/views/main_navigation_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// [DefaultTabController]
/// [TabBarView]
/// [TabPageSelector]
/// TabBarView doesn't work at WEB
/// [pushAndRemoveUntil]
class MyTabBarView extends StatefulWidget {
  static String routeUrl = '/onboard';
  static String routeName = 'onboard';
  const MyTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyTabBarView> createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView> {
  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: Sizes.size52,
                      ),
                      child: Text(
                        'First Tab with',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
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
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: CupertinoButton(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        disabledColor: Theme.of(context).colorScheme.onPrimary,
                        onPressed: null,
                        child: Text(
                          'Go to Navigation Tab(deprecated)',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
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
