import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double radius;

  const ProfileAvatar({
    super.key,
    this.radius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: lightBlue,
      child: Icon(
              Icons.camera_alt,
              size: radius,
              color: Colors.grey[800],
            )
    );
  }
}