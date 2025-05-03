import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';

class result_page extends StatelessWidget {
  const result_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCollections.PageColor,
        body: Column(
          children: [
            ReusableText(
              FromTop: 10,
              TextString: 'Exam Results',
              FontSize: 25,
              FromBottom: 0,
              TextColor: ColorCollections.SecondaryColor.withOpacity(0.8),
              TextFontWeight: FontWeight.w700,
            ),
            ReusableText(
              FromTop: 0,
              TextString: 'Final Exam',
              FontSize: 18,
              FromBottom: 20,
              TextColor: ColorCollections.SecondaryColor.withOpacity(0.6),
              TextFontWeight: FontWeight.w700,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                child: CircularPercentIndicator(
                  radius: 90.0,
                  lineWidth: 10.0,
                  percent: 1.0,
                  center: ReusableText(
                    TextString: '100%',
                    FontSize: 40,
                    TextColor: ColorCollections.SecondaryColor,
                    TextFontWeight: FontWeight.w700,
                  ),
                  progressColor: ColorCollections.TextColor.withOpacity(0.5),
                ),
              ),
            ),
            ReusableText(
              FromTop: 20,
              TextString: 'Keep Practicing!',
              FontSize: 23,
              FromBottom: 0,
              TextColor: ColorCollections.SecondaryColor,
              TextFontWeight: FontWeight.w700,
            ),
            ReusableText(
              FromTop: 10,
              TextString: 'You scored 2 out of 5 questions correctly',
              FontSize: 18,
              FromBottom: 40,
              TextColor: ColorCollections.SecondaryColor.withOpacity(0.8),
              TextFontWeight: FontWeight.w700,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    width: 150,
                    margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                    // padding: EdgeInsets.only(left: 15, bottom: 10),
                    decoration: BoxDecoration(
                      color: ColorCollections.TextColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Icon(
                          Icons.timer_outlined,
                          color: ColorCollections.WhiteColor,
                        ),
                        ReusableText(
                          FromTop: 3,
                          TextString: 'Time Spent',
                          FontSize: 16,
                          // FromBottom: 10,
                          TextColor: ColorCollections.WhiteColor,
                          TextFontWeight: FontWeight.w700,
                        ),
                        ReusableText(
                          FromTop: 0,
                          TextString: '0 min 5 sec',
                          FontSize: 16,
                          FromBottom: 0,
                          TextColor: ColorCollections.TextColor,
                          TextFontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                    // padding: EdgeInsets.only(left: 15, bottom: 10),
                    decoration: BoxDecoration(
                      color: ColorCollections.TextColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Icon(
                          Icons.workspace_premium,
                          color: ColorCollections.WhiteColor,
                        ),
                        ReusableText(
                          FromTop: 3,
                          TextString: 'Accuracy',
                          FontSize: 16,
                          // FromBottom: 10,
                          TextColor: ColorCollections.WhiteColor,
                          TextFontWeight: FontWeight.w700,
                        ),
                        ReusableText(
                          FromTop: 0,
                          TextString: '40 %',
                          FontSize: 16,
                          FromBottom: 0,
                          TextColor: ColorCollections.TextColor,
                          TextFontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/home_page',(predicted)=>true);
              },
              child: Center(
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: ColorCollections.TextColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: ColorCollections.WhiteColor,
                      ),
                      ReusableText(
                        FromTop: 0,
                        TextString: 'Return to Home',
                        FontSize: 16,
                        FromBottom: 0,
                        TextColor: ColorCollections.WhiteColor,
                        TextFontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
