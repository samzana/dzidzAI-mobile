  import 'package:dzidzai_mobile/data/grammar/adjectives.dart';
import 'package:dzidzai_mobile/data/grammar/adverbs.dart';
import 'package:dzidzai_mobile/data/grammar/direct_and_indirect_speech.dart';
import 'package:dzidzai_mobile/data/grammar/nouns.dart';
import 'package:dzidzai_mobile/data/grammar/pronouns.dart';
import 'package:dzidzai_mobile/data/grammar/sentence_construction.dart';
import 'package:dzidzai_mobile/data/grammar/verbs.dart';
import 'package:dzidzai_mobile/data/grammar/word_formation.dart';

int getTotalQuestionsForSection(String section) {
    switch (section) {
      case 'Nouns':
        return nounQuestions.length;
      case 'Verbs':
        return verbQuestions.length;
      case 'Adjectives':
        return adjectiveQuestions.length;
      case 'Adverbs':
        return adverbQuestions.length;
      case 'Pronouns':
        return pronounQuestions.length;
      case 'Word Formation':
        return wordFormationQuestions.length;
      case 'Sentence Construction':
        return sentenceConstructionQuestions.length;
      case 'Direct and Indirect Speech':
        return directIndirectSpeechQuestions.length;
      default:
        return 0; 
    }
}


  int getTotalGrammarQuestions() {
    // Assuming you have a method to fetch all grammar questions
    // If you store all grammar questions in the database, replace this with the appropriate query
    // Here, I'm assuming you have a static list of all grammar questions in your app
    int totalQuestions = 0;

    totalQuestions += nounQuestions.length;
    totalQuestions += verbQuestions.length;
    totalQuestions += adjectiveQuestions.length;
    totalQuestions += adverbQuestions.length;
    totalQuestions += pronounQuestions.length;
    totalQuestions += wordFormationQuestions.length;
    totalQuestions += sentenceConstructionQuestions.length;
    totalQuestions += directIndirectSpeechQuestions.length;

    return totalQuestions;
  }