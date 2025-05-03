import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:examcollectors/Pages/SignInPage/Bloc/signInBlocEvent.dart';
import 'package:examcollectors/Pages/SignInPage/Bloc/signInBlocState.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>(emailEvent);
    on<PasswordEvent>(passwordEvent);
  }
  FutureOr<void> emailEvent(
    EmailEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(email: event.email));
    print(state.email);
    print(state.password);
  }

  FutureOr<void> passwordEvent(
    PasswordEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(password: event.password));
    print(state.email);
    print(state.password);
  }
}
