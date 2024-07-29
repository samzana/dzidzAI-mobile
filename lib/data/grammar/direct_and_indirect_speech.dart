import 'package:dzidzai_mobile/models/grammar/grammar_exercise.dart';

final List<GrammarExerciseModel> directIndirectSpeechQuestions = [
  GrammarExerciseModel(
    type: "mcq",
    question: "He said, 'I am going to the market.'",
    options: ["He said that he was going to the market.", "He said he go to market."],
    answer: "He said that he was going to the market.",
    instructions: "Choose the correct indirect speech form of the sentence.",
    feedback: "The correct indirect speech form is 'He said that he was going to the market.'",
  ),
  GrammarExerciseModel(
    type: "mcq",
    question: "She said, 'I will call you tomorrow.'",
    options: ["She said that she would call you tomorrow.", "She said she call you tomorrow."],
    answer: "She said that she would call you tomorrow.",
    instructions: "Choose the correct indirect speech form of the sentence.",
    feedback: "The correct indirect speech form is 'She said that she would call you tomorrow.'",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "He said, 'I have finished my homework.'",
    answer: "He said that he had finished his homework.",
    instructions: "Rewrite the sentence in indirect speech.",
    feedback: "The correct indirect speech form is 'He said that he had finished his homework.'",
  ),
  GrammarExerciseModel(
    type: "rewriteSentence",
    question: "She said, 'I am studying for my exams.'",
    answer: "She said that she was studying for her exams.",
    instructions: "Rewrite the sentence in indirect speech.",
    feedback: "The correct indirect speech form is 'She said that she was studying for her exams.'",
  ),
];
