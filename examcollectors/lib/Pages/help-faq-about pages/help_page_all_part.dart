
import 'package:flutter/material.dart';

import '../../utils/AppColorCollections.dart';
import '../../widgets/AllCommonWidget.dart';
import 'faq.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.PageColor,
        title:  Text(
          'FAQs',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FaqItem(
                question: 'How do I create an account?',
                answer: 'To create an account, go to the "Sign Up" page...',
              ),
              FaqItem(
                question: 'Is my personal information secure?',
                answer: 'Yes, we take the security of your data seriously...',
              ),
              FaqItem(
                question: 'What payment methods are accepted?',
                answer: 'We currently accept Visa, MasterCard, and PayPal...',
              ),
              // Add more FAQ items as needed
            ],
          ),
        ),
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color:
                Color.fromARGB(255, 214, 90, 236), // Customize the text color
          ),
        ),
        tilePadding:
            const EdgeInsets.all(16.0), // Adjust tile padding as needed
        collapsedTextColor: Colors.blue, // Customize collapsed text color
        iconColor: Colors.blue, // Customize the icon color
        backgroundColor: Colors.grey[200],
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              answer,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.blue, // Customize the text color
              ),
            ),
          ),
        ], // Customize background color
      ),
    );
  }
}

class TutorialsSection extends StatelessWidget {
  const TutorialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.PageColor,
        title: const Text('Tutorials'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          FromTop: 15,
                          TextString: "How to Use Exam Collectors App?",
                          FontSize: 18,
                          TextFontWeight: FontWeight.w700,
                          TextColor: Colors.black87,
                        ),
                        SizedBox(height: 8),
                        ReusableText(
                          FromTop: 15,
                          TextString: "1. Open the app and navigate to the Home screen.",
                          FontSize: 16,
                          TextFontWeight: FontWeight.w400,
                          TextColor: Colors.black87,
                        ),


                        ReusableText(
                          FromTop: 5,
                          TextString: "2. Tap on the Exam icon at the Bottom.",
                          FontSize: 16,
                          TextFontWeight: FontWeight.w400,
                          TextColor: Colors.black87,
                        ),

                        ReusableText(
                          FromTop: 5,
                          TextString: "3. Insert the on-screen instructions to complete the process.",
                          FontSize: 16,
                          TextFontWeight: FontWeight.w400,
                          TextColor: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                )),
              ),
              // Your Tutorials content here

              const SizedBox(height: 16),

              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color:  Color.fromARGB(255, 255, 255, 255),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ReusableText(
                          FromTop: 15,
                          TextString: "Troubleshooting Guide",
                          FontSize: 18,
                          TextFontWeight: FontWeight.w700,
                          TextColor: Colors.black87,
                        ),

                        ReusableText(
                          FromTop: 5,
                          TextString: "If you encounter any issues with Feature X, follow these steps:",
                          FontSize: 16,
                          TextFontWeight: FontWeight.w400,
                          TextColor: Colors.black87,
                        ),
                        ReusableText(
                          FromTop: 5,
                          TextString: "1. Close and reopen the app.",
                          FontSize: 16,
                          TextFontWeight: FontWeight.w400,
                          TextColor: Colors.black87,
                        ),
                        ReusableText(
                          FromTop: 5,
                          TextString: "2. Check your internet connection.",
                          FontSize: 16,
                          TextFontWeight: FontWeight.w400,
                          TextColor: Colors.black87,
                        ),
                        ReusableText(
                          FromTop: 5,
                          TextString: "3. Contact support if the problem persists.",
                          FontSize: 16,
                          TextFontWeight: FontWeight.w400,
                          TextColor: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TroubleshootingSection extends StatelessWidget {
  const TroubleshootingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.PageColor,
        title: const Text('Troubleshooting Tips'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your troubleshooting tips content here
              Center(
                child: Card(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 300,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: const Column(
                          children: [
                            Text(
                              'Common Issues and Solutions:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '1. App Not Loading:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '   - Ensure you have a stable internet connection.',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '   - Close and reopen the app.',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '2. Error Messages:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '   - Note down the error message and contact support.',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '   - Check the app\'s FAQ section for possible solutions.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Card(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 300,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: const Column(
                          children: [
                            Text(
                              'Contact Support:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'If you are unable to resolve the issue, please contact our support team:',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Email: support@example.com',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Phone: +1 (123) 456-7890',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactSupportSection extends StatelessWidget {
  const ContactSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.PageColor,
        title: Center(child:  ReusableText(
          FromTop: 5,
          TextString: "Contact Support",
          FontSize: 20,
          TextFontWeight: FontWeight.w500,
          TextColor: Colors.black87,
        ),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ReusableText(
                            FromTop: 5,
                            TextString: "Contact Us",
                            FontSize: 18,
                            TextFontWeight: FontWeight.w700,
                            TextColor: Colors.black87,
                          ),
                        ),
                        ReusableText(
                          FromTop: 5,
                          TextString: "If you have any questions, concerns, or need assistance, feel free to reach out to our support team",
                          FontSize: 16,
                          TextFontWeight: FontWeight.w400,
                          TextColor: Colors.black87,
                        ),ReusableText(
                          FromTop: 5,
                          TextString: "Email: ExamCollectors@example.com",
                          FontSize: 16,
                          TextFontWeight: FontWeight.w400,
                          TextColor: Colors.black87,
                        ),ReusableText(
                          FromTop: 5,
                          TextString: "Phone: +251993157092",
                          FontSize: 16,
                          TextFontWeight: FontWeight.w400,
                          TextColor: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                )),
              ),
              const SizedBox(height: 16),
              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Column(
                      children: [
                        Text(
                          'Support Hours:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Monday - Friday: 9:00 AM to 6:00 PM',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Saturday: 10:00 AM to 4:00 PM',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Sunday: Closed',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserManualSection extends StatelessWidget {
  const UserManualSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.PageColor,
        title: const Center(child: Text('User Manual')),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your User Manual content here
              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Column(
                      children: [
                        Text(
                          'User Manual:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Welcome to our app! Here is a user manual to help you get started:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
              // Add more content as needed
            ],
          ),
        ),
      ),
    );
  }
}

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorCollections.PageColor,
        appBar: AppBar(
            backgroundColor: ColorCollections.PageColor,
            title:ReusableText(
              FromLeft: 15,
                TextString: 'Help',
                FontSize: 20,
                TextColor: Colors.black,
                TextFontWeight: FontWeight.bold,

            ),
            leading: Container(
              margin: EdgeInsets.only(left: 15),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
            )),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CommonContainer(title: "FAQs",ontap:(){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>FAQ_pages())
                );
              }),
              CommonContainer(title: "Tutorials",ontap:(){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>TutorialsSection())
                );
              }),
              const SizedBox(
                height: 5,
              ),
              CommonContainer(title: "Troubleshooting Section",ontap:(){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>TroubleshootingSection())
                );
              }),
              const SizedBox(
                height: 5,
              ),
              CommonContainer(title: "Contact Support",ontap:(){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ContactSupportSection())
                );
              }),
              const SizedBox(height: 5),
              CommonContainer(title: "User Manual",ontap:(){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>UserManualSection())
                );
              }),
            ],
          ),
        ),

    );
  }
  Widget CommonContainer({required VoidCallback ontap,required String title,}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          // border: Border.all(color: ColorCollections.TeritiaryColor),
          borderRadius: BorderRadius.circular(10),
          color: ColorCollections.TextColor.withOpacity(0.5),
        ),
        padding: EdgeInsets.only(left: 20,right: 20,top: 0),
        width: 300,
        height: 50,
        child: Center(
          child: ReusableText(
            FromTop: 0,
            TextString: title,
            FontSize: 18,
            TextFontWeight: FontWeight.w700,
            TextColor:  ColorCollections.WhiteColor,
          ),
        ),
      ),
    );
  }
}
