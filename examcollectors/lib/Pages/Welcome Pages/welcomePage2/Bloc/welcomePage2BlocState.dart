class WelcomePage2State {
  final String textButtonCliked;

  WelcomePage2State({
    this.textButtonCliked = '',
  });

//it ceate a new instance every time when i change the value of one of those

  WelcomePage2State copyWith({
    String? textButtonCliked,
  }) {
    return WelcomePage2State(
      textButtonCliked: textButtonCliked ?? this.textButtonCliked,
    );
  }
}
