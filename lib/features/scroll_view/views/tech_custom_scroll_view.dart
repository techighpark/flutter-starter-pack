import 'package:dev_app_1/common/widgets/avatar.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return CustomScrollView(
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
              Avatar(),
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
