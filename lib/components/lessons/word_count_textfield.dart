import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WordCountTextField extends StatefulWidget {
  const WordCountTextField({
    super.key,
    required this.wordCount,
    required this.controller,
  });

  final int wordCount;
  final TextEditingController controller;

  @override
  _WordCountTextFieldState createState() => _WordCountTextFieldState();
}

class _WordCountTextFieldState extends State<WordCountTextField> {
  int _wordCount = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateWordCount);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateWordCount);
    super.dispose();
  }

  void _updateWordCount() {
    setState(() {
      _wordCount = widget.controller.text.trim().isEmpty
          ? 0
          : widget.controller.text.trim().split(RegExp(r'\s+')).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'Type your answer here',
            hintStyle: TextStyle(
              color: darkGrey,
              fontFamily: 'Baloo 2',
              fontSize: 18.sp,
              //fontWeight: FontWeight.w800,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: darkGrey, width: 2.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: black, width: 2.r),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Text(
            'Word Count: $_wordCount / ${widget.wordCount}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
