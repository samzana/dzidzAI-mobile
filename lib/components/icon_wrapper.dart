import 'package:flutter/material.dart';

class IconWrapper extends StatelessWidget {
  const IconWrapper({
    super.key,
    required this.icon,
    required this.radius,
    required this.color,
  });

  final String icon;
  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        image: DecorationImage(
          image: AssetImage(icon),
        ),
      ),
    );
  }
}
