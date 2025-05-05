
import 'package:examcollectorsadminapp/Pages/SignInPage/Bloc/SignInBloc.dart';
import 'package:examcollectorsadminapp/pages/SignInPage/Page/signInProgressIndicatorValue.dart';
import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/utils/constants.dart';
import 'package:examcollectorsadminapp/utils/fluttertoast.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.GreyColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  FullPageContainer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        FromTop: 50,
                        FromLeft: 30,
                        TextString: 'EXAM COLLECTORS',
                        FontSize: 37,
                        TextFontWeight: FontWeight.bold,
                        TextColor: ColorCollections.SecondaryColor,
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
                        FromTop: 30,
                        FromLeft: 30,
                        TextColor: ColorCollections.SecondaryColor,
                        TextFontWeight: FontWeight.normal,
                      ),
                      reusableTextField(
                        context: context,
                        FromLeft: 40,
                        WidthOfContainer: 250,
                        widthOfTextField: 150,
                        icon_name: 'person(1)',
                        hintText: 'Enter your Email',
                        textType: 'Email',
                      ),
                      ReusableText(
                        TextString: 'Password',
                        FontSize: 15,
                        FromTop: 40,
                        FromLeft: 30,
                        TextColor: ColorCollections.SecondaryColor,
                        TextFontWeight: FontWeight.normal,
                      ),
                      reusableTextField(
                        context: context,
                        FromLeft: 40,
                        WidthOfContainer: 250,
                        widthOfTextField: 150,
                        icon_name: 'lock',
                        hintText: 'Enter your password',
                        textType: 'Password',
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 40,
                    left: 100,
                    child: GestureDetector(
                      onTap: () {
                        final state = context.read<SignInBloc>().state;
                        String emailAddress = state.email;
                        String password = state.password;

                        if (emailAddress.isEmpty) {
                          //warning
                          toastInfo(
                              msg: "You need to insert your email address!");
                          return;
                        }
                        if (password.isEmpty) {
                          //warning
                          toastInfo(msg: "You need to insert your password!");
                          return;
                        }
                        try {
                          if (emailAddress == AppConstants.adminemail &&
                              password == AppConstants.adminpassword) {
                            Navigator.of(context).pushNamed('/home_page');
                          } else {
                            toastInfo(
                                msg:
                                    'please provide a correct email and password!');
                          }
                        } catch (e) {
                          toastInfo(
                              msg: 'please check your internet connection!');
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        margin: const EdgeInsets.only(left: 20, bottom: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/Images/ButtonColor.jpg'),
                          ),
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
                ],
              ),
              signinProgressIndicator.SignInProgressIndicator
                  ? Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorCollections.SecondaryColor,
                            borderRadius: BorderRadius.circular(7)),
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.symmetric(vertical: 400),
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
        ],
      ),
    );
  }
}
