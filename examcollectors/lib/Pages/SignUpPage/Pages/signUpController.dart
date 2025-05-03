import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Models/UserModels.dart';
import '../../../global.dart';
import '../../../utils/constants.dart';
import '../../../utils/fluttertoast.dart';
import '../../../widgets/CommonSnackBar.dart';
import '../../Welcome Pages/WelcomePageOnlyTeacher/teacher_info_bloc.dart';
import '../../Welcome Pages/welcomePage2/Bloc/welcomePage2Bloc.dart';
import '../../Welcome Pages/welcomePage3/Bloc/WelcomePage3Bloc.dart';
import '../../Welcome Pages/welcomePage4/Bloc/WelcomePage4Bloc.dart';
import '../Bloc/SignUpBloc.dart';

class SignUpController {
  final BuildContext context;
  const SignUpController({
    required this.context,
  });
  Future<void> handleSignup() async {
    try {
      final teacherInfo = context.read<TeacherInfoBloc>().state;
      final userUniversitys = context.read<Welcomepage4blocs>().state;
      final userEducationLevels = context.read<Welcomepage3bloc>().state;
      final userCurrentStatus = context.read<WelcomePage2Bloc>().state;
      final state = context.read<SignUpBloc>().state;
      String userCurrentState = userCurrentStatus.textButtonCliked;
      String userEducationLevel = userEducationLevels.PositionButtonClicked;
      String userUniversity = userUniversitys.SelectedItem;
      String emailAddress = state.email;
      String password = state.password;
      String phoneNumber = state.phoneNumber;
      String name = state.name;

      if (emailAddress.isEmpty) {
        //warning
        toastInfo(msg: "You need to insert your email address!");
        return;
      }
      if (password.isEmpty) {
        //warning
        toastInfo(msg: "You need to insert your password!");
        return;
      }
      if (name.isEmpty) {
        //warning
        toastInfo(msg: "You need to insert your name!");
        return;
      }
      if (phoneNumber.isEmpty) {
        //warning
        toastInfo(msg: "You need to insert your phone number!");
        return;
      }

      try {
        UserModels userModels = UserModels(
          userName: name,
          userEmail: emailAddress,
          userPassword: password,
          userPhone: phoneNumber,
          userEducationLevel: userEducationLevel,
          userUniversity: userUniversity,
          userType: 'premium',
          userCurrentStatus: userCurrentState,
          userImage: '',
        );
        UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
        print("${userModels!.userName}++++++++++++++++++++++++++");
        if (userCurrentStatus.textButtonCliked == 'teacher') {
          await FirebaseFirestore.instance
              .collection('TeacherInfo')
              .doc(emailAddress)
              .set({
            'userName': userModels!.userName,
            'userEmail': userModels!.userEmail,
            'userPassword': userModels!.userPassword,
            'userEducationLevel': userModels!.userEducationLevel,
            'userUniversity': userModels!.userUniversity,
            'userType': userModels!.userType,
            'userCurrentStatus': userModels!.userCurrentStatus,
            'userPhone': userModels!.userPhone,
            "userImage": userModels!.userImage,
            "biography": teacherInfo.biography,
            "achievement": teacherInfo.achivment,
            "badge": 0,
          });
        } else {
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(emailAddress)
              .set(userModels.toMap());
        }

        FirebaseAuth.instance.currentUser!.sendEmailVerification();

        var user = credential.user;
        if (user != null) {
          Global.storageServices
              .setBool(AppConstants.STORAGE_DEVICE_OPENED_FIRST, true);
          Global.storageServices.setData(AppConstants.USERDATA, userModels);
          //we got user information
          commonSnackBar(
              context,
              'Congradulations! for being a member of EXAM COLLECTORS Community.We sent email verification to you please verify your email account and Sign in.',
              ColorCollections.WhiteColor,
              ColorCollections.TextColor.withOpacity(0.7));
          Navigator.of(context).pushNamed(
            '/sign_in_page',
          );
        } else {
          //we got error when fetching user from firebase
          toastInfo(
              msg:
                  "Error : please check your internet connection and try again.");
          return;
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          toastInfo(msg: "Invalid email please provide correct email.");
          return;
        } else if (e.code == 'email-already-in-use') {
          toastInfo(
              msg: "this email is already in use please sign in instead.");
          return;
        } else if (e.code == 'weak-password') {
          toastInfo(msg: "You entered weak password.");
          return;
        } else {
          toastInfo(msg: e.toString());
          return;
        }
      }
    } catch (e) {
      print('error!');
    }
  }
}
