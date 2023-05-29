import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [CupertinoWidget]은 ThemeData가 적용이 안되는건가?
class TextFieldView extends StatefulWidget {
  const TextFieldView({Key? key}) : super(key: key);

  @override
  State<TextFieldView> createState() => _TextFieldViewState();
}

class _TextFieldViewState extends State<TextFieldView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController =
      TextEditingController(text: 'Initial');
  void _onChanged(String value) {
    print(value);
  }

  void _onSubmitted(String value) {
    print(value);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('TextField Type'),
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
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CupertinoSearchTextField',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Gaps.v14,

                            /// [selectionColor] -> main-[ThemeData]->[textSelectionTheme]에서 변경해줘야함
                            CupertinoSearchTextField(
                              controller: _textEditingController,
                              onChanged: _onChanged,
                              onSubmitted: _onSubmitted,
                            ),
                          ],
                        ),
                      ),
                      Gaps.v40,
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CupertinoTextField',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Gaps.v14,
                            CupertinoTextField(
                              controller: _textEditingController,
                              onChanged: _onChanged,
                              onSubmitted: _onSubmitted,
                              cursorColor: Colors.red,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.v40,
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TextField',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Gaps.v14,
                            TextField(
                              controller: _textEditingController,
                              onChanged: _onChanged,
                              onSubmitted: _onSubmitted,
                            ),
                          ],
                        ),
                      ),
                      Gaps.v40,
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TextField-obscureText(^)',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Gaps.v14,
                            const TextField(
                              obscureText: true,
                              obscuringCharacter: '^',
                            ),
                          ],
                        ),
                      ),
                      Gaps.v40,
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TextField - keyboardType(number)',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Gaps.v14,
                            const TextField(
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Gaps.v40,
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TextField - textInputAction(emergencyCall)',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Gaps.v14,
                            const TextField(
                              textInputAction: TextInputAction.emergencyCall,
                            ),
                          ],
                        ),
                      ),
                      Gaps.v40,
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TextField - prefix & suffix',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Gaps.v14,

                            /// suffix + suffixText 동시에 사용 못함
                            /// prefix + prefixText 동시에 사용 못함
                            const TextField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(CupertinoIcons.padlock),
                                suffixText: 'suffixText',
                                prefixIcon: Icon(CupertinoIcons.qrcode),
                                prefixText: 'prefixText',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gaps.v40,
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TextFormField',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Gaps.v14,
                            TextFormField(),
                          ],
                        ),
                      ),
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
