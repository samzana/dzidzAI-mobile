import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/models/grammar/grammar_exercise.dart';
import 'package:dzidzai_mobile/providers/sqflite/database_provider.dart';
import 'package:dzidzai_mobile/services/sqflite/database_service.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
  List<GrammarExerciseModel> _unansweredQuestions = [];

  @override
  void initState() {
    super.initState();
    _loadUnansweredQuestions();
  }

  Future<void> _loadUnansweredQuestions() async {
    final databaseService = Provider.of<DatabaseService>(context, listen: false);
    List<int> unansweredIndices =
        await databaseService.fetchUnansweredGrammarQuestions(widget.title);

    setState(() {
      if (unansweredIndices.isEmpty) {
        _unansweredQuestions = widget.questions;
      } else {
        // Convert the list of questions to a map of index and question pairs
        final indexedQuestions = widget.questions.asMap();

        // Filter questions based on unanswered indices
        _unansweredQuestions = indexedQuestions.entries
            .where((entry) => unansweredIndices.contains(entry.key))
            .map((entry) => entry.value)
            .toList();

        // Set the initial index if there are unanswered questions
        if (_unansweredQuestions.isNotEmpty) {
          _currentIndex = 0;
        }
      }
    });
  }

  void checkAnswer() async {
    setState(() {
      _isAnswered = true;
      _isCorrect = answer == _unansweredQuestions[_currentIndex].answer;
    });

    final databaseService= Provider.of<DatabaseService>(context, listen: false);
    await databaseService.trackGrammarAnswer(
        widget.title,
        widget.questions.indexOf(_unansweredQuestions[_currentIndex]),
        _isCorrect);
  
  }

  void nextQuestion() {
    if (_unansweredQuestions.isNotEmpty &&
        _currentIndex < _unansweredQuestions.length - 1) {
      setState(() {
        _currentIndex++;
        _isAnswered = false;
        answer = null;
      });
    } else {
      // Handle the end of the question list or display a completion message
    }
  }

  Color _getButtonColor(int index) {
    String option = _unansweredQuestions[_currentIndex].options![index];

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
    if (_unansweredQuestions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('${widget.title} Practice'),
        ),
        body: const Center(child: Text('No unanswered questions available.')),
      );
    }

    var currentQuestion = _unansweredQuestions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '${widget.title} Practice',
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
          color: Colors.white,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      currentQuestion.instructions,
                      style: TextStyle(
                        color: Colors.black,
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
                      color: Colors.grey,
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
                                if (!_isAnswered) {
                                  setState(() {
                                    answer = currentQuestion.options![0];
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _getButtonColor(0),
                                elevation: 10.h,
                                shadowColor: Colors.black,
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  side: BorderSide(
                                      color: Colors.grey, width: 1.r),
                                ),
                              ),
                              child: Text(
                                currentQuestion.options![0],
                                style: TextStyle(
                                  color: Colors.black,
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
                                if (!_isAnswered) {
                                  setState(() {
                                    answer = currentQuestion.options![1];
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _getButtonColor(1),
                                elevation: 10.h,
                                shadowColor: Colors.black,
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  side: BorderSide(
                                      color: Colors.grey, width: 1.r),
                                ),
                              ),
                              child: Text(
                                currentQuestion.options![1],
                                style: TextStyle(
                                  color: Colors.black,
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
                              onPressed: () {
                                setState(() {
                                  checkAnswer();
                                });
                              },
                              text: 'Check Answer',
                              color: black,
                              width: 370.w,
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
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                                SizedBox(height: 60.h),
                                AppButton(
                                  onPressed: nextQuestion,
                                  text: 'Next Question',
                                  color: black,
                                  width: 370.w,
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
                          color: Colors.black,
                          fontFamily: 'Baloo 2',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Type your answer here',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Baloo 2',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.r),
                          ),
                        ),
                      ),
                    ),
                  if (currentQuestion.type == 'rewriteSentence')
                    !_isAnswered
                        ? Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: AppButton(
                              onPressed: () {
                                setState(() {
                                  checkAnswer();
                                });
                              },
                              color: black,
                              text: "Check Answer",
                              width: 370.w,
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
                                                  ? Colors.orange
                                                  : Colors.blue,
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
                                  width: 370.w,
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
