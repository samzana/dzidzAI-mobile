import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/components/lessons/passage_widget.dart';
import 'package:dzidzai_mobile/components/lessons/word_count_textfield.dart';
import 'package:dzidzai_mobile/models/exams/paper_two_practice.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaperTwo extends StatefulWidget {
  const PaperTwo({
    super.key,
    required this.paper,
  });

  final PaperTwoPracticeModel paper;

  @override
  _PaperTwoState createState() => _PaperTwoState();
}

class _PaperTwoState extends State<PaperTwo> {
  late List<TextEditingController> _comprehensionControllers;
  late List<TextEditingController> _vocabularyControllers;
  late TextEditingController _summaryController;
  late List<TextEditingController> _grammarControllers;
  final _paperTwoFormKey = GlobalKey<FormState>();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _comprehensionControllers = List.generate(
      widget.paper.comprehensionQuestions.questions.length,
      (index) => TextEditingController(),
    );
    _vocabularyControllers = List.generate(
      widget.paper.vocabularyQuestions.questions.length,
      (index) => TextEditingController(),
    );
    _summaryController = TextEditingController();
    _grammarControllers = List.generate(
      widget.paper.grammarQuestions.length,
      (index) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    for (final controller in _comprehensionControllers) {
      controller.dispose();
    }
    for (final controller in _vocabularyControllers) {
      controller.dispose();
    }
    _summaryController.dispose();
    for (final controller in _grammarControllers) {
      controller.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  void gradePaperTwo() {
    // grade paper two using llm
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Paper 2',
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
            controller: _scrollController,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Section A (40 Marks)',
                          style: TextStyle(
                            fontSize: 23.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Baloo 2',
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        widget.paper.comprehensionQuestions.instructions,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Baloo 2',
                        ),
                      ),
                      SizedBox(height: 20.h),
                      PassageWidget(
                        passage: widget.paper.comprehensionQuestions.passage,
                        scrollController: _scrollController,
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Form(
                        key: _paperTwoFormKey,
                        child: Column(
                          children: [
                            for (int i = 0;
                                i <
                                    widget.paper.comprehensionQuestions
                                        .questions.length;
                                i++)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'From paragraph ${widget.paper.comprehensionQuestions.questions[i].paragraphNumber}:',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: 'Baloo 2',
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    widget.paper.comprehensionQuestions
                                        .questions[i].question,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Baloo 2',
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  TextFormField(
                                    controller: _comprehensionControllers[i],
                                    decoration: InputDecoration(
                                      hintText: 'Type your answer here',
                                      hintStyle: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: 'Baloo 2',
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your answer';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            SizedBox(height: 30.h),
                            Text(
                              'Choose five of the following words or phrases. For each of them, give one word or a short phrase (of not more than seven words) which has the same meaning that the word or phrase has in the passage.',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Baloo 2',
                              ),
                            ),
                            SizedBox(height: 20.h),
                            for (int i = 0;
                                i <
                                    widget.paper.vocabularyQuestions.questions
                                        .length;
                                i++)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'From paragraph ${widget.paper.vocabularyQuestions.questions[i].paragraphNumber}',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Baloo 2',
                                    ),
                                  ),
                                  Text(
                                    widget.paper.vocabularyQuestions
                                        .questions[i].question,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Baloo 2',
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  TextFormField(
                                    controller: _vocabularyControllers[i],
                                    decoration: InputDecoration(
                                      hintText: 'Type your answer here',
                                      hintStyle: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: 'Baloo 2',
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            SizedBox(height: 30.h),
                            Text(
                              widget.paper.summaryQuestion.instructions[0],
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Baloo 2',
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              widget.paper.summaryQuestion.instructions[1],
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Baloo 2',
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              widget.paper.summaryQuestion.instructions[2],
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Baloo 2',
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              widget.paper.summaryQuestion.instructions[3],
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Baloo 2',
                              ),
                            ),
                            SizedBox(height: 20.h),
                            WordCountTextField(wordCount: 160, controller: _summaryController),
                            SizedBox(height: 50.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Section B (10 Marks)',
                          style: TextStyle(
                            fontSize: 23.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Baloo 2',
                          ),
                        ),
                      ),
                      Text(
                        'Answer all the following questions in the spaces provided. You are advised to not spend more than 30 minutes on this section.',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Baloo 2',
                        ),
                      ),
                      SizedBox(height: 10.h),
                      for (int i = 0; i < widget.paper.grammarQuestions.length; i++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.paper.grammarQuestions[i].instructions,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Baloo 2',
                              ),
                            ),
                            Text(
                              widget.paper.grammarQuestions[i].question,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Baloo 2',
                              ),
                            ),
                            SizedBox(height: 10.h),
                            TextFormField(
                              controller: _grammarControllers[i],
                              decoration: InputDecoration(
                                hintText: 'Type your answer here',
                                hintStyle: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'Baloo 2',
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your answer';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      SizedBox(height: 40.h),
                      Align(
                        alignment: Alignment.center,
                        child: AppButton(
                          onPressed: () {
                            if (_paperTwoFormKey.currentState!.validate()) {
                              gradePaperTwo();
                            }
                          },
                          color: black,
                          width: 390.w,
                          text: 'Submit Exam',
                        ),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
