import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/components/lessons/guided_composition_widget.dart';
import 'package:dzidzai_mobile/components/lessons/word_count_textfield.dart';
import 'package:dzidzai_mobile/models/writing/guided_compositions_practice.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuidedCompositionsPractice extends StatefulWidget {
  const GuidedCompositionsPractice({
    super.key,
    required this.guidedCompositionsPractice,
    required this.compositionType,
  });

  final GuidedCompositionsPracticeModel guidedCompositionsPractice;
  final String compositionType;

  @override
  _GuidedCompositionsPracticeState createState() =>
      _GuidedCompositionsPracticeState();
}

class _GuidedCompositionsPracticeState extends State<GuidedCompositionsPractice> {
  late ScrollController _scrollController;
  late ScrollController _anotherScrollController;
  final _controller = TextEditingController();
  String? essay;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _anotherScrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _anotherScrollController.dispose();
    super.dispose();
  }

  void gradeEssay() {
    // Grade essay using LLM
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          '${widget.compositionType} Practice',
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
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: Column(
                    children: [
                      GuidedCompositionWidget(
                        composition: widget.guidedCompositionsPractice,
                        scrollController: _anotherScrollController,
                      ),
                      SizedBox(height: 40.h),
                      WordCountTextField(wordCount: 300, controller: _controller),
                      SizedBox(height: 40.h),
                      AppButton(
                        text: 'Submit',
                        color: black,
                        width: 390.w,
                        onPressed: () {
                          gradeEssay();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
