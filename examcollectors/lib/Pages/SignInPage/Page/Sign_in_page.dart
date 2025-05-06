import 'package:examcollectors/Pages/HomePage/widgets/schedule/PomodoroPage.dart';
import 'package:examcollectors/Pages/SignInPage/Bloc/signInBlocEvent.dart';
import 'package:examcollectors/Pages/SignInPage/Page/signInController.dart';
import 'package:examcollectors/Pages/SignInPage/Page/signInProgressIndicatorValue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';
import '../Bloc/SignInBloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: ColorCollections.PageColor,
      body: Stack(
        children: [
          // const FullPageContainer(),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      child: Text(
                          "Welcome back! Sign in with your email and password to continue.",
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    Center(
                      child: ReusableText(
                        TextString: 'EXAM COLLECTORS',
                        FontSize: 30,
                        FromTop: 50,
                        FromBottom: 10,
                        FromLeft: 0,
                        TextColor: ColorCollections.SecondaryColor,
                        TextFontWeight: FontWeight.bold,
                      ),
                    ),
                    ReusableText(
                      FromTop: 30,
                      FromLeft: 150,
                      TextString: 'Log In',
                      FontSize: 40,
                      TextColor: ColorCollections.SecondaryColor,
                    ),
                    ReusableText(
                      TextString: 'Email',
                      FontSize: 15,
                      FromTop: 10,
                      FromLeft: 30,
                      TextColor: ColorCollections.SecondaryColor,
                      TextFontWeight: FontWeight.normal,
                    ),
                    reusableTextField(
                        FromLeft: 25,
                        FromRight: 15,
                        WidthOfContainer: MediaQuery.of(context).size.width,
                        widthOfTextField:
                            MediaQuery.of(context).size.width - 200,
                        icon_name: 'person(1)',
                        hintText: 'Enter your Email',
                        textType: 'Email',
                        onchange: (value) =>
                            context.read<SignInBloc>().add(EmailEvent(value))),
                    ReusableText(
                      TextString: 'Password',
                      FontSize: 15,
                      FromTop: 15,
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
                        context.read<SignInBloc>().add(PasswordEvent(value));
                      },
                    ),
                    Row(
                      children: [
                        ReusableText(
                          TextString: 'Don\'t have an account ?',
                          FontSize: 15,
                          FromTop: 15,
                          FromLeft: 70,
                          TextColor: ColorCollections.TextColor,
                          TextFontWeight: FontWeight.bold,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/sign_up_page');
                          },
                          child: ReusableText(
                            TextString: 'Sign Up',
                            FontSize: 15,
                            FromTop: 15,
                            TextColor: Colors.blue.shade900,
                            TextFontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 150,
            right: 20,
            left: 20,
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  signinProgressIndicator.SignInProgressIndicator = true;
                });

                await SigninController(context: context).handleLogin('email');
                //
                setState(() {
                  signinProgressIndicator.SignInProgressIndicator = false;
                });
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PomodoroTimerPage()));
              },
              child: Container(
                height: 50,
                // width: 150,
                margin: const EdgeInsets.only(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorCollections.TextColor,
                ),
                child: Center(
                  child: Text(
                    'Log In',
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
                    // margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height )/2),
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
    );
  }
}
