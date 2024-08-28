import 'package:dzidzai_mobile/components/button.dart';
import 'package:dzidzai_mobile/components/lessons/passage_widget.dart';
import 'package:dzidzai_mobile/components/lessons/word_count_textfield.dart';
import 'package:dzidzai_mobile/models/api/grade_summary_request.dart';
import 'package:dzidzai_mobile/models/reading/summary_practice.dart';
import 'package:dzidzai_mobile/providers/ai_api/grade_reading_provider.dart';
import 'package:dzidzai_mobile/services/sqflite/database_service.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SummaryPractice extends StatefulWidget {
  const SummaryPractice({
    super.key,
    required this.summaryPractice,
    required this.summaryIndex,
  });

  final SummaryPracticeModel summaryPractice;
  final int summaryIndex;

  @override
  _SummaryPracticeState createState() => _SummaryPracticeState();
}

class _SummaryPracticeState extends State<SummaryPractice> {
  late ScrollController _scrollController;
  final _controller = TextEditingController();
  bool _isAnswered = false;
  String? grade;
  String? feedback;
  Color gradeColor = black;
  String? errorMessage;
  String? previousFeedback;
  Color previousFeedbackColor = grey;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _loadExistingSummary(); // Load any existing summary attempt from the database
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadExistingSummary() async {
    final dbService = Provider.of<DatabaseService>(context, listen: false);
    final existingEntry =
        await dbService.getSummaryProgress(widget.summaryIndex);

    if (existingEntry != null) {
      setState(() {
        _controller.text = existingEntry['studentResponse'] ?? '';
        grade = existingEntry['grade']?.toString();
        previousFeedback = existingEntry['feedback'];
        //_isAnswered = true;

        final gradeValue = int.tryParse(grade ?? '0') ?? 0;
        gradeColor = gradeValue >= 10 ? green : red;
        previousFeedbackColor = gradeValue >= 10 ? Colors.green : Colors.red;
      });
    }
  }

  void checkSummary() {
    final summary = _controller.text;

    if (summary.isEmpty) {
      // Handle empty answer case
      setState(() {
        errorMessage = 'Please enter a summary before submitting.';
      });
      return;
    }

    setState(() {
      errorMessage = null; // Reset error message
    });

    final gradeSummaryProvider =
        Provider.of<GradeReadingProvider>(context, listen: false);
    final request = GradeSummaryRequest(
      passage: widget.summaryPractice.passage,
      question: widget.summaryPractice.instructions,
      response: summary,
    );

    gradeSummaryProvider.gradeSummary(request).then((_) async {
      setState(() {
        _isAnswered = true;
        errorMessage = null; // Reset the error message if successful
        previousFeedback = null;
      });

      final responseString = gradeSummaryProvider.response?.grade ?? '';
      final gradeMatch =
          RegExp(r'Grade:\s*(\d+)/20').firstMatch(responseString);

      if (gradeMatch != null) {
        grade = gradeMatch.group(1); // Extract the grade as a string
        final gradeValue = int.tryParse(grade!) ?? 0; // Convert to int

        // Set the color based on the grade value
        setState(() {
          gradeColor = gradeValue >= 10 ? green : red;
        });

        // Save progress to the database using trackSummaryAnswer
        final dbService = Provider.of<DatabaseService>(context, listen: false);
        final summaryFeedback = gradeSummaryProvider.response?.feedback ?? '';

        await dbService.trackSummaryAnswer(
          widget.summaryIndex,
          summary,
          gradeValue,
          summaryFeedback,
        );

        // Update the feedback in the state after the database operation
        setState(() {
          feedback = feedback; // Store feedback to display
        });
      }
    }).catchError((error) {
      // Display an error message
      setState(() {
        errorMessage = 'Failed to grade summary: $error';
      });
    });
  }

  void reattemptSummary() {
    setState(() {
      _isAnswered = false;
      _controller.clear();
      grade = null;
      previousFeedback = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final gradeSummaryProvider = Provider.of<GradeReadingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const Text(
          'Summary Practice',
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
                    widget.summaryPractice.instructions[0],
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Baloo 2',
                    ),
                  ),
                  SizedBox(height: 20.h),
                  PassageWidget(
                    passage: widget.summaryPractice.passage,
                    scrollController: _scrollController,
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    widget.summaryPractice.instructions[1],
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Baloo 2',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.summaryPractice.instructions[2],
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Baloo 2',
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.summaryPractice.instructions[3],
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Baloo 2',
                    ),
                  ),
                  SizedBox(height: 40.h),
                  WordCountTextField(wordCount: 160, controller: _controller),
                  SizedBox(height: 20.h),
                  if (!_isAnswered && previousFeedback == null)
                    !gradeSummaryProvider.isLoading
                        ? Padding(
                          padding: EdgeInsets.only(bottom: 40.h),
                          child: Center(
                            child: AppButton(
                                text: "Check Summary",
                                color: black,
                                width: 390.w,
                                onPressed: checkSummary,
                              ),
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
                            gradeSummaryProvider.response!.feedback,
                            style: TextStyle(
                              color: gradeColor,
                              fontFamily: 'Baloo 2',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  if (previousFeedback != null) ...[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        '$previousFeedback',
                        style: TextStyle(
                          color: previousFeedbackColor,
                          fontFamily: 'Baloo 2',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Center(
                      child: AppButton(
                        text: "Try Again",
                        color: black,
                        width: 390.w,
                        onPressed: reattemptSummary,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                  if (errorMessage != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        errorMessage!,
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Baloo 2',
                          fontSize: 16.sp,
                        ),
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
