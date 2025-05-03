import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CreditHourDropDownButton({
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

Widget GradeDropDownButton({
  required BuildContext context,
  required double fromTop,
  required double left,
  required double right,
  required ValueChanged<String?> onSelected,
}) {
  return Container(
    decoration: BoxDecoration(),
    padding: EdgeInsets.only(left: 10),
    // color: ColorCollections.WhiteColor,
    margin: EdgeInsets.only(top: fromTop, left: left, right: right),
    child: DropdownMenu(
      // width: MediaQuery.of(context).size.width,
      initialSelection: 'None',
      menuStyle: MenuStyle(
        maximumSize: WidgetStateProperty.all(Size(200, 400)),
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
          value: '4.0',
          label: 'A (4.0)',
        ),
        DropdownMenuEntry(
          value: '3.7',
          label: 'A- (3.7)',
        ),
        DropdownMenuEntry(
          value: '3.3',
          label: 'B+ (3.3)',
        ),
        DropdownMenuEntry(
          value: '3.0',
          label: 'B (3.0)',
        ),
        DropdownMenuEntry(
          value: '2.7',
          label: 'B- (2.7)',
        ),
        DropdownMenuEntry(
          value: '2.3',
          label: 'C+ (2.3)',
        ),
        DropdownMenuEntry(
          value: '2.0',
          label: 'C (2.0)',
        ),
        DropdownMenuEntry(
          value: '1.7',
          label: 'C- (1.7)',
        ),DropdownMenuEntry(
          value: '1.3',
          label: 'D+ (1.3)',
        ),
        DropdownMenuEntry(
          value: '1.0',
          label: 'D (1.0)',
        ),
        DropdownMenuEntry(
          value: '0.0',
          label: 'F (0.0)',
        ),
      ],
    ),
  );
}

class CourseModule {
  final String courseTitle;
  final int crdHour;
   double grade;

  CourseModule({
    required this.courseTitle,
    required this.crdHour,
    required this.grade,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() => {
    'courseTitle': courseTitle,
    'crdHour': crdHour,
    'grade': grade,
  };

  // Create from JSON
  factory CourseModule.fromJson(Map<String, dynamic> json) => CourseModule(
    courseTitle: json['courseTitle'],
    crdHour: json['crdHour'],
    grade: json['grade'],
  );
}