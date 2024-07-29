import 'package:dzidzai_mobile/models/grammar/grammar_exercise.dart';

final List<GrammarExerciseModel> pronounQuestions = [
  GrammarExerciseModel(
    type: "mcq",
    question: "_____ is my best friend.",
    options: ["She", "dog"],
    answer: "She",
    instructions: "Choose the correct pronoun to complete the sentence.",
    feedback: "She is the correct pronoun as it refers to a female.",
  ),
  GrammarExerciseModel(
    type: "mcq",
    question: "_____ went to the store.",
    options: ["He", "books"],
    answer: "He",
    instructions: "Choose the correct pronoun from the options.",
    feedback: "He is the correct pronoun as it refers to a male.",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "They gave the gift to _____.",
    answer: "me",
    instructions: "Rewrite the sentence with the correct pronoun.",
    feedback: "Me is the correct pronoun as it refers to the speaker.",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "The teacher asked _____ to read the book.",
    answer: "us",
    instructions: "Rewrite the sentence with the correct pronoun.",
    feedback: "Us is the correct pronoun as it refers to the speaker and others.",
  ),
];
