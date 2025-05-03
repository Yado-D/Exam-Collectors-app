import 'package:flutter/material.dart';

import '../../utils/AppColorCollections.dart';
import 'help_page_all_part.dart';

class FAQ_pages extends StatelessWidget {
  const FAQ_pages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorCollections.PageColor,
      body: FaqSection(),
    );
  }

//

//   Widget FAQModel({
//     required String question,
//   }) {
//     return Container(
//       height: 90,
//       width: 320,
//       margin: EdgeInsets.only(top: 10),
//       decoration: BoxDecoration(
//         color: ColorCollections.GreyColor,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: ExpansionTile(
//         title: ReusableText(
//           FromLeft: 30,
//           FromTop: 5,
//           TextString: question,
//           FontSize: 20,
//           TextColor: ColorCollections.SecondaryColor,
//         ),
//         children: [
//           Text('data'),
//         ],
//       ),
//     );
//   }
}
