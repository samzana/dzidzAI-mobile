import 'package:dzidzai_mobile/models/grammar/grammar_exercise.dart';

final List<GrammarExerciseModel> adjectiveQuestions = [
  GrammarExerciseModel(
    type: "mcq",
    question: "The _____ dog barked loudly.",
    options: ["happy", "run"],
    answer: "happy",
    instructions: "Choose the correct adjective to complete the sentence.",
    feedback: "Happy is the correct adjective as it describes the dog.",
  ),
  GrammarExerciseModel(
    type: "mcq",
    question: "She wore a _____ dress to the party.",
    options: ["blue", "books"],
    answer: "blue",
    instructions: "Choose the correct adjective from the options.",
    feedback: "Blue is the correct adjective as it describes the dress.",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "They had a _____ time at the concert.",
    answer: "great",
    instructions: "Rewrite the sentence with the correct adjective.",
    feedback: "Great is the correct adjective as it describes the time they had.",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "The _____ cake was delicious.",
    answer: "chocolate",
    instructions: "Rewrite the sentence with the correct adjective.",
    feedback: "Chocolate is the correct adjective as it describes the cake.",
  ),
];
