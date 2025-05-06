import 'package:equatable/equatable.dart';

class OptionModel {
  final String value;
  final bool isCorrect;
  final String explanations;

  OptionModel({
    required this.value,
    required this.isCorrect,
    required this.explanations,
  });

  static OptionModel fromJson(Map<String, dynamic> json) {
    return OptionModel(
      value: json['value'],
      isCorrect: json['isCorrect'] ?? false, // Default to false if not provided
      explanations: json['explanations'] ?? '', // Default to empty if not provided
    );
  }
}

class QuestionModel {
  final String title;
  final List<OptionModel> options;
  final String explanations;
  final bool isOption; // New field to distinguish question types

  QuestionModel({
    required this.title,
    required this.options,
    required this.explanations,
    this.isOption = true, // Default to true for backward compatibility
  });

  static QuestionModel fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      title: json['title'],
      options: (json['options'] as List<dynamic>?)
          ?.map((item) => OptionModel.fromJson(item as Map<String, dynamic>))
          .toList() ?? [], // Default to empty list if options not provided
      explanations: json['explanations'] ?? '', // Default to empty if not provided
      isOption: json['isOption'] ?? true, // Default to true for backward compatibility
    );
  }
}

class QuestionsModel extends Equatable {
  final String? examTime;
  final List<QuestionModel> questionList;

  const QuestionsModel({
    required this.examTime,
    required this.questionList,
  });

  factory QuestionsModel.fromJson(List<Map<String, dynamic>> json, String examTime) {
    List<QuestionModel> questionList = json.map((ex) => QuestionModel.fromJson(ex)).toList();
    return QuestionsModel(examTime: examTime, questionList: questionList);
  }

  Map<String, dynamic> toJson() => {
    'examTime': examTime,
    'questionList': questionList,
  };

  @override
  List<Object?> get props => [examTime, questionList];

  @override
  bool get stringify => true;
}