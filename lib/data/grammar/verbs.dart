import 'package:dzidzai_mobile/models/grammar/grammar_exercise.dart';

final List<GrammarExerciseModel> verbQuestions = [
  GrammarExerciseModel(
    type: "mcq",
    question: "She _____ to the store every morning.",
    options: ["goes", "happy"],
    answer: "goes",
    instructions: "Choose the correct verb to complete the sentence.",
    feedback: "Goes is the correct verb as it describes an action.",
  ),
  GrammarExerciseModel(
    type: "mcq",
    question: "He _____ his homework before dinner.",
    options: ["finishes", "blue"],
    answer: "finishes",
    instructions: "Choose the correct verb from the options.",
    feedback: "Finishes is the correct verb as it describes an action.",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "She _____ the ball over the fence.",
    answer: "threw",
    instructions: "Rewrite the sentence with the correct verb.",
    feedback: "Threw is the correct verb as it describes an action.",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "They _____ a song at the concert.",
    answer: "sang",
    instructions: "Rewrite the sentence with the correct verb.",
    feedback: "Sang is the correct verb as it describes an action.",
  ),
];
