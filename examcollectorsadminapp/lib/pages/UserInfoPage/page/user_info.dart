
import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class user_info extends StatefulWidget {
  const user_info({super.key});

  @override
  State<user_info> createState() => _user_infoState();
}

class _user_infoState extends State<user_info> {
  List<String> userInfo = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userInfo.add('value');
    userInfo.add('value');
    userInfo.add('value');
    userInfo.add('value');
    userInfo.add('value');
    userInfo.add('value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
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
                  TextString: 'User Information',
                  FontSize: 30,
                  TextColor: ColorCollections.SecondaryColor,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 7),
              delegate: SliverChildBuilderDelegate(
                childCount: 6,
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed('/see_request_page');
                      //navigte to other page
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: ColorCollections.SecondaryColor),
                        color: ColorCollections.WhiteColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: ReusableText(
                          TextString: userInfo[index],
                          FontSize: 24,
                          TextColor: ColorCollections.SecondaryColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.of(context).pushNamed('/see_request_page');
          //       //navigte to other page
          //     },
          //     child: Container(
          //       height: 150,
          //       width: 200,
          //       margin: EdgeInsets.only(top: 30),
          //       decoration: BoxDecoration(
          //         border: Border.all(color: ColorCollections.SecondaryColor),
          //         color: ColorCollections.WhiteColor,
          //         borderRadius: BorderRadius.circular(15),
          //       ),
          //       child: Center(
          //         child: ReusableText(
          //           TextString: 'yared dereje',
          //           FontSize: 24,
          //           TextColor: ColorCollections.SecondaryColor,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
