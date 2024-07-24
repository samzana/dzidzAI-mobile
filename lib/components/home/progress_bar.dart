import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({
    super.key,
    required this.progress,
    required this.height,
    required this.width,

  });

  final double progress;
  final double height;
  final double width;

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double _currentProgress = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _currentProgress = widget.progress;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1), 
            curve: Curves.easeInOut, 
            width: widget.width * _currentProgress, 
            height: widget.height,
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
        ],
      ),
    );
  }
}
