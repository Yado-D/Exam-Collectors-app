
import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/widgets/CommonSnackBar.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class SliverPostImage extends StatelessWidget {
  const SliverPostImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: Column(
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
                TextString: 'Sliver Grid Image Post',
                FontSize: 30,
                TextColor: ColorCollections.SecondaryColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('object');
            },
            child: Container(
              height: 250,
              width: 380,
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: ColorCollections.WhiteColor,
                image: const DecorationImage(
                  image: AssetImage('assets/icons/add_image.png'),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              commonSnackBar(context, 'Successfully done the operation');
            },
            child: Container(
              margin: const EdgeInsets.only(right: 30, top: 100),
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
                color: Colors.red.shade700,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: ReusableText(
                  TextString: 'Post',
                  FontSize: 20,
                  TextColor: ColorCollections.WhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
