import 'package:dzidzai_mobile/data/grammar/direct_and_indirect_speech.dart';
import 'package:dzidzai_mobile/data/grammar/nouns.dart';
import 'package:dzidzai_mobile/data/grammar/pronouns.dart';
import 'package:dzidzai_mobile/data/grammar/sentence_construction.dart';
import 'package:dzidzai_mobile/data/grammar/verbs.dart';
import 'package:dzidzai_mobile/data/grammar/word_formation.dart';
import 'package:dzidzai_mobile/data/reading/comprehension_practice.dart';
import 'package:dzidzai_mobile/data/reading/summary_practice.dart';
import 'package:dzidzai_mobile/data/reading/vocabulary_practice.dart';
import 'package:dzidzai_mobile/models/exams/paper_two_practice.dart';

List<PaperTwoPracticeModel> paperTwoQuestions = [
  PaperTwoPracticeModel(
    comprehensionQuestions: comprehensionQuestions[0], 
    vocabularyQuestions: vocabularyQuestions[0],
    summaryQuestion: summaryQuestions[0], 
    grammarQuestions: nounQuestions.sublist(0, 3) + verbQuestions.sublist(3, 6) + pronounQuestions.sublist(6, 10),
  ),
  PaperTwoPracticeModel(
    comprehensionQuestions: comprehensionQuestions[1], 
    vocabularyQuestions: vocabularyQuestions[1],
    summaryQuestion: summaryQuestions[1], 
    grammarQuestions: wordFormationQuestions.sublist(0, 4) + sentenceConstructionQuestions.sublist(4, 8) + directIndirectSpeechQuestions.sublist(0, 3),
  ), 
  PaperTwoPracticeModel(
    comprehensionQuestions: comprehensionQuestions[2], 
    vocabularyQuestions: vocabularyQuestions[2],
    summaryQuestion: summaryQuestions[2], 
    grammarQuestions: nounQuestions.sublist(3, 6) + verbQuestions.sublist(6, 9) + pronounQuestions.sublist(9, 12),
  ),
];
