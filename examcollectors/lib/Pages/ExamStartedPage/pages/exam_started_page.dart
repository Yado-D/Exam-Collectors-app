import 'package:examcollectors/Pages/ExamStartedPage/widgets/examStartedWidget.dart';
import 'package:flutter/material.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';

class exam_started_page extends StatelessWidget {
  const exam_started_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.TextColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableText(
              TextString: 'Physics',
              FontSize: 20,
              TextColor: ColorCollections.WhiteColor,
              TextFontWeight: FontWeight.w700,
            ),
            Row(
              children: [
                ReusableText(
                  TextString: '1:48',
                  FontSize: 18,
                  FromRight: 15,
                  TextColor: ColorCollections.WhiteColor,
                  TextFontWeight: FontWeight.w500,
                ),
                InkWell(
                  onTap: () => ExamBetweenShowDialogue(context: context),
                  child: ReusableText(
                    TextString: 'Stop',
                    FontSize: 18,
                    TextColor: ColorCollections.RedColor,
                    TextFontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(),
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorCollections.WhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return SingleQuestionReusableContainer(
                        title: "What is Capital city of Ethiopia?",
                        options: ["Gana", "Addis Abeba", "Gonder", "Mekele"],
                        explanation: "Capital city of Ethiopia is Addis Abeba",
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget QuizReusableChoiceContainer(
      {required BuildContext context,
      required String choiceContent,
      required Color? bgColor,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
        padding: EdgeInsets.only(left: 15, bottom: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        // height: 60,
        width: double.infinity,
        child: ReusableText(
          FromTop: 15,
          TextColor: bgColor != null
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary,
          TextString: choiceContent,
          FontSize: 18,
          // TextFontWeight: FontWeight.w900,
          TextFontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget SingleQuestionReusableContainer(
      {required String title,
      required List<String> options,
      required String explanation}) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
            FromLeft: 30,
            TextColor: ColorCollections.TextColor,
            TextString: title,
            FontSize: 18,
            TextFontWeight: FontWeight.w500,
            // TextFontWeight: FontWeight.bold,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: options.length,
            itemBuilder: (context, index) {
              return QuizReusableChoiceContainer(
                context: context,
                choiceContent: options[index],
                bgColor: ColorCollections.TextColor,
                onTap: () {},
              );
            },
          ),
          ExpansionTile(
            title: ReusableText(
              TextColor: ColorCollections.TextColor,
              TextString: "Explanation",
              FontSize: 18,
            ),
            children: [
              ReusableText(
                FromLeft: 10,
                FromRight: 10,
                TextColor: ColorCollections.TextColor,
                TextString: explanation,
                FontSize: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
