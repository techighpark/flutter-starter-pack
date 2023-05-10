import 'package:dev_app_1/constants/gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final IconData icon;
  final Function onTap;

  const NavTab({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override

  /// [Expanded] + [Container]->[color] 설정 해주면 전체로 확장됨
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.black.withOpacity(0.0),
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.3,
            duration: const Duration(milliseconds: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon),
                Gaps.v5,
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
