import 'package:flutter/material.dart';

class BottomTabWidget extends StatelessWidget {
  const BottomTabWidget({
    super.key,
    required this.icon,
    required this.selectIcon,
    required this.isActive,
    required this.onTap,
  });
  final String icon;
  final String selectIcon;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          height: 40,
          width: 40,
          color: isActive ? Colors.brown.shade600 : Colors.grey,
          isActive ? selectIcon : icon,
        ),
        if (isActive)
          SizedBox(
            height: isActive ? 8 : 12,
          ),
        if (isActive)
          Container(
            height: 4,
            width: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.brown.shade600),
          )
      ]),
    );
  }
}
