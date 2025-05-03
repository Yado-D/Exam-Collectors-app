import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/GetUserDetails.dart';
import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';
import '../../../widgets/CommonSnackBar.dart';
import '../../SignInPage/Bloc/SignInBloc.dart';

Widget CheckBoxAndText({required String text}) {
  return Row(
    children: [
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: ColorCollections.SecondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Icon(
            Icons.check,
            size: 15,
            color: Colors.white,
          ),
        ),
      ),
      ReusableText(
        FromLeft: 10,
        TextString: text,
        FontSize: 18,
        TextColor: ColorCollections.SecondaryColor,
        TextFontWeight: FontWeight.bold,
      )
    ],
  );
}

Widget pageViews({
  required String SubscriptionType,
  required double Price,
  required String time,
  required String feature1,
  required String feature2,
  required String feature3,
  required BuildContext context,
}) {
  return Column(
    children: [
      Container(
        height: 400,
        width: 200,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: ColorCollections.TeritiaryColor,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
          color: ColorCollections.WhiteColor.withOpacity(1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              FromTop: 15,
              FromLeft: 25,
              FromBottom: 0,
              TextString: SubscriptionType,
              FontSize: 38,
              TextColor: ColorCollections.SecondaryColor,
              TextFontWeight: FontWeight.bold,
            ),
            if (SubscriptionType == 'Premium')
              Row(
                children: [
                  ReusableText(
                    FromTop: 0,
                    FromLeft: 25,
                    FromBottom: 0,
                    TextString: 'Monthly',
                    FontSize: 18,
                    TextColor: ColorCollections.SecondaryColor,
                    TextFontWeight: FontWeight.w400,
                  ),
                  const Icon(
                    Icons.toggle_on_outlined,
                    size: 40,
                    color: ColorCollections.SecondaryColor,
                  ),
                  ReusableText(
                    FromTop: 0,
                    FromLeft: 3,
                    FromBottom: 0,
                    TextString: 'Yearly',
                    FontSize: 18,
                    TextColor: ColorCollections.SecondaryColor,
                    TextFontWeight: FontWeight.w600,
                  ),
                ],
              ),
            Row(
              children: [
                ReusableText(
                  FromTop: 10,
                  FromLeft: 30,
                  FromBottom: 0,
                  TextString: '\$$Price',
                  FontSize: 18,
                  TextColor: Colors.green.shade600,
                  TextFontWeight: FontWeight.w600,
                ),
                ReusableText(
                  FromTop: 10,
                  FromLeft: 2,
                  FromBottom: 0,
                  TextString: 'ETB/$time',
                  FontSize: 18,
                  TextColor: ColorCollections.SecondaryColor,
                  TextFontWeight: FontWeight.w600,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 15),
              child: CheckBoxAndText(text: feature1),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 0),
              child: CheckBoxAndText(text: feature2),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 0),
              child: CheckBoxAndText(text: feature3),
            ),
            GestureDetector(
              onTap: () async {
                //you can move any page when user choose the  his/her plan
                if (SubscriptionType == 'Free') {
                  //first we must got  the email
                  final userSignInDetails = context.read<SignInBloc>().state;
                  String userEmail = userSignInDetails.email;
                  //first got the user data and
                  Future.delayed(const Duration(seconds: 5));
                  Map<String, dynamic> alpha =
                      await Getuserdetails(email: userEmail).userMap();
                  if (alpha == Null) {
                    print(alpha);
                    Navigator.of(context)
                        .pushNamed('/home_page', arguments: alpha);
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
                  // String userName = alpha['userName'];
                } else if (SubscriptionType == 'Premium') {
                  //first got the user data and
                  Navigator.of(context).pushNamed('/payment_page');

                  //move to premium page
                } else if (SubscriptionType == 'Monthly') {
                  //move to premium page
                  Navigator.of(context).pushNamed('/payment_page');
                } else {
                  commonSnackBar(
                      context,
                      'UnExpected error',
                      ColorCollections.WhiteColor,
                      ColorCollections.TextColor.withOpacity(0.7));
                }
              },
              child: Container(
                height: 30,
                width: 150,
                margin: const EdgeInsets.only(left: 20, bottom: 20, top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/Images/ButtonColor.jpg'),
                  ),
                ),
                child: Center(
                  child: Text(
                    ' Subscribe',
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorCollections.WhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
