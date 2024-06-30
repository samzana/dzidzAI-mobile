import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassageWidget extends StatelessWidget {
  const PassageWidget({
    super.key,
    required this.passage,
    required this.scrollController,
  });

  final List<String> passage;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 300.h, 
      ),
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 2),
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
          child: ListView.builder(
            itemCount: passage.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${index + 1}.',
                        style: const TextStyle(fontSize: 16, color: black, fontWeight: FontWeight.w700, fontFamily: 'Baloo 2'),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        child: Text(
                          passage[index],
                          style: const TextStyle(fontSize: 16, color: black, fontFamily: 'Baloo 2',),
                        ),
                      ),
                    ],
                  ),
                  // Add vertical spacing between paragraphs
                  if (index < passage.length - 1) // Avoid adding space after the last paragraph
                    const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

