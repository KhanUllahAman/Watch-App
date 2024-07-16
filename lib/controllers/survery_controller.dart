import 'package:get/get.dart';

class UserController extends GetxController {
  final RxList<Map> _questionsData = <Map>[
    {
      "label": "Difficulty falling asleep",
      "question": "Difficulty falling asleep",
      "choices": [
        "None",
        "Mild ",
        "Moderate ",
        "Severe ",
        "Very Severe",
      ],
      "answer": null
    },
    {
      "label": "Difficulty staying asleep",
      "question": "Difficulty staying asleep",
      "choices": [
        "None",
        "Mild ",
        "Moderate ",
        "Severe ",
        "Very Severe",
      ],
      "answer": null
    },
    {
      "label": "Problems waking up too early",
      "question": "Problems waking up too early",
      "choices": [
        "None",
        "Mild ",
        "Moderate ",
        "Severe ",
        "Very Severe",
      ],
      "answer": null
    },
    {
      "label":
          "How SATISFIED/DISSATISFIED are you with your CURRENT sleep pattern?",
      "question":
          "How SATISFIED/DISSATISFIED are you with your CURRENT sleep pattern?",
      "choices": [
        "Very Satisfied",
        "Satisfied",
        "Moderately Satisfied",
        "Dissatisfied",
        "Very Dissatisfied",
      ],
      "answer": null
    },
    {
      "label":
          "How NOTICEABLE to others do you think your sleep problem is in terms of impairing the quality of your life?",
      "question":
          "How NOTICEABLE to others do you think your sleep problem is in terms of impairing the quality of your life?",
      "choices": [
        "Not at all Noticeable",
        "Noticeable a little",
        "Somwhat Noticeable",
        "Much Noticeable",
        "Very Much Noticeable",
      ],
      "answer": null
    },
    {
      "label":
          "How WORRIED/DISTRESSED are you about your current sleep problem?",
      "question":
          "How WORRIED/DISTRESSED are you about your current sleep problem?",
      "choices": [
        "Not at all worried",
        "A little worried",
        "Somewhat worried",
        "Much worried",
        "Very Much worried",
      ],
      "answer": null
    },
    {
      "label":
          "To what extent do you consider your sleep problem to INTERFERE with your daily functioning (e.g., daytime fatigue, mood, ability to function at work/daily chores, concentration, memory, etc.) CURRENTLY?",
      "question":
          "To what extent do you consider your sleep problem to INTERFERE with your daily functioning (e.g., daytime fatigue, mood, ability to function at work/daily chores, concentration, memory, etc.) CURRENTLY?",
      "choices": [
        "Not at all interfering",
        "A little interfering",
        "Somewhat interfering",
        "Much interfering",
        "Very much interfering",
      ],
      "answer": null
    },
    {
      "label": "How OFTEN do you experience trouble sleeping during the week?",
      "question":
          "How OFTEN do you experience trouble sleeping during the week?",
      "choices": [
        "Never",
        "Rarely (1-2 nights)",
        "Ocassionally (3-4 nights)",
        "Frequently(5-6 nights)",
        "Always (7 nights)",
      ],
      "answer": null
    },
    {
      "label":
          "How LONG does it typically take you to fall asleep once you're in bed?",
      "question":
          "How LONG does it typically take you to fall asleep once you're in bed?",
      "choices": [
        "Less than 15 minutes",
        "15-30 minutes",
        "30-60 minutes",
        "More than 60 minutes",
        "I'm unsure/ I don't keep track",
      ],
      "answer": null
    },
    {
      "label":
          "How OFTEN do you wake up during the night and have trouble getting back to sleep?",
      "question":
          "How OFTEN do you wake up during the night and have trouble getting back to sleep?",
      "choices": [
        "Never",
        "Rarely (1-2 times)",
        "Ocassionally (3-4 times)",
        "Frequently (5-6 times)",
        "Always (7 or more times)",
      ],
      "answer": null,
    },
  ].obs;

  List<Map> get questionsData => _questionsData.toList();

  void addAnswer(String key, String value) {
    List<Map> updatedList = _questionsData.map((e) {
      if (e["label"] == key) {
        return {...e, "answer": value};
      }
      return e;
    }).toList();

    _questionsData.assignAll(updatedList);
  }

  bool isAllQuestionsAnswered() {
    for (Map element in _questionsData) {
      if (element["answer"] == null) return false;
    }
    return true;
  }

  void removeAnswer(String key) {
    List<Map> updatedList = _questionsData.map((e) {
      if (e["label"] == key) {
        return {...e, "answer": null};
      }
      return e;
    }).toList();

    _questionsData.assignAll(updatedList);
  }

  int addAllAnswers() {
    return 17;
  }
}
