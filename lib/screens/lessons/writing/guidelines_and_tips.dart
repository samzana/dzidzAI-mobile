import 'package:dzidzai_mobile/models/writing/composition_tips.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GuidelinesAndTips extends StatelessWidget {
  final CompositionTipsModel compositionTips;

  const GuidelinesAndTips({
    super.key,
    required this.compositionTips,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          'Guidelines and Tips',
          style: TextStyle(
            fontFamily: 'Baloo 2',
            fontSize: 25.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: white,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text(
                  compositionTips.description,
                  style: TextStyle(
                    fontFamily: 'Baloo 2',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20.h),
                Text(
                  'Tips:',
                  style: TextStyle(
                    fontFamily: 'Baloo 2',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: black,
                  ),
                ),
                SizedBox(height: 10.h),
                ...compositionTips.tips.map(
                  (tip) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0.h),
                    child: Text(
                      '• $tip',
                      style: TextStyle(
                        fontFamily: 'Baloo 2',
                        fontSize: 16.sp,
                        color: black,
                      ),
                    ),
                  ),
                ),
                if (compositionTips.example != null) ...[
                  SizedBox(height: 20.h),
                  Text(
                    'Example:',
                    style: TextStyle(
                      fontFamily: 'Baloo 2',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    compositionTips.example!.prompt,
                    style: TextStyle(
                      fontFamily: 'Baloo 2',
                      fontSize: 16.sp,
                      color: black,
                    ),
                    textAlign: TextAlign.left,  // Changed alignment
                  ),
                  SizedBox(height: 10.h),
                  ...compositionTips.example!.points.map(
                    (point) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0.h),
                      child: Text(
                        '• $point',
                        style: TextStyle(
                          fontFamily: 'Baloo 2',
                          fontSize: 16.sp,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

