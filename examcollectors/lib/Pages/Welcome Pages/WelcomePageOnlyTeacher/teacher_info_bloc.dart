import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:examcollectors/Pages/Welcome%20Pages/WelcomePageOnlyTeacher/teacher_info_state.dart';
import 'package:meta/meta.dart';

part 'teacher_info_event.dart';
// part 'teacher_info_state.dart';

class TeacherInfoBloc extends Bloc<TeacherInfoEvent, teacherInfoState> {
  TeacherInfoBloc() : super(teacherInfoState()) {
    // on<TeacherInfoEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<teacherInfo>(teacherInfoEvent);
  }
  FutureOr teacherInfoEvent(teacherInfo event,Emitter emit){
    emit(teacherInfoState(biography: event.biography,achivment: event.achivment));
  }
}
