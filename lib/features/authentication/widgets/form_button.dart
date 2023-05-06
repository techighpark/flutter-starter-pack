import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  final bool disabledButton;
  final Function onSubmit;

  const FormButton({
    Key? key,
    required this.disabledButton,
    required this.onSubmit,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: CupertinoButton.filled(
        onPressed: disabledButton ? null : () => onSubmit(),
        disabledColor: Theme.of(context).colorScheme.outline,
        child: Padding(
          padding: EdgeInsets.zero,
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              color: disabledButton
                  ? Theme.of(context).colorScheme.outlineVariant
                  : Theme.of(context).colorScheme.onPrimary,
            ),
            duration: const Duration(milliseconds: 500),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
