import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WordCountTextField extends StatefulWidget {
  @override
  _WordCountTextFieldState createState() => _WordCountTextFieldState();
}

class _WordCountTextFieldState extends State<WordCountTextField> {
  final TextEditingController _controller = TextEditingController();
  int _wordCount = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateWordCount);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateWordCount);
    _controller.dispose();
    super.dispose();
  }

  void _updateWordCount() {
    setState(() {
      _wordCount = _controller.text.trim().isEmpty
          ? 0
          : _controller.text.trim().split(RegExp(r'\s+')).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
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
            'Word Count: $_wordCount / 160',
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
