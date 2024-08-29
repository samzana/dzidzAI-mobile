import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/components/lessons/guided_composition_widget.dart';
import 'package:dzidzai_mobile/components/lessons/word_count_textfield.dart';
import 'package:dzidzai_mobile/models/exams/paper_one_practice.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaperOne extends StatefulWidget {
  const PaperOne({
    super.key,
    required this.paper,
  });

  final PaperOnePracticeModel paper;

  @override
  _PaperOneState createState() => _PaperOneState();
}

class _PaperOneState extends State<PaperOne> {
  late ScrollController _scrollController;
  late ScrollController _guidedCompositionScrollController;
  final _paperOneFormKey = GlobalKey<FormState>();
  final _sectionAController = TextEditingController();
  final _sectionBController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _guidedCompositionScrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _guidedCompositionScrollController.dispose();
    _sectionAController.dispose();
    _sectionBController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Paper 1',
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
          color: white,
        ),
        child: SafeArea(
            child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _paperOneFormKey,
              child: Column(
                children: [
                  Text(
                    'Section A',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Baloo 2',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.paper.freeComposition.prompt,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Baloo 2',
                    ),
                  ),
                  SizedBox(height: 40.h),
                  WordCountTextField(wordCount: 450, controller: _sectionAController),
                  SizedBox(height: 60.h),
                  Text(
                    'Section B',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Baloo 2',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GuidedCompositionWidget(
                    composition: widget.paper.guidedComposition,
                    scrollController: _guidedCompositionScrollController,
                  ),
                  SizedBox(height: 40.h),
                  WordCountTextField(wordCount: 300, controller: _sectionBController),
                  SizedBox(height: 40.h),
                  AppButton(
                    text: 'Submit',
                    color: black,
                    width: 390.w,
                    onPressed: () {},
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
