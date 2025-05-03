class SignUpState {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  SignUpState({
    this.name = "",
    this.email = "",
    this.password = "",
    this.phoneNumber = '0900000000',
  });
  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
