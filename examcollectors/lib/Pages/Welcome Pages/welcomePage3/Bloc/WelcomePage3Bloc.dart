import 'package:bloc/bloc.dart';

import 'WelcomePage3BlocEvent.dart';
import 'WelcomePage3BlocState.dart';

class Welcomepage3bloc
    extends Bloc<Welcomepage3blocevent, Welcomepage3blocstate> {
  Welcomepage3bloc() : super(Welcomepage3blocstate()) {
    on<PositionButtonClikedEvent>(positionButtonClikedEvent);
  }
  void positionButtonClikedEvent(
      PositionButtonClikedEvent event, Emitter emit) {
    emit(
      Welcomepage3blocstate().copyWith(
        PositionButtonClicked: event.PositionButtonCliked,
      ),
    );
  }
}
