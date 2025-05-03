import 'package:equatable/equatable.dart';
import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:examcollectors/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';

class QuestionModel {
  final String title;
  final List<Map<String, dynamic>> options;
  final String explanations;
  QuestionModel({
    required this.title,
    required this.options,
    required this.explanations,
  });

  static QuestionModel fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      title: json['title'],
      options: (json['options'] as List<dynamic>)
          .map((item) => item as Map<String, dynamic>)
          .toList(),
      explanations: json['explanations'],
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
  factory QuestionsModel.fromJson(
      List<Map<String, dynamic>> json, String examTime) {
    List<QuestionModel> questionList = [];
    int index = 0;
    for (var ex in (json) as Iterable) {
      questionList.add(QuestionModel.fromJson(ex));
      index++;
      print("...$index...");
    }
    return QuestionsModel(examTime: examTime, questionList: questionList);
  }
  Map<String, dynamic> toJson() => {
        'examTime': examTime,
        'questionList': questionList,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [examTime, questionList];

  @override
  bool get stringify => true;
}
