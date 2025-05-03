
import 'package:examcollectors/Pages/SignInPage/Bloc/SignInBloc.dart';
import 'package:examcollectors/auth/GetUserDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> logOutUser() async {
    await _auth.signOut();
  }
}

class getMeUserData {
  final BuildContext context;
  getMeUserData({required this.context});
  Future<Map<String, dynamic>> get_user_details() async {
    final state = context.read<SignInBloc>().state;
    String emailAddress = state.email;
    Map<String, dynamic> alpha =
        await Getuserdetails(email: emailAddress).userMap();
    return alpha;
  }
}
