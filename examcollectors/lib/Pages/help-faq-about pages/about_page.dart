
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/AppColorCollections.dart';
import '../../widgets/AllCommonWidget.dart';
import '../HomePage/widgets/privacyPolicyPage.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
        backgroundColor: ColorCollections.PageColor,
        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.only(left: 15),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: ColorCollections.PageColor,
          title:  ReusableText(
             FromLeft: 20,
              TextString: 'About Us',
              FontSize: 20,
              TextFontWeight: FontWeight.bold,
              TextColor: ColorCollections.SecondaryColor,

          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Center(
                 child: ReusableText(
                   FromTop: 20,
                   FromBottom: 10,
                   TextString: 'Developers',
                   FontSize: 24,
                   TextFontWeight: FontWeight.w700,
                   TextColor: ColorCollections.TextColor,
                 ),
               ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //yared
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 120,
                        width: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(10),
                          color: ColorCollections.GreyColor,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/Images/Developers/yared.JPG'))
                        ),
                      ),
                      ReusableText(
                        TextString: 'Yared Dereje',
                        FontSize: 17,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Colors.black,
                      ),
                      ReusableText(
                        FromTop: 0,
                        TextString: 'Flutter App Developer',
                        FontSize: 15,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Colors.black54,
                      ),
                      InkWell(
                        onTap: ()=>_launchSocialMedia("https://yado-d.github.io/My-Portfolio/"),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorCollections.WhiteColor,
                            ),
                          child:  Center(
                            child: ReusableText(
                              TextString: 'Portfolio',
                              FontSize: 16,
                              TextFontWeight: FontWeight.w700,
                              TextColor: ColorCollections.TextColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  Container(
                    height: 150,
                    width: 1,
                    color: Colors.blue,
                  ),
                  //abel
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 120,
                        width: 110,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(10),
                          color: ColorCollections.GreyColor,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                                image: AssetImage('assets/Images/Developers/abel.jpg'))
                        ),
                      ),
                      ReusableText(
                        TextString: 'Abel Delelegn',
                        FontSize: 17,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Colors.black,
                      ),
                      ReusableText(
                        FromTop: 0,
                        TextString: 'UI/UX Developer',
                        FontSize: 15,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Colors.black54,
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorCollections.WhiteColor,
                        ),
                        child:  Center(
                          child: ReusableText(
                            TextString: 'Portfolio',
                            FontSize: 16,
                            TextFontWeight: FontWeight.w700,
                            TextColor: ColorCollections.TextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              //missions

              Center(
                child: ReusableText(
                  FromTop: 20,
                  // FromBottom: 10,
                  TextString: 'Missions',
                  FontSize: 20,
                  TextFontWeight: FontWeight.w700,
                  TextColor: ColorCollections.TextColor,
                ),
              ),

               Container(
                 margin: EdgeInsets.only(left:25,right: 25),
                 padding: EdgeInsets.only(left:10,right: 10),
                 height: 220,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: ColorCollections.WhiteColor,
                 ),
                 child: ReusableText(
                   FromTop: 16,
                   FromBottom: 10,
                   TextString: 'Our mission is to empower university students by providing access to invaluable knowledge and tools to achieve unparalleled success. We are committed to continuously refining our app to meet their evolving needs, embracing feedback, and offering guidance to ensure meaningful growth and transformation.',
                   FontSize: 14,
                   TextFontWeight: FontWeight.w700,
                   TextColor: Colors.black54,
                 ),
               ),
              ///others
              Center(
                child: ReusableText(
                  FromTop: 20,
                  // FromBottom: 10,
                  TextString: 'Others',
                  FontSize: 20,
                  TextFontWeight: FontWeight.w700,
                  TextColor: Colors.black,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width-50,
                margin: EdgeInsets.only(bottom: 50),
                padding: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorCollections.WhiteColor,
                ),
                child: Column(
                  children: [
                    OtherContainer('Donate',(){
                      ShowDonateDialogue(context);
                    }),
                    OtherContainer('JOIN OUR TELEGRAM',()=>_launchSocialMedia("https://t.me/exam_collectors")),
                    OtherContainer('PRIVACY POLICY',(){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PrivacyPolicy(),));
                    }),
                    OtherContainer('Give us five star',(){})

                  ],
                ),
              ),
            ],
          ),
      ),
    );
    
  }
  void ShowDonateDialogue(BuildContext context) {
    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: ColorCollections.PrimaryColor,
                  // style: BorderStyle.values(),
                ),
              ),
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                            image: AssetImage('assets/Images/Developers/developer.jpeg')),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Center(
                        child: ReusableText(
                          FromLeft: 20,
                          FromTop: 20,
                          TextString: 'Donate for Developer',
                          FontSize: 25,
                          TextFontWeight: FontWeight.w500,
                          TextColor: ColorCollections.WhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ReusableText(
                    FromLeft: 15,
                    FromRight: 15,
                    TextString: 'Help Developers by sending Mobile airtime:).so,we will keep up the good work like this.',
                    FontSize: 16,
                    TextFontWeight: FontWeight.w500,
                    TextColor: Colors.black54,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 200,
                  height: 50,
                  child: InkWell(
                    onTap: () {
                      print("clicked");
                      Navigator.pop(context); // Close the current dialog
                      Future.delayed(Duration(milliseconds: 100), () {
                        // Show the new dialog after a short delay
                        ShowDonateAirtimeDialogue(context);
                      });
                    },
                    child: FittedBox(
                      child: Container(
                        height: 55,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,),
                        child: Center(
                          child: ReusableText(
                            TextString: 'Send',
                            FontSize: 20,
                            TextColor: ColorCollections.WhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  //for choosing airtime

  void ShowDonateAirtimeDialogue(BuildContext context) {
    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: ColorCollections.PrimaryColor,
                  // style: BorderStyle.values(),
                ),
              ),
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/Images/Developers/developer.jpeg')),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Center(
                        child: ReusableText(
                          FromLeft: 20,
                          FromTop: 20,
                          TextString: 'Donate for Developer',
                          FontSize: 25,
                          TextFontWeight: FontWeight.w500,
                          TextColor: ColorCollections.WhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ReusableText(
                    FromLeft: 15,
                    FromRight: 15,
                    TextString: 'Thank you for your support!',
                    FontSize: 18,
                    TextFontWeight: FontWeight.w500,
                    TextColor: Colors.black54,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 200,
                  height: 50,
                  child: InkWell(
                    onTap: ()=> _launchUSSD('50'),
                    child: FittedBox(
                      child: Container(
                        height: 55,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,),
                        child: Center(
                          child: ReusableText(
                            TextString: 'ካርድ ባለ 50 ብር',
                            FontSize: 17,
                            TextColor: ColorCollections.WhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                ////

                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 200,
                  height: 50,
                  child: InkWell(
                    onTap: ()=> _launchUSSD('100'),
                    child: FittedBox(
                      child: Container(
                        height: 55,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,),
                        child: Center(
                          child: ReusableText(
                            TextString: 'ካርድ ባለ 100 ብር',
                            FontSize: 17,
                            TextColor: ColorCollections.WhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                 ///
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 200,
                  height: 50,
                  child: InkWell(
                    onTap: ()=> _launchUSSD('200'),
                    child: FittedBox(
                      child: Container(
                        height: 55,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,),
                        child: Center(
                          child: ReusableText(
                            TextString: 'ካርድ ባለ 200 ብር',
                            FontSize: 17,
                            TextColor: ColorCollections.WhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
  
  Widget OtherContainer(String txt,VoidCallback ontap){
    return  InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(top: 15),
        width: 200,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorCollections.TextColor,
        ),
        child: Center(
          child: ReusableText(
            // FromTop: 20,
            // FromBottom: 10,
            TextString: txt,
            FontSize: 15,
            TextFontWeight: FontWeight.w700,
            TextColor: ColorCollections.WhiteColor,
          ),
        ),
      ),
    );
  }
}
void _launchUSSD(String card) async {
  // Use Uri.encodeComponent to ensure special characters are encoded properly
   String ussdCode = "*806*0993157092*${card}#";
  final Uri uri = Uri(scheme: 'tel',path: ussdCode);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch $uri');
  }

}

void _launchSocialMedia(String url) async {
  final Uri _url = Uri.parse(url);
  if (await canLaunchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Could not launch $_url';
  }
}