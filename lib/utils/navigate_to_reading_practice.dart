import 'package:dzidzai_mobile/data/reading/comprehension_practice.dart';
import 'package:dzidzai_mobile/data/reading/summary_practice.dart';
import 'package:dzidzai_mobile/data/reading/vocabulary_practice.dart';
import 'package:dzidzai_mobile/data/writing/free_composition_practice.dart';
import 'package:dzidzai_mobile/data/writing/guided_composition_practice.dart';
import 'package:dzidzai_mobile/models/writing/free_compositions_practice.dart';
import 'package:dzidzai_mobile/models/writing/guided_compositions_practice.dart';
import 'package:dzidzai_mobile/providers/ai_api/grade_reading_provider.dart';
import 'package:dzidzai_mobile/screens/lessons/reading/comprehension_practice.dart';
import 'package:dzidzai_mobile/screens/lessons/reading/summary_practice.dart';
import 'package:dzidzai_mobile/screens/lessons/writing/free_compositions_practice.dart';
import 'package:dzidzai_mobile/screens/lessons/writing/guided_compositions_practice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> freeCompositions = [
  'Narrative',
  'Descriptive',
  'Informative',
  'Argumentative',
  'Discursive',
  'Creative',
];

List<String> guidedCompositions = [
  'Memos',
  'Letters',
  'Articles',
  'CV',
  'Reports',
  'Speeches',
];

void navigateToPractice(BuildContext context, String exercise, int index) {
  if (exercise == 'Comprehension Practice') {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => GradeReadingProvider(),
          child: ComprehensionPractice(
            passageIndex: index,
            comprehensionPractice: comprehensionQuestions[index],
            isVocabulary: false,
          ),
        ),
      ),
    );
  } else if (exercise == 'Vocabulary Practice') {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => GradeReadingProvider(),
          child: ComprehensionPractice(
            passageIndex: index,
            comprehensionPractice: vocabularyQuestions[index],
            isVocabulary: true,
          ),
        ),
      ),
    );
  } else if (exercise == 'Summary Practice') {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SummaryPractice(
          summaryIndex: index,
          summaryPractice: summaryQuestions[index],
        ),
      ),
    );
  } else if (freeCompositions.contains(exercise)) {
    List<FreeCompositionsPracticeModel> compositions = _getFreeCompositionQuestions(exercise);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FreeCompositionsPractice(
          freeCompositionsPractice: compositions[index],
          compositionType: exercise,
        ),
      ),
    );
  } else if (guidedCompositions.contains(exercise)) {
    List<GuidedCompositionsPracticeModel> compositions = _getGuidedCompositionQuestions(exercise);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GuidedCompositionsPractice(
          guidedCompositionsPractice: compositions[index],
          compositionType: exercise,
        ),
      ),
    );
  } 
}

List<FreeCompositionsPracticeModel> _getFreeCompositionQuestions(
    String composition) {
  switch (composition) {
    case 'Narrative':
      return narrativeCompositionQuestions;
    case 'Descriptive':
      return descriptiveCompositionQuestions;
    case 'Informative':
      return informativeCompositionQuestions;
    case 'Argumentative':
      return argumentativeCompositionQuestions;
    case 'Discursive':
      return discursiveCompositionQuestions;
    case 'Creative':
      return creativeCompositionQuestions;
    default:
      throw Exception('Unknown composition type: $composition');
  }
}

List<GuidedCompositionsPracticeModel> _getGuidedCompositionQuestions(
    String composition) {
  switch (composition) {
    case 'Memos':
      return memosCompositionQuestions;
    case 'Letters':
      return lettersCompositionQuestions;
    case 'Articles':
      return articlesCompositionQuestions;
    case 'CV':
      return cvCompositionQuestions;
    case 'Reports':
      return reportsCompositionQuestions;
    case 'Speeches':
      return speechesCompositionQuestions;
    default:
      throw Exception('Unknown composition type: $composition');
  }
}