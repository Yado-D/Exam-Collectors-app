import 'package:examcollectors/Pages/SignUpPage/Pages/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../utils/fluttertoast.dart';
import '../../../widgets/AllCommonWidget.dart';
import '../../SignInPage/Page/signInProgressIndicatorValue.dart';
import '../Bloc/SignUpBloc.dart';
import '../Bloc/signUpBlocEvent.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    bool loginClicked = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: ColorCollections.PageColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child:
            Stack(
              children: [
                // const FullPageContainer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ReusableText(
                        TextString: 'EXAM COLLECTORS',
                        FontSize: 30,
                        FromTop: 40,
                        FromBottom: 10,
                        FromLeft: 0,
                        TextColor: ColorCollections.SecondaryColor,
                        TextFontWeight: FontWeight.bold,
                      ),
                    ),
                    ReusableText(
                      FromTop: 10,
                      FromLeft: 150,
                      TextString: 'Sign Up',
                      FontSize: 35,
                      TextColor: ColorCollections.SecondaryColor,
                    ),
                    ReusableText(
                      TextString: 'Name',
                      FontSize: 15,
                      FromTop: 7,
                      FromLeft: 30,
                      TextColor: ColorCollections.SecondaryColor,
                      TextFontWeight: FontWeight.normal,
                    ),
                    reusableTextField(
                      FromLeft: 25,
                      FromRight: 15,
                      WidthOfContainer: MediaQuery.of(context).size.width,
                      widthOfTextField: MediaQuery.of(context).size.width - 200,
                      icon_name: 'person(1)',
                      hintText: 'Enter your Name',
                      textType: 'Name',
                      onchange: (value) {
                        context.read<SignUpBloc>().add(NameEvent(value));
                      },
                    ),
                    ReusableText(
                      TextString: 'Phone Number',
                      FontSize: 15,
                      FromTop: 7,
                      FromLeft: 30,
                      TextColor: ColorCollections.SecondaryColor,
                      TextFontWeight: FontWeight.normal,
                    ),
                    reusableTextField(
                      FromLeft: 25,
                      FromRight: 15,
                      WidthOfContainer: MediaQuery.of(context).size.width,
                      widthOfTextField: MediaQuery.of(context).size.width - 200,
                      icon_name: 'person(1)',
                      hintText: 'Enter your phone number',
                      textType: 'phone',
                      onchange: (value) {
                        context.read<SignUpBloc>().add(PhoneEvent(value));
                      },
                    ),
                    ReusableText(
                      TextString: 'Email',
                      FontSize: 15,
                      FromTop: 7,
                      FromLeft: 30,
                      TextColor: ColorCollections.SecondaryColor,
                      TextFontWeight: FontWeight.normal,
                    ),
                    reusableTextField(
                      FromLeft: 25,
                      FromRight: 15,
                      WidthOfContainer: MediaQuery.of(context).size.width,
                      widthOfTextField: MediaQuery.of(context).size.width - 200,
                      icon_name: 'person(1)',
                      hintText: 'Enter your Email',
                      textType: 'Email',
                      onchange: (value) {
                        if (value == '') {
                          toastInfo(msg: 'email shoul dn\'t be empty.');
                        }
                        context.read<SignUpBloc>().add(EmailEvent(value));
                      },
                    ),
                    ReusableText(
                      TextString: 'Password',
                      FontSize: 15,
                      FromTop: 7,
                      FromLeft: 30,
                      TextColor: ColorCollections.SecondaryColor,
                      TextFontWeight: FontWeight.normal,
                    ),
                    reusableTextField(
                      FromLeft: 25,
                      FromRight: 15,
                      WidthOfContainer: MediaQuery.of(context).size.width,
                      widthOfTextField: MediaQuery.of(context).size.width - 200,
                      icon_name: 'lock',
                      hintText: 'Enter your password',
                      textType: 'password',
                      onchange: (value) {
                        context.read<SignUpBloc>().add(PasswordEvent(value));
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableText(
                          TextString: 'Already a member ?',
                          FontSize: 15,
                          FromTop: 20,
                          FromLeft: 70,
                          TextColor: ColorCollections.TextColor,
                          TextFontWeight: FontWeight.bold,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/sign_in_page',
                              (route) => false,
                            );
                          },
                          child: ReusableText(
                            TextString: 'Log In',
                            FontSize: 15,
                            FromTop: 15,
                            TextColor: Colors.blue,
                            TextFontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 100,
                  right: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () async {
                      signinProgressIndicator.SignInProgressIndicator = true;
                      setState(() {
                        loginClicked = true;
                      });
                      await SignUpController(context: context).handleSignup();
                      setState(() {
                        loginClicked = false;
                      });
                      signinProgressIndicator.SignInProgressIndicator = false;
                    },
                    child: Container(
                      height: 50,
                      // width: 150,
                      margin:
                          const EdgeInsets.only(left: 30, top: 100, right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorCollections.TextColor,
                      ),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 28,
                            color: ColorCollections.WhiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                signinProgressIndicator.SignInProgressIndicator
                    ? Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: (MediaQuery.of(context).size.height) / 2),
                          decoration: BoxDecoration(
                              color: ColorCollections.SecondaryColor,
                              borderRadius: BorderRadius.circular(7)),
                          height: 60,
                          width: 60,
                          // margin: const EdgeInsets.symmetric(vertical: 400),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
      ),
    );
  }
}
