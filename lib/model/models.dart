class TopicModel {
  String topicName = "";

  TopicModel({
    required this.topicName
  });

  TopicModel.fromJson(Map<String, dynamic> json) {
    topicName = json['topicName'];
  }
}

class QuizModel {
  String question = "";
  String answer = "";
  String optionOne = "";
  String optionTwo = "";
  String optionThree = "";
  String optionFour = "";
  String topicName = "";
  String correct = "";
  String optionChoosen = "";

  QuizModel({
    required this.question,
    required this.answer,
    required this.optionOne,
    required this.optionTwo,
    required this.optionThree,
    required this.optionFour,
    required this.topicName,
    required this.correct,
    required this.optionChoosen
  });

  QuizModel copyWith({
    String? question,
    String? answer,
    String? optionOne,
    String? optionTwo,
    String? optionThree,
    String? optionFour,
    String? topicName,
    String? correct,
    String? optionChoosen
  }) => QuizModel(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      optionOne: optionOne ?? this.optionOne,
      optionTwo: optionTwo ?? this.optionTwo,
      optionThree: optionThree ?? this.optionThree,
      optionFour: optionFour ?? this.optionFour,
      topicName: topicName ?? this.topicName,
      correct: correct ?? this.correct,
      optionChoosen: optionChoosen ?? this.optionChoosen
  );

  QuizModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    optionOne = json['optionOne'];
    optionTwo = json['optionTwo'];
    optionThree = json['optionThree'];
    optionFour = json['optionFour'];
    topicName = json['topicName'];
  }
}