import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Models/UserModels.dart';
import '../../../auth/GetUserDetails.dart';
import '../../../global.dart';
import '../../../utils/constants.dart';
import '../../../utils/fluttertoast.dart';
import '../../../widgets/CommonSnackBar.dart';
import '../Bloc/SignInBloc.dart';

//signin controller

class SigninController {
  final BuildContext context;
  const SigninController({
    required this.context,
  });
  Future<void> handleLogin(String type) async {
    try {
      if (type == "email") {
        // this is for email login as there are a lot of login methods
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
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

        try {
          UserCredential credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          print("passed :  1\n");

          if (!credential.user!.emailVerified) {
            //check your inbox
            toastInfo(msg: "You need to verify your email address!");
            return;
          }
          var user = credential.user;
          if (user != null) {
            print("passed :  2\n");
            Global.storageServices
                .setBool(AppConstants.STORAGE_DEVICE_OPENED_FIRST, true);
            Map<String, dynamic> userDetails =
                await Getuserdetails(email: emailAddress).userMap();
            if (userDetails.isEmpty) {
              userDetails =
                  await Getuserdetails(email: emailAddress).TeacherMap();
            }
            print("passed :  3  ${userDetails}\n");
            Global.storageServices.setData(
                AppConstants.USERDATA, UserModels.fromJson(userDetails));
            print("passed :  4  ${userDetails}\n");

            //we got user information
            commonSnackBar(
                context,
                'Welcome Back! we glad to serve you.ask anything you want to share with us in admin chat.',
                ColorCollections.WhiteColor,
                ColorCollections.TextColor.withOpacity(0.7));
            //we check if the user type by accessing user type from database
            //if user type is free we move to home page
            //if usertype is premium we go to premium home page
            //if usertype is none we move to premium page

            //new idea

            try {
              final userSignInDetails = context.read<SignInBloc>().state;
              String userEmail = userSignInDetails.email;
              print(
                  "i am about to getting user [rofile to save to shared preference\n");
              //first got the user data and
              Future.delayed(const Duration(seconds: 5));
              Map<String, dynamic> alpha = userDetails;
              if (alpha != Null) {
                print("$alpha  thi is alpha#################3");
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home_page',
                  (Route<dynamic> route) => false,
                  arguments: alpha,
                );
              } else {
                print(alpha);
                Navigator.of(context).pushNamed('/home_page', arguments: {
                  'userName': "yared",
                  'userEmail': "yared@gmail.com",
                  'userPassword': "123456",
                  'userPhone': "099985755",
                  'userCurrentStatus': "student",
                  'userEducationLevel': "degree",
                  'userUniversity': "AASTU",
                  'userType': "free",
                });
              }
            } catch (e) {
              print(e.toString());
            }

            ///end
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
          } else if (e.code == 'user-not-found') {
            toastInfo(msg: "There is no user with that email.");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "You entered wrong password.");
            return;
          } else if (e.code == 'user-disabled') {
            toastInfo(msg: "user disabled");
            return;
          } else {
            toastInfo(msg: e.toString());
            return;
          }
        }
      }
    } catch (e) {
      print(e.toString());
      print('error!');
    }
  }
}

// class Signincontroller {
//   final BuildContext context;
//   Signincontroller({
//     required this.context,
//   });
//
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   //for sign in
//
//   Future<String> SignInUser() async {
//     String res = 'Unexpected Error';
//     try {
//       dynamic userInfo = context.read<SignInBloc>().state;
//       String userEmail = userInfo.email;
//       String userPassword = userInfo.password;
//       final cred = await firebaseAuth.signInWithEmailAndPassword(
//         email: userEmail,
//         password: userPassword,
//       );
//       if (!cred.user!.emailVerified) {
//         res =
//             'Email is not verified.please go to your email box and verify EXAM COLLECTORS email confirmations.';
//       } else {
//         res = 'success';
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.toString() == 'wrong-password') {
//         return res = 'please provide the correct email.';
//       } else if (e.toString() == 'invalid-email') {
//         return res =
//             'This email is invalid please type the correct email address.';
//       } else if (e.toString() == 'user-not-found') {
//         return res =
//             'This email is not found please sign up or give us correct email.';
//       } else {
//         return res = e.toString();
//       }
//     }
//     return res;
//   }
//
//   Future<String> SignUpUser() async {
//     String res = 'Unexpected Error';
//     try {
//       dynamic userCurrentStatus = context.read<WelcomePage2Bloc>().state;
//       String userCurrentState = userCurrentStatus.textButtonCliked;
//       dynamic userEducationLevels = context.read<Welcomepage3bloc>().state;
//       String userEducationLevel = userEducationLevels.PositionButtonClicked;
//       dynamic userUniversitys = context.read<Welcomepage4blocs>().state;
//       String userUniversity = userUniversitys.SelectedItem;
//       dynamic userInfo = context.read<SignUpBloc>().state;
//       String userEmail = userInfo.email;
//       String userPassword = userInfo.password;
//       String userName = userInfo.name;
//       String userPhone = userInfo.phoneNumber;
//
//       UserModels userModels = UserModels(
//         userName: userName,
//         userEmail: userEmail,
//         userPassword: userPassword,
//         userPhone: userPhone,
//         userEducationLevel: userEducationLevel,
//         userUniversity: userUniversity,
//         userType: 'premium',
//         userCurrentStatus: userCurrentState,
//       );
//       if (!userEmail.isNotEmpty) {
//         toastInfo(msg: 'email shouldn\'t empty');
//       }
//       try {
//         final cred = firebaseAuth.createUserWithEmailAndPassword(
//             email: userEmail, password: userPassword);
//         await firestore
//             .collection('Users')
//             .doc(userEmail)
//             .set(userModels.toMap());
//         firebaseAuth.currentUser!.sendEmailVerification();
//       } catch (e) {
//         res = 'error when registering user';
//       }
//       res = 'success';
//     } on FirebaseAuthException catch (e) {
//       if (e.toString() == 'email-already-in-use') {
//         return res =
//             'This email is already in use.please choose another account or sign in instead.';
//       } else if (e.toString() == 'invalid-email') {
//         return res =
//             'This email is invalid please type the correct email address.';
//       } else if (e.toString() == 'invalid-emai') {
//         return res =
//             'This email is invalid please type the correct email address.';
//       } else {
//         return res = 'weak-password';
//       }
//     }
//     return res;
//   }
// }
