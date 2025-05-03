import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/AppColorCollections.dart';
import '../../../../widgets/AllCommonWidget.dart';
import '../widget/WelcomePage4Widget.dart';

class Welcomepage4 extends StatelessWidget {
  const Welcomepage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: ColorCollections.PageColor,
      body: Stack(
        children: [
          // const FullPageContainer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableText(
                FromTop: 30,
                FromLeft: 30,
                TextString: 'Just one more step to go. you did it!',
                FontSize: 20,
                FromBottom: 0,
                TextFontWeight: FontWeight.w600,
                TextColor: ColorCollections.SecondaryColor,
              ),
              ReusableText(
                FromTop: 30,
                FromLeft: 30,
                TextString: 'Please Choose',
                FontSize: 30,
                FromBottom: 0,
                TextFontWeight: FontWeight.bold,
                TextColor: ColorCollections.SecondaryColor,
              ),
              ReusableText(
                FromLeft: 30,
                FromTop: 0,
                TextString: 'Your University ?',
                FontSize: 30,
                TextColor: ColorCollections.SecondaryColor,
              ),
              DropDownButton(
                  context: context, right: 0, left: 0, fromTop: 80),
            ],
          ),

          Positioned(
            bottom: 20,
            right: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/sign_in_page');
              },
              child: Container(
                height: 50,
                // width: 150,
                margin: EdgeInsets.only(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/Images/ButtonColor.jpg'),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Next',
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
    );
  }
}
