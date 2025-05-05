import 'package:examcollectors/services/examProvider.dart';
import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:examcollectors/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ExamBetweenShowDialogue({
  required BuildContext context,
  required List<String> arguments,
  // required VoidCallback cancelOnTap,
  // required VoidCallback confirmOnTap,
}) {
  final timerProvider = Provider.of<ExamTimerProvider>(context, listen: false);
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    timerProvider.resume;
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
                    timerProvider.resetTimer(); // Reset the timer
                    timerProvider.startTimer(timerProvider.initialDuration ~/
                        60); // Restart with original duration
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
                        Icon(
                          Icons.restart_alt_outlined,
                          color: ColorCollections.WhiteColor,
                        ),
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
                timerProvider.resume;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/result_page',
                  (predicate) => false,
                  arguments: arguments,
                );
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
