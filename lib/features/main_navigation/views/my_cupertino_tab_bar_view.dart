import 'package:dev_app_1/features/widget_navigation/widgets/buttons/stack_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [CupertinoTabScaffold]
/// [CupertinoTabBar]
/// [CupertinoIcons]
/// main.dart : MaterialApp -> CupertinoApp
/// themeData 없어짐
class MyCupertinoTabBarView extends StatefulWidget {
  static String routeName = 'cupertinoScaffold';
  static String routeUrl = '/cupertinoScaffold';
  const MyCupertinoTabBarView({Key? key}) : super(key: key);

  @override
  State<MyCupertinoTabBarView> createState() => _MyCupertinoTabBarViewState();
}

class _MyCupertinoTabBarViewState extends State<MyCupertinoTabBarView> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text('First'),
    ),
    const Center(
      child: Text('Second'),
    ),
    const Center(
      child: Text('Third'),
    ),
    const Center(
      child: Text('Fourth'),
    ),
  ];

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.command),
            label: "Company",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.device_phone_landscape),
            label: "Academy",
          ),
        ],
      ),
      tabBuilder: (context, index) => screens[index],
    );
  }
}
