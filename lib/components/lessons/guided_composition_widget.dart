import 'package:dzidzai_mobile/models/writing/guided_compositions_practice.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuidedCompositionWidget extends StatelessWidget {
  const GuidedCompositionWidget({
    super.key,
    required this.composition,
    required this.scrollController,
  });

  final GuidedCompositionsPracticeModel composition;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 350.h,
      ),
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all<Color>(blue),
          minThumbLength: 10.h,
        ),
        child: Scrollbar(
          thumbVisibility: true,
          thickness: 10.w,
          radius: Radius.circular(10.r),
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    composition.prompt,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Baloo 2',
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Use some or all of the following points and add other ideas of your own:',
                    style: TextStyle(
                      fontFamily: 'Baloo 2',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: composition.points.map((point) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          '     . $point',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: black,
                            fontFamily: 'Baloo 2',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
