import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: Sizes.size20,
      child: Text('Avat'),
    );
  }
}
