import 'package:dev_app_1/common/widgets/avatar.dart';
import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/scroll_view/widgets/tect_persistent_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// [CustomScrollView]
/// [slivers] : element inside of [CustomScrollView]
/// type of [slivers] :
class TechNestedScrollView extends StatefulWidget {
  const TechNestedScrollView({Key? key}) : super(key: key);

  @override
  State<TechNestedScrollView> createState() => _TechNestedScrollViewState();
}

class _TechNestedScrollViewState extends State<TechNestedScrollView> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              automaticallyImplyLeading: false,
              title: Text('Sliver App Bar Title'),
              pinned: true,
              // bottom: TabBar(
              //   tabs: [
              //     Tab(text: '123'),
              //     Tab(text: '123'),
              //   ],
              // ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Gaps.v20,
                  const Avatar(
                    radius: Sizes.size48,
                  ),
                  Gaps.v20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Username',
                        style: themeData.textTheme.titleLarge,
                      ),
                      Gaps.h10,
                      Icon(
                        CupertinoIcons.check_mark_circled_solid,
                        size: Sizes.size16,
                        color: themeData.colorScheme.tertiary,
                      )
                    ],
                  ),
                  Gaps.v24,

                  /// [VerticalDivider] needs a parent widget with a specific height
                  SizedBox(
                    height: Sizes.size64,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '1',
                              style: themeData.textTheme.titleLarge,
                            ),
                            Gaps.v3,
                            Text(
                              'Following',
                              style: themeData.textTheme.titleSmall,
                            ),
                          ],
                        ),

                        /// [VerticalDivider] needs a parent widget with a specific height
                        /// Wrap the [Row] in [SizedBox] which has specific height
                        VerticalDivider(
                          width: Sizes.size32,
                          thickness: Sizes.size1,
                          indent: Sizes.size10,
                          endIndent: Sizes.size24,
                          color: themeData.colorScheme.outline,
                        ),
                        Column(
                          children: [
                            Text(
                              '10.8M',
                              style: themeData.textTheme.titleLarge,
                            ),
                            Gaps.v3,
                            Text(
                              'Followers',
                              style: themeData.textTheme.titleSmall,
                            ),
                          ],
                        ),

                        /// [VerticalDivider] needs a parent widget with a specific height
                        /// Wrap the [Row] in [SizedBox] which has specific height
                        VerticalDivider(
                          width: Sizes.size32,
                          thickness: Sizes.size1,
                          indent: Sizes.size10,
                          endIndent: Sizes.size24,
                          color: themeData.colorScheme.outline,
                        ),
                        Column(
                          children: [
                            Text(
                              '106.2M',
                              style: themeData.textTheme.titleLarge,
                            ),
                            Gaps.v3,
                            Text(
                              'Likes',
                              style: themeData.textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gaps.v14,
                  FractionallySizedBox(
                    widthFactor: 1 / 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(
                          Sizes.size4,
                        ),
                      ),
                      // alignment: Alignment.center,
                      child: Text(
                        'Follow',
                        style: themeData.textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Gaps.v14,
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.size32,
                    ),
                    child: Text(
                      'All highlights and where to watch live matches on Flutter blah blah, it is so long sentence.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v14,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        CupertinoIcons.link,
                        size: Sizes.size16,
                      ),
                      Gaps.h10,
                      Text(
                        'https://techigh.github.com',
                        style: themeData.textTheme.labelLarge,
                      )
                    ],
                  ),
                  Gaps.v20,
                ],
              ),
            ),

            /// [SliverPersistentHeaderDelegate]로부터 extend 된 class를 별도로 생성해줘야한다
            /// 스크롤할때 붙어있어야 하는 부분
            /// 아래
            SliverPersistentHeader(
              pinned: true,
              delegate: TechPersistentTabBar(),
            ),
            // SliverPersistentHeader(
            //   pinned: true,
            //   delegate: CustomDelegate(),
            // )
          ];
        },
        body: TabBarView(
          children: [
            GridView.builder(
              /// 스크롤 할 때 자동으로 키보드 없어지게
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.zero,
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                // maxCrossAxisExtent: 200,
                crossAxisCount: 3,
                crossAxisSpacing: Sizes.size2,
                mainAxisSpacing: Sizes.size2,
                childAspectRatio: 9 / 14,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 14,
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/image1.jpg',
                      image:
                          "https://images.unsplash.com/photo-1614508569207-3d784965e917?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1286&q=80",
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text('data'),
            )
          ],
        ),
      ),
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.deepOrange,

      /// parent = maxExtent or minExtent
      /// [FractionallySizedBox] 없어도 작동 잘 되기는 하네?
      child: const FractionallySizedBox(
        heightFactor: 1,
        child: Center(
          child: Text(
            'Title!!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 50;

  /// Flutter에게 Persistant header가 보여져야하는지 여부를 알려줌
  /// maxExtent & minExtent 을 변경하고 싶으면 return true 해야함
  /// build에서 완전히 다른 widget tree를 return 한다면 return false 해야함
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
