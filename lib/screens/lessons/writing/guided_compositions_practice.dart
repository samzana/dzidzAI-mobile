import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/components/lessons/guided_composition_widget.dart';
import 'package:dzidzai_mobile/components/lessons/word_count_textfield.dart';
import 'package:dzidzai_mobile/models/api/grade_free_composition_request.dart';
import 'package:dzidzai_mobile/models/writing/guided_compositions_practice.dart';
import 'package:dzidzai_mobile/providers/ai_api/grade_reading_provider.dart';
import 'package:dzidzai_mobile/services/sqflite/database_service.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class GuidedCompositionsPractice extends StatefulWidget {
  const GuidedCompositionsPractice({
    super.key,
    required this.guidedCompositionsPractice,
    required this.compositionType,
    required this.index,
  });

  final GuidedCompositionsPracticeModel guidedCompositionsPractice;
  final String compositionType;
  final int index;

  @override
  _GuidedCompositionsPracticeState createState() =>
      _GuidedCompositionsPracticeState();
}

class _GuidedCompositionsPracticeState
    extends State<GuidedCompositionsPractice> {
  late ScrollController _scrollController;
  late ScrollController _anotherScrollController;
  final _controller = TextEditingController();
  String? essay;
  String? grade;
  String? feedback;
  Color gradeColor = red;
  String? errorMessage;
  bool _isAnswered = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _anotherScrollController = ScrollController();
    _loadPreviousSubmission();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _anotherScrollController.dispose();
    super.dispose();
  }

  Future<void> _loadPreviousSubmission() async {
    final dbService = Provider.of<DatabaseService>(context, listen: false);
    final previousSubmission = await dbService.getPreviousEssaySubmission(
      'guided',
      widget.compositionType,
      widget.index,
    );

    if (previousSubmission != null) {
      setState(() {
        essay = previousSubmission['studentResponse'] as String?;
        feedback = previousSubmission['feedback'] as String?;
        grade = previousSubmission['grade'].toString();
        _isAnswered = true;
        _controller.text = essay ?? '';
        gradeColor = (int.parse(grade!) >= 10) ? green : red;
      });
    }
  }

  void gradeEssay() {
    //grade essay using llm
    final essay = _controller.text;

    final wordCount = essay.split(' ').length;

    if (wordCount < 250 || wordCount > 300) {
      setState(() {
        errorMessage = 'Guided composition must be between 250 and 300 words.';
      });
      return;
    }

    if (essay.isEmpty) {
      setState(() {
        errorMessage = 'Please write a composition before submitting';
      });
      return;
    }

    setState(() {
      errorMessage = null;
    });

    final gradeEssayProvider =
        Provider.of<GradeReadingProvider>(context, listen: false);
    final request = GradeFreeCompositionRequest(
      prompt: widget.guidedCompositionsPractice.prompt,
      type: widget.compositionType,
      response: essay,
    );

    gradeEssayProvider.gradeFreeComposition(request).then((_) async {
      setState(() {
        _isAnswered = true;
        feedback = gradeEssayProvider.compositionFeedback;
      });

      //print(gradeEssayProvider.compositionFeedback ?? '');
      final responseString = gradeEssayProvider.compositionFeedback ?? '';

      final gradeMatch =
          RegExp(r'Grade:\s*(\d+)/30').firstMatch(responseString);

      if (gradeMatch != null) {
        grade = gradeMatch.group(1);

        final gradeValue = int.parse(grade!);

        setState(() {
          gradeColor = gradeValue >= 10 ? green : red;
        });

        final dbService = Provider.of<DatabaseService>(context, listen: false);
        await dbService.recordEssayResponse('guided', widget.compositionType,
            widget.index, essay, gradeValue, feedback ?? "");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final gradeEssayProvider = Provider.of<GradeReadingProvider>(context);

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
                      WordCountTextField(
                          wordCount: 300, controller: _controller),
                      SizedBox(height: 40.h),
                      if (errorMessage != null)... [
                        Center(
                          child: Text(
                            errorMessage!,
                            style: TextStyle(
                              color: red,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Baloo 2',
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                      if (!_isAnswered)
                        !gradeEssayProvider.isLoading
                            ? Center(
                                child: AppButton(
                                  text: 'Submit',
                                  color: black,
                                  width: 390.w,
                                  onPressed: () {
                                    gradeEssay();
                                  },
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: blue,
                                ),
                              ),
                      if (_isAnswered)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Text(
                                feedback ?? '',
                                style: TextStyle(
                                    color: gradeColor,
                                    fontFamily: 'Baloo 2',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Center(
                              child: AppButton(
                                text: 'Try Again',
                                color: black,
                                width: 390.w,
                                onPressed: () {
                                  setState(() {
                                    _isAnswered = false;
                                    _controller
                                        .clear(); // Clear the text field for new submission
                                  });
                                },
                              ),
                            ),
                          ],
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
