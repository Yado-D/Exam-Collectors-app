part of 'exam_bloc.dart';

@immutable
sealed class ExamState {}

final class ExamInitial extends ExamState {}

final class ExamLoadedState extends ExamState {
  final QuestionsModel questionsModelList;

  ExamLoadedState({required this.questionsModelList});
}
