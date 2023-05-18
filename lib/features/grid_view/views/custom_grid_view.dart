import 'package:dev_app_1/common/widgets/avatar.dart';
import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class CustomGridView extends StatefulWidget {
  const CustomGridView({Key? key}) : super(key: key);

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    /// [DefaultTabController]
    /// [Scaffold] -> [appbar] -> [bottom] : [TabBar] 사용하려면
    /// [DefaultTabController] 없으면 에러
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                        size: Sizes.size20,
                      ),
                      suffixIcon: const Icon(
                        CupertinoIcons.xmark_circle_fill,
                        size: Sizes.size20,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            Sizes.size12,
                          ),
                          borderSide: BorderSide.none),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: Sizes.size2,
                        horizontal: Sizes.size20,
                      ),
                    ),
                  ),
                ),
              ),
              Gaps.h20,
              const Icon(
                CupertinoIcons.slider_horizontal_3,
                size: Sizes.size20,
              ),
            ],
          ),

          /// [PreferredSizeWidget]만 가능함
          /// 특정한 크기를 가지려고 하지만, 자식요소의 크기를 제한(constrain) 하지는 않는 위젯
          /// 자식 위젯이 부모 위젯의 사이즈 제한을 받지 않는 것
          ///
          /// [TabBar] needs [TabController] -> [DefaultTabController]로 [Scaffold] 감싸주기
          bottom: TabBar(
            /// tap 할때 번쩍 하는거
            splashFactory: NoSplash.splashFactory,
            dividerColor: Colors.transparent,
            labelStyle: Theme.of(context).textTheme.labelLarge,
            // labelColor: Theme.of(context).colorScheme.primary,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              padding: const EdgeInsets.all(
                Sizes.size6,
              ),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
            for (var tab in tabs.skip(1))
              Center(
                child: Text(tab),
              )
          ],
        ),
      ),
    );
  }
}
