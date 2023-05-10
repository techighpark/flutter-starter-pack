import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/main_navigation/views/custom_navigation_view.dart';
import 'package:dev_app_1/features/main_navigation/views/main_navigation_view.dart';
import 'package:dev_app_1/features/main_navigation/views/my_cupertino_tab_bar_view.dart';
import 'package:dev_app_1/features/widget_navigation/button_type_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetNavigation extends StatefulWidget {
  static String routeUrl = '/widgetnav';
  static String routeName = 'widgetnav';
  const WidgetNavigation({Key? key}) : super(key: key);

  @override
  State<WidgetNavigation> createState() => _WidgetNavigationState();
}

class _WidgetNavigationState extends State<WidgetNavigation> {
  final ScrollController _scrollController = ScrollController();
  void _onNavigationTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MainNavigationView(),
      ),
    );
  }

  void _onCustomNavigationTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CustomNavigationView(),
      ),
    );
  }

  void _onCupertinoNavTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MyCupertinoTabBarView(),
      ),
    );
  }

  void _onButtonTypeTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ButtonTypeView(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Navigation'),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
            vertical: Sizes.size24,
          ),
          controller: _scrollController,
          child: Wrap(
            runSpacing: Sizes.size12,
            children: [
              Text(
                'Navigation Type',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: CupertinoButton(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  onPressed: _onCustomNavigationTap,
                  child: Text(
                    'Custom Navigation',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: CupertinoButton(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  onPressed: _onNavigationTap,
                  child: Text(
                    'NavigationBar - Material3',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: CupertinoButton(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  onPressed: _onCupertinoNavTap,
                  child: Text(
                    'Cupertino Navigation',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              Text(
                'Button Type',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: CupertinoButton(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  onPressed: _onButtonTypeTap,
                  child: Text(
                    'Button Type View',
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
    );
  }
}
