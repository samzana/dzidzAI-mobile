import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/components/lessons/word_count_textfield.dart';
import 'package:dzidzai_mobile/models/writing/free_compositions_practice.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FreeCompositionsPractice extends StatefulWidget {
  const FreeCompositionsPractice({
    super.key,
    required this.freeCompositionsPractice,
    required this.compositionType,
  });

  final FreeCompositionsPracticeModel freeCompositionsPractice;
  final String compositionType;

  @override
  _FreeCompositionsPracticeState createState() =>
      _FreeCompositionsPracticeState();
}

class _FreeCompositionsPracticeState extends State<FreeCompositionsPractice> {
  late ScrollController _scrollController;
  String? essay;

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

  void gradeEssay() {
    //grade essay using llm
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          '${widget.compositionType} Composition Practice',
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
                  Container(
                    padding: EdgeInsets.all(24.r),
                    decoration: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    width: 370.w,
                    child: Text(
                      widget.freeCompositionsPractice.prompt,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Baloo 2',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  const WordCountTextField(wordCount: 450),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppButton(
                    text: 'Submit',
                    color: black,
                    width: 390.w,
                    onPressed: () {
                      gradeEssay();
                    },
                  ),
                  SizedBox(height: 20.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
