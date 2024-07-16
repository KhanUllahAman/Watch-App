import '../Models/form_model.dart';

class FormRepository {
  final List<FormModel> forms = [
    // Q No.1
    FormModel(
      question: "Difficulty Falling asleep",
      options: [
        "Not at all",
        "SomeWhat",
        "Much",
        "Very Much",
      ],
      optionScore: [
        0,
        2,
        3,
        4,
      ],
    ),

    // Q No.2
    FormModel(
      question: "Difficulty staying asleep:",
      options: [
        "Not at all",
        "A little",
        "Somewhat",
        "Very Much",
      ],
      optionScore: [
        0,
        1,
        2,
        4,
      ],
    ),

    // Q No.3
    FormModel(
      question: "Problem waking up too early",
      options: [
        "Not at all",
      ],
      optionScore: [
        0,
      ],
    ),

    // Q No.4
    FormModel(
      question:
          "How satisfied/dissatisfied are you with your current sleep pattern?",
      options: [
        "Very Satisfied",
        "Not at all",
        "A little",
        "Somewhat",
        "Much",
        "Very Dissatisfied",
      ],
      optionScore: [
        3,
        0,
        1,
        2,
        3,
        4,
      ],
    ),

    // Q No.5
    FormModel(
      question:
          "To what extent do you consider your sleep problem to interfere with your daily functioning (e.g., daytime fatigue, ability to function at work/daily chores, concentration, memory, mood, etc.)?",
      options: [
        "Very Much",
        "Not at all",
        "Barely",
        "SomeWhat",
        "Much",
      ],
      optionScore: [
        4,
        0,
        1,
        2,
        3,
      ],
    ),

    // Q No.6
    FormModel(
      question:
          "How noticeable to others do you think your sleeping problem is in terms of impairing the quality of your life?",
      options: [
        "Very Much Interfering",
        "Not At All",
        "Barely",
        "Somewhat",
        "Much",
        "Very Noticeable",
      ],
      optionScore: [
        5,
        0,
        1,
        2,
        3,
        4,
      ],
    ),

    // Q No.7
    FormModel(
      question:
          "How worried/distressed are you about your current sleep problem?",
      options: [
        "Very Much",
        "Not at all",
        "A little",
        "Somewhat",
        "Much",
      ],
      optionScore: [
        4,
        0,
        1,
        2,
        3,
      ],
    ),

    // Q No.8
    FormModel(
      question:
          "How often do you experience difficulty falling asleep, staying asleep, or waking up too early?",
      options: [
        "Rarely",
        "Ocassionally",
        "Frequently",
        "Every Night",
      ],
      optionScore: [
        0,
        1,
        2,
        3,
      ],
    ),

    // Q No.9
    FormModel(
      question: "How long have you been experiencing these sleep disturbances?",
      options: [
        "Less than a Month",
        "1-3 Months",
        "3-6 Months",
        "More than 6  Months",
      ],
      optionScore: [
        0,
        1,
        2,
        3,
      ],
    ),

    // Q No.10
    FormModel(
      question:
          "How much do your sleep disturbances affect your ability to function during the day?",
      options: [
        "Not at all",
        "Mildly",
        "Moderately",
        "Severly",
      ],
      optionScore: [
        0,
        1,
        2,
        3,
      ],
    ),
  ];
}
