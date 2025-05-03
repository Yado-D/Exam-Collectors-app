import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/AppColorCollections.dart';
import '../Bloc/WelcomePage4Bloc.dart';
import '../Bloc/WelcomePage4BlocEvent.dart';

//Drop down button

Widget DropDownButton(
    {required BuildContext context,
    required double fromTop,
    required double left,
    required double right}) {
  return Container(
    decoration: BoxDecoration(

    ),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    // color: ColorCollections.WhiteColor,
    margin: EdgeInsets.only(top: fromTop, left: left, right: right),
    child: DropdownMenu(
      width: MediaQuery.of(context).size.width,
      initialSelection: 'None',
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(ColorCollections.WhiteColor),
        shape: WidgetStateProperty.all(

          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        elevation: WidgetStateProperty.all(5),
      ),
      onSelected: (value) {
        context.read<Welcomepage4blocs>().add(Welcomepage4blocEvent(SelectedItem: value!));
      },
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: 'AASTU',
          label: 'AASTU',
        ),
        DropdownMenuEntry(
          value: 'ASTU',
          label: 'ASTU',
        ),
        DropdownMenuEntry(
          value: 'Gonder',
          label: 'Gonder',
        ),
        DropdownMenuEntry(
          value: 'Bahir Dar',
          label: 'Bahir Dar',
        ),
        DropdownMenuEntry(
          value: 'Mekele',
          label: 'Mekele',
        ),
        DropdownMenuEntry(
          value: 'Welkite',
          label: 'Welkite',
        ),
        DropdownMenuEntry(
          value: 'Hawasa',
          label: 'Hawasa',
        ),
        DropdownMenuEntry(
          value: 'Gima',
          label: 'Gima',
        ),
        DropdownMenuEntry(
          value: 'Weldya',
          label: 'Weldya',
        ),
        DropdownMenuEntry(
          value: 'Dese',
          label: 'Dese',
        ),
        DropdownMenuEntry(
          value: 'Arsi',
          label: 'Arsi',
        ),
        DropdownMenuEntry(
          value: 'None',
          label: 'None',
        ),
      ],

    ),
  );
}

// DropdownButton<String>(
//   value: 'one',
//   items: [
//     DropdownMenuItem(
//       value: 'one',
//       child: Text(' gega'),
//     ),
//     DropdownMenuItem(
//       value: 'two',
//       child: Text('data'),
//     ),
//     DropdownMenuItem(
//       value: 'three',
//       child: Text('yes'),
//     ),
//   ],
//   onChanged: (value) {},
// ),
