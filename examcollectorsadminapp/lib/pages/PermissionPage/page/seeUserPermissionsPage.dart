
import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/widgets/CommonSnackBar.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class see_user_request extends StatelessWidget {
  const see_user_request({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.PrimaryColor,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/Images/biology.jpg'),
              ),
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 30, top: 15),
            decoration: BoxDecoration(
              color: ColorCollections.WhiteColor,
              border: Border.all(
                color: ColorCollections.SecondaryColor,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  TextString: 'Name :     Name',
                  FontSize: 24,
                ),
                ReusableText(
                  TextString: 'Email :     Email',
                  FontSize: 24,
                ),
                ReusableText(
                  TextString: 'Type :     $Type',
                  FontSize: 24,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  commonSnackBar(context, 'Successfully done the operation');
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 30),
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
                    color: Colors.green.shade600,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ReusableText(
                      TextString: 'Accept',
                      FontSize: 20,
                      TextColor: ColorCollections.WhiteColor,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  commonSnackBar(context, 'Successfully done the operation');
                },
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
                    color: Colors.red.shade700,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ReusableText(
                      TextString: 'Reject',
                      FontSize: 20,
                      TextColor: ColorCollections.WhiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
