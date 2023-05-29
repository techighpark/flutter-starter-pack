import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TechCupertinoButton extends StatefulWidget {
  final String text;
  final Widget child;

  const TechCupertinoButton({Key? key, required this.text, required this.child})
      : super(key: key);

  @override
  State<TechCupertinoButton> createState() => _TechCupertinoButtonState();
}

class _TechCupertinoButtonState extends State<TechCupertinoButton> {
  void _onPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget.child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: CupertinoButton(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        onPressed: _onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
