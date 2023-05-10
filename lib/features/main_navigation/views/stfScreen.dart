import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({Key? key}) : super(key: key);

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _count = 0;
  void _increase() {
    _count += 1;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_count',
            style: const TextStyle(
              fontSize: 48,
            ),
          ),
          TextButton(
            onPressed: _increase,
            child: const Text(
              '+',
              style: TextStyle(
                fontSize: 48,
              ),
            ),
          )
        ],
      ),
    );
  }
}
