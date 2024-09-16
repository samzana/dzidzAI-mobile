import 'package:dzidzai_mobile/components/lessons/reading_practice_tile.dart';
import 'package:dzidzai_mobile/components/lessons/writing_guidelines_tile.dart';
import 'package:dzidzai_mobile/data/writing/composition_tips.dart';
import 'package:dzidzai_mobile/screens/lessons/writing/guidelines_and_tips.dart';
import 'package:dzidzai_mobile/services/sqflite/database_service.dart';
import 'package:dzidzai_mobile/themes/app_colors.dart';
import 'package:dzidzai_mobile/utils/navigate_to_reading_practice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PracticeTiles extends StatelessWidget {
  PracticeTiles({
    super.key,
    required this.title,
    required this.exercises,
  });

  final String title;
  final List exercises;

  final guidelinesMap = {
    'Narrative': narrativeCompositionTips,
    'Descriptive': descriptiveCompositionTips,
    'Informative': informativeCompositionTips,
    'Argumentative': argumentativeCompositionTips,
    'Discursive': discursiveCompositionTips,
    'Creative': creativeCompositionTips,
    'Memos': memoCompositionTips,
    'Letters': letterCompositionTips,
    'Reports': reportCompositionTips,
    'CV': cvCompositionTips,
    'Articles': articleCompositionTips,
    'Speeches': speechCompositionTips, 
  };

  Future<double> _calculateProgress(
      BuildContext context, String title, int index) async {
    if (title == 'Comprehension Practice') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .calculateComprehensionProgress("Comprehension", index);
      return progress;
    }

    if (title == 'Vocabulary Practice') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .calculateComprehensionProgress("Vocabulary", index);
      return progress;
    }

    if (title == 'Narrative') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .getCompositionProgress('free', 'Narrative', index);
      return progress;
    }

    if (title == 'Descriptive') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .getCompositionProgress('free', 'Descriptive', index);
      return progress;
    }

    if (title == 'Informative') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .getCompositionProgress('free', 'Informative', index);
      return progress;
    }

    if (title == 'Argumentative') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .getCompositionProgress('free', 'Argumentative', index);
      return progress;
    }

    if (title == 'Discursive') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .getCompositionProgress('free', 'Discursive', index);
      return progress;
    }

    if (title == 'Creative') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .getCompositionProgress('free', 'Creative', index);
      return progress;
    }

    if (title == 'Memos') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .getCompositionProgress('guided', 'Memos', index);
      return progress;
    }

    if (title == 'Letters') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .getCompositionProgress('guided', 'Letters', index);
      return progress;
    }

    if (title == 'Reports') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .getCompositionProgress('guided', 'Reports', index);
      return progress;
    }

    if (title == 'CV') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .getCompositionProgress('guided', 'CV', index);
      return progress;
    }

    if (title == 'Articles') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .getCompositionProgress('guided', 'Articles', index);
      return progress;
    }

    if (title == 'Speeches') {
      final progress =
          await Provider.of<DatabaseService>(context, listen: false)
              .getCompositionProgress('guided', 'Speeches', index);
      return progress;
    }

    final progress = await Provider.of<DatabaseService>(context, listen: false)
        .calculateSummaryProgress(index);
    return progress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          title,
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.builder(
              itemCount: freeCompositions.contains(title) ||
                      guidedCompositions.contains(title)
                  ? exercises.length + 1
                  : exercises.length,
              itemBuilder: (context, index) {
                if (index == 0 &&
                    (freeCompositions.contains(title) ||
                        guidedCompositions.contains(title))) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: WritingGuidelinesTile(
                      title: title,
                      onPressed: () {
                        final guidelines = guidelinesMap[title];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GuidelinesAndTips(
                              compositionTips: guidelines!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }

                final exerciseIndex = freeCompositions.contains(title) ||
                        guidedCompositions.contains(title)
                    ? index - 1
                    : index;

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: FutureBuilder<double>(
                    future: _calculateProgress(context, title, exerciseIndex),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      final progress = snapshot.data ?? 0.0;

                      return ReadingPracticeTile(
                        title: 'Practice ${exerciseIndex + 1}',
                        progress: progress,
                        onPressed: () {
                          navigateToPractice(context, title, exerciseIndex);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
