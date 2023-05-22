import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/main_navigation/views/tech_navigation_view.dart';
import 'package:dev_app_1/features/main_navigation/views/tech_material_navigation_view.dart';
import 'package:dev_app_1/features/main_navigation/views/tech_cupertino_tab_bar_view.dart';
import 'package:dev_app_1/features/text_field/text_field_view.dart';
import 'package:dev_app_1/features/widget_navigation/views/tech_swipe_type_list_view.dart';
import 'package:dev_app_1/features/widget_navigation/views/tech_button_type_list_view.dart';
import 'package:dev_app_1/features/widget_navigation/widgets/bottom_sheets/modal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [Scaffold]
/// [resizeToAvoidBottomInset]
/// [showModalBottomSheet]
class TechWidgetListNavigation extends StatefulWidget {
  static String routeUrl = '/widgetnav';
  static String routeName = 'widgetnav';
  const TechWidgetListNavigation({Key? key}) : super(key: key);

  @override
  State<TechWidgetListNavigation> createState() =>
      _TechWidgetListNavigationState();
}

class _TechWidgetListNavigationState extends State<TechWidgetListNavigation> {
  final ScrollController _scrollController = ScrollController();
  void _onNavigationTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TechMaterialNavigationView(),
      ),
    );
  }

  void _onCustomNavigationTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TechNavigationView(),
      ),
    );
  }

  void _onCupertinoNavTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TechCupertinoTabBarView(),
      ),
    );
  }

  void _onButtonTypeTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TechButtonTypeListView(),
      ),
    );
  }

  void _onSwipeTypeTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TechSwipeTypeListView(),
      ),
    );
  }

  void _onTextFieldTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TextFieldView(),
      ),
    );
  }

  /// [BuildContext]를 안받아도 사용은 가능하지만 성능이 떨어진다
  void _onShowModalBottomSheetTap(BuildContext context) {
    showModalBottomSheet(
      context: context,

      /// [ListView]를 사용하려면
      /// [isScrollControlled] true로 설정해줘라!
      /// [bottomSheet] size 조절 가능
      isScrollControlled: true,

      /// [barrierColor]
      // barrierColor: Colors.red,
      /// bottom sheet radius
      /// with [ModalBottomSheet]>[Container]>[borderRadius]
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      builder: (context) => const ModalBottomSheet(),
    );
  }

  final scaffoldState = GlobalKey<ScaffoldState>();

  /// 별 짓거리를 해도 안됨
  /// [BuildContext]를 안받아도 사용은 가능하지만 성능이 떨어진다..하지만 Scaffold 내에서 작성해야한다
  void _onShowBottomSheetTap() {
    Scaffold.of(context).showBottomSheet(
      (context) => Container(),
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
      /// modal_bottom_sheet.dart > [Stack] + [Positioned] + [Scaffold] > [resizeToAvoidBottomInset]
      /// keyboard같은게 올라오면 scaffold 화면을 가리지 않도록 사이즈를 재조정한다
      /// true = 재조정 (default)
      /// false = 재조정 안함
      resizeToAvoidBottomInset: false,
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
              Text(
                'Bottom Sheet Type',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: CupertinoButton(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  onPressed: () => _onShowModalBottomSheetTap(context),
                  child: Text(
                    'showModalBottomSheet',
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
                  onPressed: null,
                  child: Text(
                    'showBottomSheet',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              Text(
                'Swipe View Type',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: CupertinoButton(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  onPressed: _onSwipeTypeTap,
                  child: Text(
                    'Swipe View',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              Text(
                'TextField Type',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: CupertinoButton(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  onPressed: _onTextFieldTap,
                  child: Text(
                    'TextField',
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
