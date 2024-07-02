import 'package:dzidzai_mobile/models/grammar/grammar_exercise.dart';

final List<GrammarExerciseModel> nounQuestions = [
    GrammarExerciseModel(
      type: "mcq",
      question: 'Which of the following words is a noun?',
      options: ['Cat', 'Quickly'],
      answer: 'Cat',
      instructions: 'Choose the correct noun from the options below.',
      feedback: 'A noun is a word that names a person, place, thing, or idea.',
    ),
    GrammarExerciseModel(
      type: "rewriteSentence",
      question:
          "i visited my grandparents in bulawayo and we spent the afternoon talking about their childhood",
      answer:
          "I visited my grandparents in Bulawayo, and we spent the afternoon talking about their childhood.",
      instructions: "Rewrite the sentence with the correct punctuation.",
      feedback:
          "The sentence should start with a capital letter and end with a full stop. Names of places and people should also start with a capital letter.",
    ),
    GrammarExerciseModel(
      type: "mcq",
      question: 'Which of the following words is a verb?',
      options: ['Jump', 'Table'],
      answer: 'Jump',
      instructions: 'Choose the correct verb from the options below.',
      feedback: 'A verb is a word that describes an action or state.',
    ),

    GrammarExerciseModel(
      type: "rewriteSentence",
      question:
          "the children played in the park and they had a lot of fun",
      answer: "The children played in the park, and they had a lot of fun.",
      instructions: "Rewrite the sentence with the correct punctuation.",
      feedback:
          "The sentence should start with a capital letter and end with a full stop. Names of places and people should also start with a capital letter.",
    )
  ];