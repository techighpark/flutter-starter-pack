import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldView extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  TextFieldView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            CupertinoSearchTextField(),
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
                            CupertinoTextField(),
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
                            TextField(),
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
                            TextField(
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
                            TextField(
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
