import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:examcollectors/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';

ExamBetweenShowDialogue({
  required BuildContext context,
  // required String TitleText,
  // required VoidCallback cancelOnTap,
  // required VoidCallback confirmOnTap,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 10, top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorCollections.PageColor,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.play_arrow),
                        ReusableText(
                          FromTop: 0,
                          TextString: "Resume",
                          FontSize: 18,
                          TextFontWeight: FontWeight.w600,
                          TextColor: ColorCollections.SecondaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorCollections.TextColor.withOpacity(0.5),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.restart_alt_outlined,color: ColorCollections.WhiteColor,),
                        ReusableText(
                          FromTop: 0,
                          TextString: "Restart",
                          FontSize: 18,
                          TextFontWeight: FontWeight.w600,
                          TextColor: ColorCollections.WhiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context,'/result_page');
              },
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorCollections.TextColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReusableText(
                      FromTop: 0,
                      TextString: "End the Exam",
                      FontSize: 18,
                      TextFontWeight: FontWeight.w600,
                      TextColor: ColorCollections.WhiteColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      });
}
