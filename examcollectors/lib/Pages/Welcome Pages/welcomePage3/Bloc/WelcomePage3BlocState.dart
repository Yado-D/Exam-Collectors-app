class Welcomepage3blocstate {
  final String PositionButtonClicked;

  Welcomepage3blocstate({
    this.PositionButtonClicked = '',
  });
  Welcomepage3blocstate copyWith({
    String? PositionButtonClicked,
  }) {
    return Welcomepage3blocstate(
      PositionButtonClicked:
          PositionButtonClicked ?? this.PositionButtonClicked,
    );
  }
}
