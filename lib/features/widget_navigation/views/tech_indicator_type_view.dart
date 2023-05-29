import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/buttons/widgets/tech_cupertino_button.dart';
import 'package:dev_app_1/features/scroll_view/views/tech_custom_grid_view.dart';
import 'package:dev_app_1/features/scroll_view/views/tech_custom_scroll_view.dart';
import 'package:dev_app_1/features/scroll_view/views/tech_list_tile_view.dart';
import 'package:dev_app_1/features/scroll_view/views/tech_list_wheel_view.dart';
import 'package:dev_app_1/features/scroll_view/views/tech_nested_scroll_view.dart';
import 'package:dev_app_1/features/widget_navigation/widgets/buttons/stack_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TechIndicatorTypeView extends StatefulWidget {
  const TechIndicatorTypeView({Key? key}) : super(key: key);

  @override
  State<TechIndicatorTypeView> createState() => _TechIndicatorTypeViewState();
}

class _TechIndicatorTypeViewState extends State<TechIndicatorTypeView>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  void _onPressed() {}

  late final Animation<double> _arrowAnimation = Tween(
    begin: 0.0,
    end: 0.5,
  ).animate(_animationController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List & Scroll View Type'),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () async {
            // Replace this delay with the code to be executed during refresh
            // and return a Future when code finishes execution.
            return Future<void>.delayed(const Duration(seconds: 3));
          },
          color: Colors.white,
          backgroundColor: Colors.blue,
          strokeWidth: 4.0,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
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
                        const CupertinoActivityIndicator(
                          color: Colors.pink,
                        ),
                        Gaps.v10,
                        const CircularProgressIndicator(
                          color: Colors.deepOrange,
                        ),
                        Gaps.v10,
                        const CircularProgressIndicator.adaptive(),
                        Gaps.v10,
                        // GlowingOverscrollIndicator(
                        //   axisDirection: AxisDirection.right,
                        //   color: Colors.red,
                        // ),
                        const RefreshProgressIndicator(),
                        const LinearProgressIndicator(),
                        NavigationIndicator(
                          animation: _arrowAnimation,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show refresh indicator programmatically on button tap.
          _refreshIndicatorKey.currentState?.show();
        },
        icon: const Icon(Icons.refresh),
        label: const Text('Show Indicator'),
      ),
    );
  }
}
