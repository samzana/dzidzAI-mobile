import 'package:dzidzai_mobile/models/grammar/grammar_exercise.dart';

final List<GrammarExerciseModel> wordFormationQuestions = [
  GrammarExerciseModel(
    type: "mcq",
    question: "She _____ the present beautifully.",
    options: ["wrapped", "run"],
    answer: "wrapped",
    instructions: "Choose the correct form of the word to complete the sentence.",
    feedback: "Wrapped is the correct form of the word 'wrap' to complete the sentence.",
  ),
  GrammarExerciseModel(
    type: "mcq",
    question: "He is a very _____ player.",
    options: ["talented", "books"],
    answer: "talented",
    instructions: "Choose the correct form of the word from the options.",
    feedback: "Talented is the correct form of the word 'talent' to complete the sentence.",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "They _____ the house last year.",
    answer: "built",
    instructions: "Rewrite the sentence with the correct form of the word.",
    feedback: "Built is the correct form of the word 'build' to complete the sentence.",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "She _____ the invitation to the party.",
    answer: "accepted",
    instructions: "Rewrite the sentence with the correct form of the word.",
    feedback: "Accepted is the correct form of the word 'accept' to complete the sentence.",
  ),
];
