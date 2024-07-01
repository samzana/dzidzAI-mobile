import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/components/lessons/passage_widget.dart';
import 'package:dzidzai_mobile/models/reading/comprehension_practice.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComprehensionPractice extends StatefulWidget {
  const ComprehensionPractice({
    super.key,
    required this.comprehensionPractice,
  });

  final ComprehensionPracticeModel comprehensionPractice;

  @override
  _ComprehensionPracticeState createState() => _ComprehensionPracticeState();
}

class _ComprehensionPracticeState extends State<ComprehensionPractice> {
  late ScrollController _scrollController;
  String? answer;
  int questionNumber = 0;
  bool _isAnswered = false;

  void checkAnswer(){
    setState(() {
      _isAnswered = true;
      // check answer using llm. 
    });
  }

  void nextQuestion() {
    if (questionNumber < widget.comprehensionPractice.questions.length - 1) {
      setState(() {
        _isAnswered = false;
        questionNumber++;
        answer = null;
      });
    } else {
      // You can show a message or handle the end of the question list here
    }
  }

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
                      widget.comprehensionPractice.instructions,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Baloo 2'),
                    ),
                    SizedBox(height: 20.h),
                    PassageWidget(
                      passage: widget.comprehensionPractice.passage,
                      scrollController: _scrollController,
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      'From paragraph ${widget.comprehensionPractice.questions[questionNumber].paragraphNumber}:',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Baloo 2',
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      widget.comprehensionPractice.questions[questionNumber]
                          .question,
                      style: TextStyle(fontSize: 18.sp, fontFamily: 'Baloo 2'),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            answer = value;
                          });
                        },
                        maxLines: 2,
                        style: TextStyle(
                          color: black,
                          fontFamily: 'Baloo 2',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        ),
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
                    ),
                    SizedBox(height: 20.h),
                    if (!_isAnswered)
                      AppButton(
                        text: 'Submit Answer',
                        color: black,
                        width: 400.w,
                        onPressed: () {
                          checkAnswer();
                        },
                      ),
                    if (_isAnswered)
                      AppButton(
                        text: 'Next Question',
                        color: black,
                        width: 400.w,
                        onPressed: () {
                          nextQuestion();
                        },
                      )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
