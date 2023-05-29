import 'package:dev_app_1/common/widgets/avatar.dart';
import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// [CustomScrollView]
/// [slivers] : element inside of [CustomScrollView]
/// type of [slivers] :
class TechCustomScrollView extends StatefulWidget {
  const TechCustomScrollView({Key? key}) : super(key: key);

  @override
  State<TechCustomScrollView> createState() => _TechCustomScrollViewState();
}

class _TechCustomScrollViewState extends State<TechCustomScrollView> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        /// [slivers] are scrollable portion(region)
        slivers: [
          SliverAppBar(
            title: const Text('Title of SliverAppBar'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.gear_solid,
                  size: Sizes.size28,
                ),
              )
            ],
            automaticallyImplyLeading: false,
            elevation: 1,
            backgroundColor: Colors.red,

            /// app bar height = n 부터 스크롤됨
            collapsedHeight: 80,

            /// app bar height = m 까지 확장됨
            expandedHeight: 200,

            /// 아래로 스크롤 가능
            stretch: true,

            /// the [SliverAppBar] immediately visible when scrolling up, regardless of position
            floating: true,

            /// 스크롤이 되어도 [SliverAppBar]가 표시되도록
            /// min height = [collapsedHeight]
            pinned: true,

            /// The "snap" argument only makes sense for floating app bars.
            /// [floating] = false 일 경우, 사용할 수 없음
            /// 위로 스크롤하면 즉시 [SliverAppBar]가 나타남
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Display Name inside FlexibleSpaceBar'),
              background: Image.asset(
                'assets/images/image1.jpg',
                fit: BoxFit.cover,
              ),

              /// [SliverAppBar] - [stretch] true 일 때
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,

                /// [FlexibleSpaceBar] - title
                /// NOT [SliverAppBar] - title
                StretchMode.fadeTitle,
              ],
            ),
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

                /// [TabBar] needs [TabController] -> Wrap [CustomScrollView] in [DefaultTabController]
                Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: themeData.colorScheme.onInverseSurface,
                        width: 0.5,
                      ),
                    ),
                  ),

                  /// To use [TabBar], you have to put the [TabBarView] together.
                  /// If you put [SliverGrid] separately, you can't sync each other.
                  /// here is problem!
                  /// BIG PROBLEM
                  child: const TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                    ),
                    tabs: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Icon(
                          CupertinoIcons.game_controller,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Icon(
                          CupertinoIcons.heart,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    children: [
                      GridView.builder(
                        /// 스크롤 할 때 자동으로 키보드 없어지게
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: const EdgeInsets.all(
                          Sizes.size6,
                        ),
                        itemCount: 20,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          // maxCrossAxisExtent: 200,
                          crossAxisCount: 2,
                          crossAxisSpacing: Sizes.size10,
                          mainAxisSpacing: Sizes.size10,
                          childAspectRatio: 9 / 20,
                        ),
                        itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Sizes.size6,
                                ),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: AspectRatio(
                                aspectRatio: 9 / 16,
                                child: FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: 'assets/images/image1.jpg',
                                  image:
                                      "https://images.unsplash.com/photo-1614508569207-3d784965e917?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1286&q=80",
                                ),
                              ),
                            ),
                            Gaps.v10,
                            const Text(
                              "This is very long caption for my devapp that i'm upload just now currently",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Gaps.v10,

                            /// 안에 있는 text style 공통으로 지정
                            DefaultTextStyle(
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w600,
                              ),
                              child: Row(
                                children: [
                                  const Avatar(
                                    radius: Sizes.size12,
                                  ),
                                  Gaps.h10,
                                  const Expanded(
                                    child: Text(
                                      'long_username that overflow the row',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: Sizes.size14,
                                      ),
                                    ),
                                  ),
                                  Gaps.h10,
                                  Icon(
                                    CupertinoIcons.heart,
                                    size: Sizes.size14,
                                    color: Colors.grey.shade500,
                                  ),
                                  Gaps.h10,
                                  const Text(
                                    '2.5M',
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Text('data'),
                      )
                    ],
                  ),
                ),
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //         height: 50,
                //         child: CupertinoButton(
                //           color: Colors.red,
                //           child: const Text(
                //             'Button',
                //           ),
                //           onPressed: () {},
                //         ),
                //       ),
                //       Container(
                //         height: 50,
                //         child: ElevatedButton(
                //           // padding: EdgeInsets.zero,
                //           // color: Colors.red,
                //           style: ButtonStyle(
                //             shape: MaterialStateProperty.all(
                //               RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(5.0),
                //               ),
                //             ),
                //           ),
                //           child: const Text(
                //             'Button',
                //           ),
                //           onPressed: () {},
                //         ),
                //       ),
                //       Container(
                //         height: 50,
                //         child: OutlinedButton(
                //           onPressed: () {},
                //           style: ButtonStyle(
                //             shape: MaterialStateProperty.all(
                //               RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(5.0),
                //               ),
                //             ),
                //           ),
                //           child: const Icon(
                //             CupertinoIcons.heart,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SizedBox(
                //         height: 50,
                //         child: CupertinoButton(
                //           color: Colors.red,
                //           child: const Text(
                //             'Button',
                //           ),
                //           onPressed: () {},
                //         ),
                //       ),
                //       SizedBox(
                //         height: 50,
                //         child: ElevatedButton(
                //           // padding: EdgeInsets.zero,
                //           // color: Colors.red,
                //           style: ButtonStyle(
                //             shape: MaterialStateProperty.all(
                //               RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(5.0),
                //               ),
                //             ),
                //           ),
                //           child: const Text(
                //             'Button',
                //           ),
                //           onPressed: () {},
                //         ),
                //       ),
                //       SizedBox(
                //         height: 50,
                //         child: OutlinedButton(
                //           onPressed: () {},
                //           style: ButtonStyle(
                //             shape: MaterialStateProperty.all(
                //               RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(5.0),
                //               ),
                //             ),
                //           ),
                //           child: const Icon(
                //             CupertinoIcons.heart,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                //   Flex(
                //     direction: Axis.horizontal, // 또는 Axis.vertical
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Container(width: 50, height: 50, color: Colors.red),
                //       Container(width: 50, height: 50, color: Colors.blue),
                //       Container(width: 50, height: 50, color: Colors.green),
                //     ],
                //   ),
                //   Gaps.v32,
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Container(width: 50, height: 50, color: Colors.red),
                //       Container(width: 50, height: 50, color: Colors.blue),
                //       Container(width: 50, height: 50, color: Colors.green),
                //     ],
                //   )
              ],
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) => Container(
                color: Colors.green[100 * (index % 9)],
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$index Item',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),

            /// item height
            itemExtent: 100,
          ),

          /// [SliverPersistentHeaderDelegate]로부터 extend 된 class를 별도로 생성해줘야한다
          /// 스크롤할때 붙어있어야 하는 부분
          /// 아래
          SliverPersistentHeader(
            delegate: CustomDelegate(),
            pinned: true,

            /// if you want to know what this property does, remove pinned:true in [SliverAppBar]
            /// the [SliverPersistentHeaderDelegate] immediately visible when scrolling up, regardless of position
            floating: true,
          ),
          SliverGrid(
            ///[SliverFixedExtentList] - reference within delegate
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) => Container(
                color: Colors.indigo[100 * (index % 9)],
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$index Item',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),

            ///[GridView.builder] - reference within gridDelegate
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              mainAxisSpacing: Sizes.size20,
              crossAxisSpacing: Sizes.size20,
              childAspectRatio: 1,
            ),
          )
        ],
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
