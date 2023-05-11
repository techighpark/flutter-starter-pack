import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/features/widget_navigation/widgets/buttons/stack_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [BottomNavigationBar] - Material Design 2
/// [NavigationBar] - Material Design 3
/// [NavigationDestination]
class MainNavigationView extends StatefulWidget {
  static String routeName = 'mainNavigation';
  static String routeUrl = '/main';
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
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
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onTap,
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.construction,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.add_business_rounded,
            ),
            label: 'Search',
          ),
          StackButton(),
          NavigationDestination(
            icon: Icon(
              Icons.add_business_rounded,
            ),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.add_business_rounded,
            ),
            label: 'Search',
          )
        ],
      ),
    );
  }
}
