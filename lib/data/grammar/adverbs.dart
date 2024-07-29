import 'package:dzidzai_mobile/models/grammar/grammar_exercise.dart';

final List<GrammarExerciseModel> adverbQuestions = [
  GrammarExerciseModel(
    type: "mcq",
    question: "She sings _____.",
    options: ["beautifully", "dog"],
    answer: "beautifully",
    instructions: "Choose the correct adverb to complete the sentence.",
    feedback: "Beautifully is the correct adverb as it describes how she sings.",
  ),
  GrammarExerciseModel(
    type: "mcq",
    question: "He runs _____ in the park.",
    options: ["quickly", "books"],
    answer: "quickly",
    instructions: "Choose the correct adverb from the options.",
    feedback: "Quickly is the correct adverb as it describes how he runs.",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "They laughed _____ at the joke.",
    answer: "loudly",
    instructions: "Rewrite the sentence with the correct adverb.",
    feedback: "Loudly is the correct adverb as it describes how they laughed.",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "She finished her homework _____.",
    answer: "quickly",
    instructions: "Rewrite the sentence with the correct adverb.",
    feedback: "Quickly is the correct adverb as it describes how she finished her homework.",
  ),
];
