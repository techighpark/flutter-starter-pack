import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double radius;
  const Avatar({Key? key, this.radius = Sizes.size20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: const Text('Avat'),
    );
  }
}
