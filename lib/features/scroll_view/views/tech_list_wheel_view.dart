import 'package:flutter/material.dart';

class TechListWheelView extends StatefulWidget {
  const TechListWheelView({Key? key}) : super(key: key);

  @override
  State<TechListWheelView> createState() => _TechListWheelViewState();
}

class _TechListWheelViewState extends State<TechListWheelView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Wheel View'),
        // automaticallyImplyLeading: false,
        actions: const [
          CloseButton(),
        ],
      ),
      body: ListWheelScrollView(
        // useMagnifier: true,
        // magnification: 3,

        // diameterRatio: 5,

        // offAxisFraction: 2,

        itemExtent: 200,
        children: [
          for (var x in [1, 2, 3, 1, 2, 45, 6, 78, 4])
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                alignment: Alignment.center,
                color: Colors.pink,
                child: Text('Pick me'),
              ),
            )
        ],
      ),
    );
  }
}
