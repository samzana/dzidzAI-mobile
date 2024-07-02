import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/models/grammar/grammar_exercise.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GrammarExercise extends StatefulWidget {
  const GrammarExercise({
    super.key,
    required this.title,
    required this.questions,
  });

  final String title;
  final List<GrammarExerciseModel> questions;

  @override
  _GrammarExerciseState createState() => _GrammarExerciseState();
}

class _GrammarExerciseState extends State<GrammarExercise> {
  int _currentIndex = 0;
  bool _isAnswered = false;
  bool _isCorrect = false;
  String? answer;

  void checkAnswer() {
    setState(() {
      _isAnswered = true;
      _isCorrect = answer == widget.questions[_currentIndex].answer;
    });
  }

  void nextQuestion() {
    if (_currentIndex < widget.questions.length - 1) {
      setState(() {
        _currentIndex++;
        _isAnswered = false;
        answer = null;
      });
    } else {
      // You can show a message or handle the end of the question list here
    }
  }

  Color _getButtonColor(int index) {
    String option = widget.questions[_currentIndex].options![index];

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
    var currentQuestion = widget.questions[_currentIndex];

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
                      currentQuestion.instructions,
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
                      currentQuestion.question,
                      style: TextStyle(
                        fontFamily: 'Baloo 2',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  if (currentQuestion.type == 'mcq') SizedBox(height: 20.h),
                  if (currentQuestion.type == 'mcq')
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
                                        answer = currentQuestion.options![0];
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
                                currentQuestion.options![0],
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
                                        answer = currentQuestion.options![1];
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
                                currentQuestion.options![1],
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
                  if (currentQuestion.type == 'mcq') SizedBox(height: 20.h),
                  if (currentQuestion.type == 'mcq')
                    !_isAnswered
                        ? Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: AppButton(
                              text: 'Check Answer',
                              color: black,
                              width: 370.w,
                              onPressed: () {
                                setState(() {
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
                                  answer == currentQuestion.answer
                                      ? 'Correct! ${currentQuestion.feedback}'
                                      : 'Incorrect, the correct answer is ${currentQuestion.answer}. ${currentQuestion.feedback}',
                                  style: TextStyle(
                                    fontFamily: 'Baloo 2',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w800,
                                    color: answer == currentQuestion.answer
                                        ? green
                                        : red,
                                  ),
                                ),
                                SizedBox(height: 60.h),
                                AppButton(
                                  text: 'Next Question',
                                  color: black,
                                  width: 400.w,
                                  onPressed: nextQuestion,
                                ),
                              ],
                            ),
                          ),
                  if (currentQuestion.type == 'rewriteSentence')
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            answer = value;
                          });
                        },
                        maxLines: 4,
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
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
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
                  if (currentQuestion.type == 'rewriteSentence')
                    !_isAnswered
                        ? Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: AppButton(
                              text: 'Check Answer',
                              color: black,
                              width: 390.w,
                              onPressed: () {
                                setState(() {
                                  checkAnswer();
                                });
                              },
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 20.w),
                            child: Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: answer == currentQuestion.answer
                                        ? 'Correct! The answer is '
                                        : 'Incorrect, the correct answer is ',
                                    style: TextStyle(
                                      fontFamily: 'Baloo 2',
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w800,
                                      color: answer == currentQuestion.answer
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '${currentQuestion.answer} ',
                                        style: TextStyle(
                                          color:
                                              answer == currentQuestion.answer
                                                  ? orange
                                                  : blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: currentQuestion.feedback,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40.h),
                                AppButton(
                                  text: 'Next Question',
                                  color: black,
                                  width: 370,
                                  onPressed: nextQuestion,
                                ),
                                SizedBox(height: 20.h),
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
