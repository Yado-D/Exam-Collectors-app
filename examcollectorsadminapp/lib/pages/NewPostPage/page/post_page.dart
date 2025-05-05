import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class new_post extends StatelessWidget {
  const new_post({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, true, 'Which Post?'),
      backgroundColor: ColorCollections.PageColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          postWidget(
            text: 'Carousel Slider',
            ontap: () {
              Navigator.of(context).pushNamed('/carousel_page');
            },
          ),
          postWidget(
            text: 'SliverGrid View ',
            ontap: () {
              Navigator.of(context).pushNamed('/sliver_grid_page');
            },
          ),
          postWidget(
            text: 'Post Questions',
            ontap: () {
              Navigator.of(context).pushNamed('/select_post_info');
            },
          ),
          postWidget(
            text: 'Edit Questions',
            ontap: () {},
          ),
        ],
      ),
    );
  }

  Widget postWidget({
    required String text,
    required void Function() ontap,
  }) {
    return Center(
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 60,
          width: 250,
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: ColorCollections.WhiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: ReusableText(
              TextColor: ColorCollections.SecondaryColor,
              TextString: text,
              FontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
