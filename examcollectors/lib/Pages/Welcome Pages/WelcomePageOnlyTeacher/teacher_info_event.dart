part of 'teacher_info_bloc.dart';

@immutable
sealed class TeacherInfoEvent {}

class teacherInfo extends TeacherInfoEvent{
  String biography;
  List<String>? achivment;
  teacherInfo({
    required this.biography,
    required this.achivment,
  });
}