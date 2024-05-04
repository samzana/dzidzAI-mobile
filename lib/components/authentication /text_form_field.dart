import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key, 
    required this.controller,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(3.r),
      ),
      height: 68.h,
      width: 380.w,
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none
        ),
        keyboardType: keyboardType,
      ), 
    );
  }
}
