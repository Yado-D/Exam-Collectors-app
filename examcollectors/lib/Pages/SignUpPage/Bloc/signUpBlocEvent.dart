abstract class SignUpEvent {
  const SignUpEvent();
}

class NameEvent extends SignUpEvent {
  final String Name;
  const NameEvent(this.Name);
}

class EmailEvent extends SignUpEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignUpEvent {
  final String password;
  const PasswordEvent(this.password);
}

class PhoneEvent extends SignUpEvent {
  final String phoneNumber;
  const PhoneEvent(this.phoneNumber);
}
