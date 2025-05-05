import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(
        context,
        false,
        "Admin Page",
      ),
      backgroundColor: ColorCollections.PageColor,
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            homeContainer(
              text: 'Permissions',
              ontap: () {
                Navigator.of(context).pushNamed('/permission_page');
              },
            ),
            homeContainer(
              text: 'New Post',
              ontap: () {
                Navigator.of(context).pushNamed('/post_page');
              },
            ),
            homeContainer(
              text: 'User Info',
              ontap: () {
                Navigator.of(context).pushNamed('/user_info_page');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget homeContainer({
    required String text,
    required void Function() ontap,
  }) {
    return Center(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          margin: const EdgeInsets.only(
            // left: 120,
            bottom: 15,
          ),
          height: 60,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: ColorCollections.SecondaryColor),
            color: ColorCollections.WhiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: ReusableText(
              TextColor: ColorCollections.SecondaryColor,
              TextString: text,
              FontSize: 24,
              TextFontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
