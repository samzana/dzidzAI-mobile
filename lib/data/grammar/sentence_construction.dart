import 'package:dzidzai_mobile/models/grammar/grammar_exercise.dart';

final List<GrammarExerciseModel> sentenceConstructionQuestions = [
  GrammarExerciseModel(
    type: "mcq",
    question: "I will go to the store _____.",
    options: ["later", "book"],
    answer: "later",
    instructions: "Choose the correct word to complete the sentence.",
    feedback: "Later is the correct word to complete the sentence.",
  ),
  GrammarExerciseModel(
    type: "mcq",
    question: "She _____ her homework on time.",
    options: ["finished", "happy"],
    answer: "finished",
    instructions: "Choose the correct word from the options.",
    feedback: "Finished is the correct word to complete the sentence.",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "To the store, I will go later.",
    answer: "I will go to the store later.",
    instructions: "Rewrite the sentence correctly.",
    feedback: "This is the correct sentence construction.",
  ),
];
