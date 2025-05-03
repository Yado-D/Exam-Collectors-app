class teacherInfoState {
  final String biography;
  final List<String>? achivment;
  teacherInfoState({
    this.biography = "",
     this.achivment,
  });
  teacherInfoState copyWith({
    String? biography,
    required List<String>? achivment,
  }) {
    return teacherInfoState(
      biography: biography ?? this.biography,
      achivment: achivment ?? this.achivment,
    );
  }
}
