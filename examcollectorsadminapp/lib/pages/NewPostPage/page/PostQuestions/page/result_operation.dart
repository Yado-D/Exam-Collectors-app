
import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class operation_result extends StatelessWidget {
  const operation_result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      body: Container(
        margin: const EdgeInsets.only(left: 30),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 70, top: 100),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/success.png'),
                      ),
                    ),
                  ),
                  ReusableText(
                    TextString: 'Successfull',
                    FontSize: 30,
                    TextColor: ColorCollections.SecondaryColor,
                  ),
                ],
              ),
            ),
            ReusableText(
              FromTop: 50,
              TextString: 'The Question is Perfectly added To the database.',
              FontSize: 30,
              TextColor: ColorCollections.SecondaryColor,
            ),
            ReusableText(
              FromTop: 50,
              TextString: 'Do you want to add another one or go to home ?',
              FontSize: 20,
              TextColor: ColorCollections.SecondaryColor,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/select_post_info');
                    // commonSnackBar(context, 'Successfully done the operation');
                  },
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(right: 30),
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            offset: const Offset(5, 5),
                            color: ColorCollections.TeritiaryColor,
                            blurStyle: BlurStyle.inner,
                          ),
                        ],
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: ReusableText(
                          TextString: 'ADD',
                          FontSize: 20,
                          TextColor: ColorCollections.WhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/home_page');
                    // commonSnackBar(context, 'Successfully done the operation');
                  },
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(right: 30),
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            offset: const Offset(5, 5),
                            color: ColorCollections.TeritiaryColor,
                            blurStyle: BlurStyle.inner,
                          ),
                        ],
                        color: ColorCollections.TextColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: ReusableText(
                          TextString: 'HOME',
                          FontSize: 20,
                          TextColor: ColorCollections.WhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
