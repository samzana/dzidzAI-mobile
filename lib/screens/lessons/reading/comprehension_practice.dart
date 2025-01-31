import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/components/lessons/passage_widget.dart';
import 'package:dzidzai_mobile/models/api/grade_reading_request.dart';
import 'package:dzidzai_mobile/models/reading/comprehension_practice.dart';
import 'package:dzidzai_mobile/models/reading/comprehension_question.dart';
import 'package:dzidzai_mobile/providers/ai_api/grade_reading_provider.dart';
import 'package:dzidzai_mobile/services/sqflite/database_service.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ComprehensionPractice extends StatefulWidget {
  const ComprehensionPractice({
    super.key,
    required this.passageIndex,
    required this.comprehensionPractice,
    required this.isVocabulary,
  });

  final int passageIndex;
  final ComprehensionPracticeModel comprehensionPractice;
  final bool isVocabulary;

  @override
  _ComprehensionPracticeState createState() => _ComprehensionPracticeState();
}

class _ComprehensionPracticeState extends State<ComprehensionPractice> {
  late ScrollController _scrollController;
  late TextEditingController _answerController;
  String? answer;
  int questionNumber = 0;
  bool _isAnswered = false;
  List<ComprehensionQuestion> _unansweredQuestions = [];

  Future<void> _loadUnansweredQuestions() async {
    final databaseService =
        Provider.of<DatabaseService>(context, listen: false);
    List<int> answeredIndices =
        await databaseService.fetchAnsweredReadingQuestions(
            widget.isVocabulary ? "Vocabulary" : "Comprehension",
            widget.passageIndex);

    setState(() {
      if (answeredIndices.length ==
          widget.comprehensionPractice.questions.length) {
        _unansweredQuestions = widget.comprehensionPractice.questions;
      } else {
        final indexedQuestions = widget.comprehensionPractice.questions.asMap();

        _unansweredQuestions = indexedQuestions.entries
            .where((entry) => !answeredIndices.contains(entry.key))
            .map((entry) => entry.value)
            .toList();
        
        if (_unansweredQuestions.isNotEmpty) {
          questionNumber = 0;
        }
      }

    });
  }

  void checkAnswer() {
    setState(() {
      if (answer == null || answer!.isEmpty) {
        //Handle empty answer case
        return;
      }
      final gradeReadingProvider =
          Provider.of<GradeReadingProvider>(context, listen: false);
      final databaseService =
          Provider.of<DatabaseService>(context, listen: false);

      final request = GradeReadingRequest(
        passage: widget.comprehensionPractice.passage,
        question: !widget.isVocabulary
            ? widget.comprehensionPractice.questions[questionNumber].question
            : 'Give one word or a short phrase (of not more than seven words) which has the same meaning that the following word or phrase has in the passage: ${widget.comprehensionPractice.questions[questionNumber].question}',
        response: answer!,
      );

      gradeReadingProvider.gradeReading(request).then((_) {
        setState(() {
          _isAnswered = true;
        });

        // Save the answer to the database

        databaseService.trackComprehensionAnswer(
          widget.isVocabulary ? 'Vocabulary' : 'Comprehension',
          widget.passageIndex,
          questionNumber,
          gradeReadingProvider.response!.grade.startsWith("Correct"),
        );
      }).catchError((error) {
        setState(() {
          _isAnswered = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Failed to connect to the server. Please make sure you have internet connection and try again.')),
        );
      });
    });
  }

  void nextQuestion() {
    if (questionNumber < _unansweredQuestions.length - 1) {
      setState(() {
        _isAnswered = false;
        questionNumber++;
        answer = null;
        _answerController.clear();
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('End of Questions'),
            content: const Text(
                'You have reached the end of the questions. Navigate back to the previous screen to view your progress.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
            backgroundColor: white,
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _answerController = TextEditingController();
    _loadUnansweredQuestions();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradeReadingProvider = Provider.of<GradeReadingProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            widget.isVocabulary
                ? 'Vocabulary Practice'
                : 'Comprehension Practice',
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
                      'From paragraph ${_unansweredQuestions[questionNumber].paragraphNumber}:',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Baloo 2',
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      _unansweredQuestions[questionNumber]
                          .question,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Baloo 2',
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.w),
                      child: TextField(
                        controller: _answerController,
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
                      !gradeReadingProvider.isLoading
                          ? Center(
                              child: AppButton(
                                text: 'Submit Answer',
                                color: black,
                                width: 400.w,
                                onPressed: () {
                                  checkAnswer();
                                },
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                color: blue,
                              ),
                            ),
                    if (_isAnswered) ...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          gradeReadingProvider.response?.grade ?? '',
                          style: TextStyle(
                            color: (gradeReadingProvider.response?.grade ?? '')
                                    .startsWith("Correct")
                                ? green
                                : red,
                            fontFamily: 'Baloo 2',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      AppButton(
                        text: 'Next Question',
                        color: black,
                        width: 400.w,
                        onPressed: () {
                          nextQuestion();
                        },
                      )
                    ]
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
