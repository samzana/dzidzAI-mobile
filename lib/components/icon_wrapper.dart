import 'package:flutter/material.dart';

class IconWrapper extends StatelessWidget {
  const IconWrapper({
    super.key,
    required this.icon,
    required this.radius,
    required this.color,
    required this.fillColor,
  });

  final String icon;
  final double radius;
  final Color color;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          fillColor, 
          BlendMode.srcIn, 
        ),
        child: Image.asset(
          icon,
        ),
      ),
    );
  }
}

