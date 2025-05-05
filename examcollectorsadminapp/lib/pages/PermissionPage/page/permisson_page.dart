
import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class permission_page extends StatelessWidget {
  const permission_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorCollections.WhiteColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Center(
              child: ReusableText(
                TextString: 'Permission',
                FontSize: 30,
                TextColor: ColorCollections.SecondaryColor,
              ),
            ),
          ),
          ReusableText(
            FromTop: 20,
            FromLeft: 30,
            TextColor: ColorCollections.SecondaryColor,
            TextString: 'User Request',
            FontSize: 30,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/see_request_page');
                //navigte to other page
              },
              child: Container(
                height: 60,
                width: 300,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorCollections.SecondaryColor),
                  color: ColorCollections.WhiteColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Center(
                  child: ReusableText(
                    TextString: 'yared dereje',
                    FontSize: 24,
                    TextColor: ColorCollections.SecondaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
