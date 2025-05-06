import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/AppColorCollections.dart';
import '../../../../widgets/AllCommonWidget.dart';
import '../Widget/welcomePage1Widget.dart';

class WelcomePage1 extends StatelessWidget {
  const WelcomePage1({super.key});

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
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: ReusableText(
                          TextString: 'WELCOME TO',
                          FontSize: 48,
                          FromTop: 20,
                          FromLeft: 0,
                          FromBottom: 0,
                          TextFontWeight: FontWeight.bold,
                          TextColor: ColorCollections.TextColor,
                        ),
                      ),
                      ReusableText(
                        TextString: 'EXAM',
                        FontSize: 48,
                        FromTop: 0,
                        FromBottom: 0,
                        FromLeft: 0,
                        TextColor: ColorCollections.SecondaryColor,
                      ),
                      ReusableText(
                        TextString: 'COLLECTORS',
                        FontSize: 48,
                        FromTop: 0,
                        FromLeft: 0,
                        FromBottom: 50,
                        TextColor: ColorCollections.SecondaryColor,
                      ),
                      ReusableText(
                        TextString: 'This is Exam Collectors App',
                        FontSize: 18,
                        FromTop: 0,
                        FromBottom: 0,
                        TextFontWeight: FontWeight.w500,
                        TextColor: ColorCollections.TextColor,
                      ),
                      ReusableText(
                        TextString: '& We Have So Many National Exams',
                        FontSize: 18,
                        TextFontWeight: FontWeight.w500,
                        FromTop: 0,
                        FromBottom: 0,
                        TextColor: ColorCollections.TextColor,
                      ),
                      ReusableText(
                        TextString: 'You Can Get Start Now.',
                        FontSize: 18,
                        TextFontWeight: FontWeight.w500,
                        FromTop: 0,
                        FromBottom: 50,
                        TextColor: ColorCollections.TextColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/welcome_page2');
              },
              child: Container(
                height: 50,
                // width: 150,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorCollections.TextColor,
                ),
                child: Center(
                  child: Text(
                    "Lets Get Started",
                    style: TextStyle(
                      fontSize: 25,
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
