import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'exam_event.dart';
part 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  ExamBloc() : super(ExamInitial()) {
    on<ExamLoadingEvent>(examLoadingEvent);
  }

  FutureOr<void> examLoadingEvent(
    ExamLoadingEvent event,
    Emitter<ExamState> emit,
  ) {
    emit(ExamInitial());
  }
}
