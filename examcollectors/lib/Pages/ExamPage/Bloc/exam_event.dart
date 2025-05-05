part of 'exam_bloc.dart';

@immutable
sealed class ExamEvent {}

class ExamLoadingEvent extends ExamEvent {}

class ExamLoadedEvent extends ExamEvent {
  final List<Map<String, dynamic>> questionList;
  final String examTime;
  ExamLoadedEvent({required this.questionList, required this.examTime});
}
