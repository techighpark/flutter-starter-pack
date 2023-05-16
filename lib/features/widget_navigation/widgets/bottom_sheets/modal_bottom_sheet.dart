import 'package:dev_app_1/common/widgets/avatar.dart';
import 'package:dev_app_1/common/widgets/form_text_field.dart';
import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [ListView.builder]
/// [ListView.separated]
/// [automaticallyImplyLeading]
///
class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  bool _isWriting = false;

  int textLines = 1;
  final double _initialHeight = 40;
  final double _increaseHeight = 25;
  double _textFieldHeight = 40;

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _onStopWriting() {
    FocusScope.of(context).unfocus();
    _isWriting = false;
    _textFieldHeight = _initialHeight;
    setState(() {});
  }

  void _onStartWriting() {
    _isWriting = true;
    if (textLines > 1) {
      _textFieldHeight = _initialHeight + (textLines - 1) * _increaseHeight;
    }
    setState(() {});
  }

  void _onChanged(value) {
    final length = value.split('\n').length;
    if (length < 4 && length > 1) {
      textLines = length;
      _textFieldHeight = _initialHeight + (textLines - 1) * _increaseHeight;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      /// bottomSheet의 높이는 지정했지만 적용되지 않음
      /// [showModalBottomSheet] > [isScrollControlled] 설정해야함
      height: size.height * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ModalBottomSheet'),

          /// [automaticallyImplyLeading] = back button
          /// true = visible
          /// false = invisible
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const Icon(
                CupertinoIcons.xmark,
              ),
            )
          ],
        ),

        /// [Stack] + [Positioned] + widget_navigation.dart > [Scaffold] > [resizeToAvoidBottomInset]
        /// keyboard 올라올 때 bottomNavigationBar 가려지는 것을 막기 위해서
        /// 1
        /// [Stack] > [children] z-index? 가장 먼저 작성된 위젯이 가장 아래에 존재
        /// [Positioned]의 anchor point? Stack 크기 기준
        ///
        /// [GestureDetector] keyboard 외의 것을 탭했을 때 keyboard 사라지도록
        body: GestureDetector(
          onTap: _onStopWriting,
          child: Stack(
            children: [
              // Positioned(
              //   top: 0,
              //
              //   /// [Positioned]의 넓이가 필요하다!
              //   width: MediaQuery.of(context).size.width,
              //   child: Container(
              //     color: Colors.white,
              //     padding: EdgeInsets.only(
              //       bottom: MediaQuery.of(context).padding.bottom,
              //       top: Sizes.size10,
              //     ),
              //     child: Row(
              //       children: const [
              //         Avatar(),
              //         Gaps.h10,
              //         Expanded(
              //           child: TextField(),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              ListView.separated(
                padding: const EdgeInsets.only(
                  top: Sizes.size12,
                  bottom: Sizes.size96,
                  left: Sizes.size20,
                  right: Sizes.size20,
                ),
                itemCount: 10,
                separatorBuilder: (context, index) => Gaps.v20,
                itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Avatar(),
                    Gaps.h20,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'user id',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: Colors.grey.shade500,
                                ),
                          ),
                          Gaps.v3,
                          // Text(
                          //     'MediaQuery - padding : ${MediaQuery.of(context).padding}'),
                          // Text(
                          //     'MediaQuery - viewPadding : ${MediaQuery.of(context).viewPadding}'),
                          // Text(
                          //     'MediaQuery - viewInsets : ${MediaQuery.of(context).viewInsets}'),
                          const Text(
                            "That's not it i've seen the same thing but also in a cave and so on. That's not it i've seen the same thing but also in a cave and so on. That's not it i've seen the same thing but also in a cave and so on.",
                          ),
                        ],
                      ),
                    ),
                    Gaps.h20,
                    Column(
                      children: [
                        Icon(
                          CupertinoIcons.heart,
                          color: Colors.grey.shade500,
                        ),
                        Text(
                          '23.4M',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.grey.shade500,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// [Stack] + [Positioned] + widget_navigation.dart > [Scaffold] > [resizeToAvoidBottomInset]
              /// keyboard 올라올 때 bottomNavigationBar 가려지는 것을 막기 위해서
              /// [bottomAppBar] no!
              /// 2
              Positioned(
                bottom: 0,

                /// [Positioned]의 넓이가 필요하다!
                /// 아니면 에러
                width: size.width,
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom,
                    top: Sizes.size10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: Sizes.size20,
                      right: Sizes.size20,
                      bottom: Sizes.size10,
                      top: Sizes.size5,
                    ),
                    child: Row(
                      children: [
                        Avatar(),
                        Gaps.h20,
                        Expanded(
                          /// [contentPadding] 작은 값은 적용이 안되므로 TextField를 SizedBox로 감싸서 높이 지정해야한다.
                          child: SizedBox(
                            height: _textFieldHeight,
                            child: TextField(
                              textAlignVertical: _isWriting
                                  ? TextAlignVertical.top
                                  : TextAlignVertical.bottom,

                              /// 탭했을 경우(입력 시작) -> 버튼 생성되도록
                              /// 입력 종료하였을 경우 -> 버튼 사라짐 = _onStopWriting
                              onTap: _onStartWriting,
                              style: Theme.of(context).textTheme.labelLarge,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size12,
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  /// [contentPadding] 작은 값은 적용이 안되므로 TextField를 SizedBox로 감싸서 높이 지정해야한다.
                                  horizontal: Sizes.size12,
                                  vertical: Sizes.size10,
                                ),
                                filled: true,
                                // fillColor: Colors.grey.shade500,
                                hintText: 'Write a comment...',
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    right: Sizes.size14,
                                    top: Sizes.size10,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            CupertinoIcons.at,
                                          ),
                                          Gaps.h10,
                                          const Icon(
                                            CupertinoIcons.gift,
                                          ),
                                          Gaps.h10,
                                          const Icon(
                                            CupertinoIcons.smiley,
                                          ),
                                          Gaps.h10,
                                          if (_isWriting)
                                            GestureDetector(
                                              onTap: _onStopWriting,
                                              child: Icon(
                                                CupertinoIcons
                                                    .arrow_up_circle_fill,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              /// [textInputAction] send, return, newline, join, etc.
                              textInputAction: TextInputAction.newline,

                              /// [textInput]
                              onChanged: _onChanged,

                              /// [expands] for [TextInputAction.newline]
                              /// error 발생
                              /// 해결하기 위해서는
                              /// for expand - [TextField] > [minLines]: null & [maxLines]: null
                              expands: true,
                              minLines: null,
                              maxLines: null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        /// [bottomNavigationBar]사용하면 keyboard올라올 때 가려지게 된다.
        // bottomNavigationBar: Container(
        //   padding: EdgeInsets.only(
        //     bottom: MediaQuery.of(context).padding.bottom,
        //     top: Sizes.size10,
        //   ),
        //   child: Row(
        //     children: [
        //       Avatar(),
        //       Gaps.h10,
        //       Expanded(
        //         child: TextField(),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
