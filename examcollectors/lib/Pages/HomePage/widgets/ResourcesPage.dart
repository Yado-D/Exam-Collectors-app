
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../auth/examFetching.dart';
import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';

void _launchSocialMedia(String url) async {
  final Uri _url = Uri.parse(url);
  if (await canLaunchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Could not launch $_url';
  }
}


Widget resourcePage() {
  return SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    sliver: FutureBuilder(
      future: fetchingExams().fetchResources(),
      builder: (context,snap){
        if(snap.hasError){
          return SliverToBoxAdapter(
            child: ReusableText(
                TextString: 'Something happened.please check your network connection.',
                FontSize: 18,
            ),
          );
        }
        if(snap.connectionState == ConnectionState.waiting){
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final snapData = snap.data;
        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 12 / 15,
          ),
          delegate: SliverChildBuilderDelegate(
                 childCount: snapData!.length ?? 0,
                (BuildContext context, int index) {
              final url = snapData[index]["link"] ?? ""; // Corrected URL
              return InkWell(
                onTap: () async{
                  _launchSocialMedia(url);
                },
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      width: 200,
                      margin: const EdgeInsets.only(right: 10, bottom: 5, top: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(snapData[index]["image"]??""),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 4),
                      color: ColorCollections.GreyColor,
                      child: ReusableText(
                        TextString: snapData[index]["text"] ?? "",
                        FontSize: 16,
                        TextColor: Colors.black,
                        TextFontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    ),
  );
}

List<String> resourceCources = [
  'psychology.png',
  'critical_thinking.jpeg',
  'python.png',
  'programming.jpeg',
  'flutter.jpeg',
  'dart.jpeg',
  'java.jpeg',
];

List<String> resourceTxt = [
  'Psychology',
  'Critical Thinking',
  'Python',
  'Programming',
  'Flutter',
  'Dart',
  'Java',
];

List<String> resourceLink = [
  "https://t.me/exam_collectors/2",
  "https://t.me/exam_collectors/3",
  "https://t.me/exam_collectors/4",
  "https://t.me/exam_collectors/4",
  "https://t.me/exam_collectors/4",
  "https://t.me/exam_collectors/4",
  "https://t.me/exam_collectors/4",
];
