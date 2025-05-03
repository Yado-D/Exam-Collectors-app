
import 'package:flutter/material.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Container(
            margin: EdgeInsets.all(15),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 35,
              ),
            ),
          ),
          backgroundColor: ColorCollections.PrimaryColor,
        ),
        body: Stack(
          children: [
            const FullPageContainer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 10,
                  FromBottom: 0,
                  FromLeft: 25,
                  TextString: 'Please wait',
                  FontSize: 48,
                  TextColor: ColorCollections.SecondaryColor,
                  TextFontWeight: FontWeight.bold,
                ),
                Container(
                  child: ReusableText(
                    FromTop: 0,
                    FromLeft: 25,
                    TextString: 'Until We Verified',
                    FontSize: 48,
                    TextColor: ColorCollections.SecondaryColor,
                    TextFontWeight: FontWeight.w500,
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: 70,
                    width: 70,
                    child: const CircularProgressIndicator(),
                  ),
                ),
                Center(
                  child: ReusableText(
                    FromTop: 40,
                    TextString: 'Good things comes for those who wait. ',
                    FontSize: 20,
                    TextColor: ColorCollections.SecondaryColor,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ReusableText(
                    FromLeft: 30,
                    TextColor: ColorCollections.WhiteColor,
                    TextString:
                        'If you want to speed up the process\n   call to this number : ',
                    FontSize: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ReusableText(
                      TextColor: Colors.blue,
                      TextString: '+251993157092',
                      FontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed('/home_page');
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      margin: const EdgeInsets.only(bottom: 40, left: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/Images/ButtonColor.jpg'),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Go to Home',
                          style: TextStyle(
                            fontSize: 28,
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
        ),
      ),
    );
  }
}
