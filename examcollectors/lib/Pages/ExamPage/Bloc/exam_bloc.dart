import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:examcollectors/Models/examQuestionModel.dart';
import 'package:meta/meta.dart';

part 'exam_event.dart';
part 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  ExamBloc() : super(ExamInitial()) {
    on<ExamLoadedEvent>(examLoadedEvent);
  }

  FutureOr<void> examLoadedEvent(
    ExamLoadedEvent event,
    Emitter<ExamState> emit,
  ) {
    emit(ExamInitial());

    //call the fromjson methode in QuestionsModel
    QuestionsModel questionModel = QuestionsModel.fromJson(
      event.questionList,
      event.examTime,
    );
    //then get the result and assign to the examLoaded state
    emit(
      ExamLoadedState(questionsModelList: questionModel),
    );
  }
}
