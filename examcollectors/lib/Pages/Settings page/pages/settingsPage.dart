
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/GetUserDetails.dart';
import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';
import '../../SignInPage/Bloc/SignInBloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
          backgroundColor: ColorCollections.PageColor,
          title:ReusableText(
            FromLeft: 15,
            TextString: 'Settings',
            FontSize: 20,
            TextColor: Colors.black,
            TextFontWeight: FontWeight.bold,

          ),
          leading: Container(
            margin: EdgeInsets.only(left: 15),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
          )),
      body: Stack(
        children: [
          // const FullPageContainer(),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ReusableText(
                  TextString: 'Account',
                  FontSize: 20,
                  FromTop: 10,
                  FromLeft: 0,
                  TextFontWeight: FontWeight.w600,
                  TextColor: ColorCollections.SecondaryColor,
                ),
                settingRowWidget(
                  ontap: () async {
                    final state = context.read<SignInBloc>().state;
                    String emailAddress = state.email;
                    Map<String, dynamic> alpha =
                        await Getuserdetails(email: emailAddress).userMap();
                    Navigator.of(context)
                        .pushNamed('/account_page', arguments: alpha);
                  },
                  iconData: const Icon(Icons.person,color: ColorCollections.TextColor,),
                  text: 'Edit my Account',
                ),
                settingRowWidget(
                  ontap: () {},
                  iconData: const Icon(Icons.notifications_active,color: ColorCollections.TextColor,),
                  text: 'Notification',
                ),
                settingRowWidget(
                  ontap: () {},
                  iconData: const Icon(Icons.help,color: ColorCollections.TextColor,),
                  text: 'Help',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget settingRowWidget({
    required Icon iconData,
    required String text,
    required VoidCallback ontap,
  }) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(
          left: 0,
          right: 0,
          top: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 25,
              child: iconData,
            ),
            Container(
              width: 200,
              child: ReusableText(
                FromLeft: 15,
                TextString: text,
                FontSize: 20,
                TextFontWeight: FontWeight.w500,
                TextColor: ColorCollections.SecondaryColor,
              ),
            ),
            Container(
              height: 30,
              width: 50,
              decoration: BoxDecoration(
                  // color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
