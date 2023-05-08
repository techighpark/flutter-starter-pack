import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/material.dart';

/// [AnimatedContainer]
class SingleChildButton extends StatefulWidget {
  const SingleChildButton({
    super.key,
    required this.interest,
    required this.onInterestTap,
  });

  final String interest;
  final Function onInterestTap;

  @override
  State<SingleChildButton> createState() => _SingleChildButtonState();
}

class _SingleChildButtonState extends State<SingleChildButton> {
  bool _isSelected = false;
  void _onTap(String interest) {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onInterestTap(interest, _isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(widget.interest),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
          vertical: Sizes.size10,
        ),
        decoration: BoxDecoration(
          color: _isSelected
              ? Theme.of(context).colorScheme.surfaceTint
              : Theme.of(context).colorScheme.outlineVariant,
          borderRadius: BorderRadius.circular(Sizes.size20),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.inversePrimary,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Text(
          widget.interest,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: _isSelected ? FontWeight.w900 : FontWeight.w400,
                color: _isSelected
                    ? Theme.of(context).colorScheme.onInverseSurface
                    : Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
