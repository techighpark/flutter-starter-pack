import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/scroll_view/views/tech_custom_grid_view.dart';
import 'package:dev_app_1/features/main_navigation/views/stfScreen.dart';
import 'package:dev_app_1/features/main_navigation/widgets/nav_tab.dart';
import 'package:dev_app_1/features/scroll_view/views/tech_custom_scroll_view.dart';
import 'package:dev_app_1/features/scroll_view/views/tech_nested_scroll_view.dart';
import 'package:dev_app_1/features/widget_navigation/widgets/buttons/stack_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [Offstage]
/// [fullscreenDialog]
class TechNavigationView extends StatefulWidget {
  static String routeUrl = '/customNav';
  static String routeName = 'customNav';
  const TechNavigationView({Key? key}) : super(key: key);
  @override
  State<TechNavigationView> createState() => _TechNavigationViewState();
}

class _TechNavigationViewState extends State<TechNavigationView> {
  int _selectedIndex = 0;

  /// 화면 이동시 dispose 된다
  /// GlobalKey() 없으면 모든 페이지가 동일
  /// 1번 페이지 보다가 다른 페이지 다녀오면 초기화되어 있음
  /// 내가 만들고자 하는 view에 따라 문제가 될 수도 있고 아닐 수도 있음
  /// 다른 view를 보더라도 kill 시키지는 않아야 한다 -> [Offstage]
  final stlViews = [
    StfScreen(key: GlobalKey()),
    StfScreen(key: GlobalKey()),
    Container(),
    StfScreen(key: GlobalKey()),
    StfScreen(key: GlobalKey()),
  ];

  final views = [
    const Center(
      child: Text('First'),
    ),
    const Center(
      child: Text('Second'),
    ),
    const Center(
      child: Text('XXX'),
    ),
    const Center(
      child: Text('Fourth'),
    ),
    const Center(
      child: Text('Fifth'),
    ),
  ];

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  void _onStackButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Container(),
        fullscreenDialog: true,
      ),
    );
  }

  /// [Scaffold] 한번에 한 화면만 그림
  /// 우리가 원하는 건 화면을 그리지만 사용자에게 시각적으로 보이지 않게 하는 것(화면은 alive~) -> [Stack] + [Offstage]
  /// [Offstage] = Creates a widget that visually hides its child.
  /// [Offstage]->[offstage] = false => visible
  /// [Offstage]->[offstage] = true => invisible
  /// [Offstage]->[children] 너무 많이 사용하면 안된다!!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const TechCustomGridView(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const TechNestedScrollView(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const TechCustomScrollView(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 110,
        padding: const EdgeInsets.all(Sizes.size12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              text: 'List',
              isSelected: _selectedIndex == 0,
              icon: CupertinoIcons.camera_on_rectangle,
              onTap: () => _onTap(0),
            ),
            NavTab(
              text: 'Grid',
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
              icon: CupertinoIcons.square_grid_3x2,
            ),
            Gaps.h20,
            GestureDetector(
              onTap: _onStackButtonTap,
              child: const StackButton(),
            ),
            Gaps.h20,
            NavTab(
              text: 'Nested',
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
              icon: CupertinoIcons.arrow_up_arrow_down,
            ),
            NavTab(
              text: 'Custom',
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
              icon: CupertinoIcons.arrow_up_arrow_down,
            )
          ],
        ),
      ),
    );
  }
}
