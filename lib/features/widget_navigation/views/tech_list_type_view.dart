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

class TechListTypeView extends StatefulWidget {
  const TechListTypeView({Key? key}) : super(key: key);

  @override
  State<TechListTypeView> createState() => _TechListTypeViewState();
}

class _TechListTypeViewState extends State<TechListTypeView> {
  final ScrollController _scrollController = ScrollController();

  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List & Scroll View Type'),
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
                    children: const [
                      Gaps.v4,
                      TechCupertinoButton(
                        text: 'List Tile',
                        child: TechListTileView(),
                      ),
                      Gaps.v4,
                      TechCupertinoButton(
                        text: 'List Wheel View',
                        child: TechListWheelView(),
                      ),
                      Gaps.v4,
                      TechCupertinoButton(
                        text: 'Grid View',
                        child: TechCustomGridView(),
                      ),
                      Gaps.v4,
                      TechCupertinoButton(
                        text: 'Custom Scroll View',
                        child: TechCustomScrollView(),
                      ),
                      Gaps.v4,
                      TechCupertinoButton(
                        text: 'Nested Scroll View',
                        child: TechNestedScrollView(),
                      )
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
