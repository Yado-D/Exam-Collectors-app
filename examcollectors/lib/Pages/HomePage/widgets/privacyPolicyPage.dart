
import 'package:flutter/material.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: SimpleAppBars(context, 'Privacy & Policy'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            ListView(
              children: [
                ReusableText(
                  TextString: 'Privacy Policy',
                  FontSize: 24,
                  TextFontWeight: FontWeight.bold,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 16),
                ReusableText(
                  TextString:
                  'Welcome to Exam Collectors, developed by Yared Dereje. Your privacy is important, and this Privacy Policy explains how your data is collected, used, and protected when you use the application.',
                  FontSize: 16,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 16),
                ReusableText(
                  TextString: '1. Information We Collect',
                  FontSize: 20,
                  TextFontWeight: FontWeight.bold,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 8),
                ReusableText(
                  TextString:
                  '- Personal Information: Information you provide, such as your name, email address, or phone number (if required for app features).\n'
                      '- Usage Data: Non-personal information such as device type, operating system, and app interactions, collected automatically to improve the app\'s functionality.\n'
                      '- Third-Party Data: If you access external services or features integrated into the app, those services may collect and process data per their privacy policies.',
                  FontSize: 16,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 16),
                ReusableText(
                  TextString: '2. How We Use Your Information',
                  FontSize: 20,
                  TextFontWeight: FontWeight.bold,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 8),
                ReusableText(
                  TextString:
                  '- Enhance your experience within the app.\n'
                      '- Provide support and respond to inquiries.\n'
                      '- Monitor app performance and ensure proper functionality.\n'
                      '- Develop new features and improve existing ones.\n'
                      '\nNote: Your data will not be sold or shared with third parties for marketing purposes.',
                  FontSize: 16,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 16),
                ReusableText(
                  TextString: '3. Data Security',
                  FontSize: 20,
                  TextFontWeight: FontWeight.bold,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 8),
                ReusableText(
                  TextString:
                  'We implement reasonable technical and organizational measures to safeguard your data. However, no system is entirely secure, and we cannot guarantee absolute protection.',
                  FontSize: 16,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 16),
                ReusableText(
                  TextString: '4. Third-Party Services',
                  FontSize: 20,
                  TextFontWeight: FontWeight.bold,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 8),
                ReusableText(
                  TextString:
                  'The app may contain links or integrations to third-party services. Each service is governed by its own privacy policy, and Exam Collectors is not responsible for their practices.',
                  FontSize: 16,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 16),
                ReusableText(
                  TextString: '5. Limitations of Liability',
                  FontSize: 20,
                  TextFontWeight: FontWeight.bold,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 8),
                ReusableText(
                  TextString:
                  'The developer, Yared Dereje, is not liable for any damages, losses, or issues resulting from the use of this app. By using Exam Collectors, you acknowledge that you do so at your own risk.',
                  FontSize: 16,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 16),
                ReusableText(
                  TextString: '6. Changes to This Privacy Policy',
                  FontSize: 20,
                  TextFontWeight: FontWeight.bold,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 8),
                ReusableText(
                  TextString:
                  'This Privacy Policy may be updated from time to time. Users are encouraged to review it periodically. Continued use of the app after changes constitutes acceptance of the revised policy.',
                  FontSize: 16,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 16),
                ReusableText(
                  TextString: '7. Contact Us',
                  FontSize: 20,
                  TextFontWeight: FontWeight.bold,
                  TextColor: Colors.black,
                ),
                SizedBox(height: 8),
                ReusableText(
                  TextString:
                  'For questions or concerns regarding this Privacy Policy, contact:\nYared Dereje\nEmail: Yareddereje780@gmail.com',
                  FontSize: 16,
                  TextColor: Colors.black,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: ()=>ShowAcceptDialogue(context),
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Accept',
                        FontSize: 18,
                        TextColor: ColorCollections.WhiteColor,
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
  void ShowAcceptDialogue(BuildContext context) {
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
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/Images/Developers/developer.jpeg')),
                      ),
                    ),
                    Center(
                        child: ReusableText(
                          FromLeft: 20,
                          FromTop: 20,
                          TextString: 'Thanks for your trust!',
                          FontSize: 25,
                          TextFontWeight: FontWeight.w500,
                          TextColor: Colors.black,
                        ),
                      ),

                  ],
            );
          },
        );
      },
    );
  }
}
