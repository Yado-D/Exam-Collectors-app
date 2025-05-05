import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:examcollectorsadminapp/pages/SignInPage/Bloc/signInBlocEvent.dart';
import 'package:examcollectorsadminapp/pages/SignInPage/Bloc/signInBlocState.dart';


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
    print(state.email);
    emit(state.copyWith(password: event.password));
    print(state.email);
    print(state.password);
  }
}
