abstract class WelcomeBloc2Event {}

class textButtonClikedEvent extends WelcomeBloc2Event {
  String textButtonCliked;
  textButtonClikedEvent({required this.textButtonCliked});
}
