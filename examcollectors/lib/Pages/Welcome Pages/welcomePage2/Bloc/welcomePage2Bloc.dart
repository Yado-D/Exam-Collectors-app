import 'package:bloc/bloc.dart';
import 'package:examcollectors/Pages/Welcome%20Pages/welcomePage2/Bloc/welcomePage2BlocEvent.dart';
import 'package:examcollectors/Pages/Welcome%20Pages/welcomePage2/Bloc/welcomePage2BlocState.dart';

class WelcomePage2Bloc extends Bloc<WelcomeBloc2Event, WelcomePage2State> {
  WelcomePage2Bloc() : super(WelcomePage2State()) {
    on<textButtonClikedEvent>(TextButtonClikedEvent);
  }

  void TextButtonClikedEvent(textButtonClikedEvent event, Emitter emit) {
    emit(
        WelcomePage2State().copyWith(textButtonCliked: event.textButtonCliked));
  }
}
