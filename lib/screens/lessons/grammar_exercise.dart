import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/models/grammar_exercise.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GrammarExercise extends StatefulWidget {
  const GrammarExercise(
      {super.key, required this.title, required this.question});

  final String title;
  final GrammarExerciseModel question;

  @override
  _GrammarExerciseState createState() => _GrammarExerciseState();
}

class _GrammarExerciseState extends State<GrammarExercise> {
  bool _isAnswered = false;
  bool _isCorrect = false;
  String? answer;

  void checkAnswer() {
    setState(() {
      _isAnswered = true;
      _isCorrect = answer == widget.question.answer;
    });
  }

  Color _getButtonColor(int index) {
    String option = widget.question.options![index];

    if (_isAnswered) {
      if (answer == option) {
        return _isCorrect ? Colors.green : Colors.red;
      } else {
        return Colors.white;
      }
    } else {
      return answer == option ? Colors.blue : Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          '${widget.title} Practice',
          style: const TextStyle(
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
            child: Padding(
              padding: EdgeInsets.all(
                16.r,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      widget.question.instructions,
                      style: TextStyle(
                        color: black,
                        fontFamily: 'Baloo 2',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.all(24.r),
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    width: 370.w,
                    child: Text(
                      widget.question.question,
                      style: TextStyle(
                        fontFamily: 'Baloo 2',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 60.h),
                  if (widget.question.type == 'mcq')
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 170.w,
                            height: 68.h,
                            child: ElevatedButton(
                              onPressed: () {
                                _isAnswered 
                                ? () {}
                                : setState(() {
                                  answer = widget.question.options![0];
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _getButtonColor(0),
                                elevation: 10.h,
                                shadowColor: black,
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  side: BorderSide(color: darkGrey, width: 1.r),
                                ),
                              ),
                              child: Text(
                                widget.question.options![0],
                                style: TextStyle(
                                  color: black,
                                  fontFamily: 'Baloo 2',
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 170.w,
                            height: 70.h,
                            child: ElevatedButton(
                              onPressed: () {
                                _isAnswered 
                                ? () {}
                                : setState(() {
                                  answer = widget.question.options![1];
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _getButtonColor(1),
                                elevation: 10.h,
                                shadowColor: black,
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  side: BorderSide(color: darkGrey, width: 1.r),
                                ),
                              ),
                              child: Text(
                                widget.question.options![1],
                                style: TextStyle(
                                  color: black,
                                  fontFamily: 'Baloo 2',
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 20.h),
                  !_isAnswered
                      ? Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: AppButton(
                            text: 'Check Answer',
                            color: black,
                            width: 370,
                            onPressed: () {
                              setState(() {
                                // Check if the answer is correct
                                checkAnswer();
                              });
                            },
                          ),
                      )
                      : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                            children: [
                              Text(
                                answer == widget.question.answer
                                    ? 'Correct! ${widget.question.feedback}'
                                    : 'Incorrect, the correct answer is ${widget.question.answer}. ${widget.question.feedback}',
                                style: TextStyle(
                                  fontFamily: 'Baloo 2',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800,
                                  color: answer == widget.question.answer ? green : red,
                                ),
                              ),
                              SizedBox(height: 60.h),
                              AppButton(
                                text: 'Next Question',
                                color: black,
                                width: 370,
                                onPressed: () {
                                  setState(() {
                                    // Load the next question
                                  });
                                },
                              ),
                            ],
                          ),
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
