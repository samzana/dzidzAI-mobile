import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/components/lessons/passage_widget.dart';
import 'package:dzidzai_mobile/components/lessons/word_count_textfield.dart';
import 'package:dzidzai_mobile/models/reading/summary_practice.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryPractice extends StatefulWidget {
  const SummaryPractice({
    super.key,
    required this.summaryPractice,
  });

  final SummaryPracticeModel summaryPractice;

  @override
  _SummaryPracticeState createState() => _SummaryPracticeState();
}

class _SummaryPracticeState extends State<SummaryPractice> {
  late ScrollController _scrollController;
  String? summary;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void checkSummary() {
    // check summary using llm.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text(
          'Comprehension Practice',
          style: TextStyle(
            fontFamily: 'Baloo 2',
            fontSize: 25,
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
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.summaryPractice.instructions[0],
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Baloo 2'),
                  ),
                  SizedBox(height: 20.h),
                  PassageWidget(
                    passage: widget.summaryPractice.passage,
                    scrollController: _scrollController,
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    widget.summaryPractice.instructions[1],
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Baloo 2',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.summaryPractice.instructions[2],
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Baloo 2',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.summaryPractice.instructions[3],
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Baloo 2',
                    ),
                  ),
                  SizedBox(height: 40.h),
                  WordCountTextField(),
                  SizedBox(height: 20.h),
                  AppButton(
                    text: "Check Summary",
                    color: black,
                    width: 390.w,
                    onPressed: checkSummary,
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
