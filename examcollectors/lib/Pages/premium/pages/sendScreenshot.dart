
import 'package:flutter/material.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';

class SendScreenShot extends StatelessWidget {
  const SendScreenShot({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Container(
            margin: EdgeInsets.only(left: 15),
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
        backgroundColor: ColorCollections.PrimaryColor,
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
                  TextString: 'Please Upload',
                  FontSize: 48,
                  TextColor: ColorCollections.SecondaryColor,
                  TextFontWeight: FontWeight.bold,
                ),
                Container(
                  child: ReusableText(
                    FromTop: 0,
                    FromLeft: 25,
                    TextString: 'Your Receipt',
                    FontSize: 48,
                    TextColor: ColorCollections.SecondaryColor,
                    TextFontWeight: FontWeight.w500,
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/icons/add_image.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ReusableText(
                    TextString: 'Screenshoot or Photo',
                    FontSize: 20,
                    TextColor: ColorCollections.SecondaryColor,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/verify_page');
                },
                child: Container(
                  height: 40,
                  width: 150,
                  margin: const EdgeInsets.only(left: 120, bottom: 40),
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
      ),
    );
  }
}
// Positioned(
// bottom: 1,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// ReusableText(
// FromLeft: 30,
// TextColor: ColorCollections.WhiteColor,
// TextString:
// 'If you want to speed up the process\n   call to this number : ',
// FontSize: 20,
// ),
// ReusableText(
// TextColor: Colors.blue,
// TextString: '+251993157092',
// FontSize: 20,
// ),
// ],
// ),
// ),
