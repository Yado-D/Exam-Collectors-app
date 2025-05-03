import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:flutter/material.dart';

Widget ExamDropDownButton({
  required BuildContext context,
  required double fromTop,
  required double left,
  required double right,
  required ValueChanged<String?> onSelected,
}) {
  return Container(
    decoration: BoxDecoration(),
    // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    // color: ColorCollections.WhiteColor,
    margin: EdgeInsets.only(top: fromTop, left: left, right: right),
    child: DropdownMenu(
      initialSelection: 'None',
      menuStyle: MenuStyle(
        maximumSize: WidgetStateProperty.all(Size(200, 250)),
        minimumSize: WidgetStateProperty.all(Size(100, 100)),
        backgroundColor: WidgetStateProperty.all(ColorCollections.WhiteColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        elevation: WidgetStateProperty.all(5),
      ),
      onSelected: onSelected,
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: '1',
          label: '1',
        ),
        DropdownMenuEntry(
          value: '2',
          label: '2',
        ),
        DropdownMenuEntry(
          value: '3',
          label: '3',
        ),
        DropdownMenuEntry(
          value: '4',
          label: '4',
        ),
        DropdownMenuEntry(
          value: '5',
          label: '5',
        ),
      ],
    ),
  );
}