import 'package:examcollectorsadminapp/pages/NewPostPage/page/PostQuestions/page/post_exam_questions.dart';
import 'package:examcollectorsadminapp/pages/NewPostPage/page/PostQuestions/widgets/all_post_page_widget.dart';
import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/utils/common_snackbar.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class SelectPostExamInfo extends StatefulWidget {
  const SelectPostExamInfo({super.key});

  @override
  State<SelectPostExamInfo> createState() => _SelectPostExamInfoState();
}

class _SelectPostExamInfoState extends State<SelectPostExamInfo> {
  String university = '';
  String department = '';
  String courseName = '';
  String year = '';
  String examType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, true, 'Select Post Info'),
      backgroundColor: ColorCollections.PageColor,
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Stack(
          children: [
            ListView(
              children: [
                ReusableText(
                  FromLeft: 10,
                  FromTop: 20,
                  TextString: 'University',
                  FontSize: 18,
                  TextColor: ColorCollections.TextColor,
                  TextFontWeight: FontWeight.w600,
                ),
                Center(
                  child: PostReusableTextField(
                      FromLeft: 10,
                      FromRight: 10,
                      context: context,
                      FromTop: 0,
                      icon_name: 'file-text',
                      hintText: 'type the university',
                      textType: 'university',
                      onchange: (onchange) {
                        setState(() {
                          university = onchange.trim();
                        });
                      }),
                ),
                ReusableText(
                  FromLeft: 10,
                  FromTop: 20,
                  TextString: 'Department',
                  FontSize: 18,
                  TextColor: ColorCollections.TextColor,
                  TextFontWeight: FontWeight.w600,
                ),
                Center(
                  child: PostReusableTextField(
                      FromLeft: 10,
                      FromRight: 10,
                      context: context,
                      FromTop: 0,
                      icon_name: 'file-text',
                      hintText: 'type the department',
                      textType: 'department',
                      onchange: (onchange) {
                        setState(() {
                          department = onchange.trim();
                        });
                      }),
                ),
                ReusableText(
                  FromLeft: 10,
                  FromTop: 20,
                  TextString: 'Course Name',
                  FontSize: 18,
                  TextColor: ColorCollections.TextColor,
                  TextFontWeight: FontWeight.w600,
                ),
                Center(
                  child: PostReusableTextField(
                      FromLeft: 10,
                      FromRight: 10,
                      context: context,
                      FromTop: 0,
                      icon_name: 'file-text',
                      hintText: 'type the course',
                      textType: 'course',
                      onchange: (onchange) {
                        setState(() {
                          courseName = onchange.trim();
                        });
                      }),
                ),
                ReusableText(
                  FromLeft: 10,
                  FromTop: 20,
                  TextString: 'Year',
                  FontSize: 18,
                  TextColor: ColorCollections.TextColor,
                  TextFontWeight: FontWeight.w600,
                ),
                CommonDropdownButtons(
                  prifixIcon: Icon(Icons.school_outlined),
                  items: List.generate(
                      years.length, (index) => years[index].toString()),
                  onChanged: (value) {
                    setState(() {
                      year = value.toString();
                    });
                    // fetchExamType(
                    //     selectedUniversity!,
                    //     selectedDepartment!,
                    //     selectedCourse!,
                    //     selectedYear!);
                  },
                  hintText: 'Select Year',
                ),
                ReusableText(
                  FromLeft: 10,
                  FromTop: 20,
                  TextString: 'Exam Type',
                  FontSize: 18,
                  TextColor: ColorCollections.TextColor,
                  TextFontWeight: FontWeight.w600,
                ),
                CommonDropdownButtons(
                  prifixIcon: Icon(Icons.school_outlined),
                  items: List.generate(examTypeList.length,
                      (index) => examTypeList[index].toString()),
                  onChanged: (value) {
                    setState(() {
                      examType = value.toString();
                    });
                  },
                  hintText: 'Select exam type',
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width / 4,
              child: InkWell(
                onTap: () {
                  if (university.isEmpty) {
                    commonSnackBar(
                      context,
                      "University shouldn't be null.",
                      ColorCollections.WhiteColor,
                      ColorCollections.TextColor.withOpacity(0.5),
                    );
                  } else if (department.isEmpty) {
                    commonSnackBar(
                      context,
                      "department shouldn't be null.",
                      ColorCollections.WhiteColor,
                      ColorCollections.TextColor.withOpacity(0.5),
                    );
                  } else if (courseName.isEmpty) {
                    commonSnackBar(
                      context,
                      "course name shouldn't be null.",
                      ColorCollections.WhiteColor,
                      ColorCollections.TextColor.withOpacity(0.5),
                    );
                  } else if (year.isEmpty) {
                    commonSnackBar(
                      context,
                      "exam year shouldn't be null.",
                      ColorCollections.WhiteColor,
                      ColorCollections.TextColor.withOpacity(0.5),
                    );
                  } else if (examType.isEmpty) {
                    commonSnackBar(
                      context,
                      "Exam Type shouldn't be null.",
                      ColorCollections.WhiteColor,
                      ColorCollections.TextColor.withOpacity(0.5),
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      '/post_question_page',
                      arguments: [
                        university,
                        department,
                        courseName,
                        year,
                        examType
                      ],
                    );
                  }

                  // commonSnackBar(context, 'Successfully done the operation');
                },
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    padding: const EdgeInsets.only(right: 40, left: 40),
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorCollections.TextColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Next',
                        FontSize: 20,
                        TextColor: ColorCollections.WhiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> years = [
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
  ];
  List<String> examTypeList = ["final", "mid", "test", "quiz"];
}
