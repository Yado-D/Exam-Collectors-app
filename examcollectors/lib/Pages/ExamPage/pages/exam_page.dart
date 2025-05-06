// import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examcollectors/Models/examQuestionModel.dart';
import 'package:examcollectors/Pages/ExamPage/Bloc/exam_bloc.dart';
import 'package:examcollectors/Pages/ExamPage/Widget/help_exam_page.dart';
import 'package:examcollectors/auth/authetication.dart';
import 'package:examcollectors/auth/examFetching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';
import '../../../widgets/CommonSnackBar.dart';

class exam_page extends StatefulWidget {
  const exam_page({super.key});

  @override
  _exam_pageState createState() => _exam_pageState();
}

class _exam_pageState extends State<exam_page> {
  String? selectedUniversity;
  String? selectedCourse;
  String? selectedDepartment;
  String? selectedYear;
  String? selectedExamType;

  List<String> universities = [];
  List<String> departments = [];
  List<String> courses = [];
  List<int> years = [];
  List<String> examType = [];
  List<Map<String, dynamic>> examQuestions = [];
  String examTime = '50';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getUniversities();
  }

  Future<void> getUniversities() async {
    universities = await fetchingExams.fetchUniversities();
    print("the universities are : ${universities}");
    setState(() {});
  }

  Future<void> fetchDepartments(String university) async {
    departments = await fetchingExams.fetchDepartments(university);
    print("the departments are : ${departments}");
    setState(() {});
  }

  Future<void> fetchCourses(String university, String department) async {
    courses = await fetchingExams.fetchCourses(university, department);
    print("the Courses are : ${courses}");
    setState(() {});
  }

  Future<void> fetchYears(
    String university,
    String department,
    String subject,
  ) async {
    years = await fetchingExams.fetchYears(university, department, subject);
    print("the years are : ${years}");
    setState(() {});
  }

  Future<void> fetchExamType(
    String university,
    String department,
    String subject,
    String year,
  ) async {
    examType = await fetchingExams.fetchExamType(
        university, department, subject, year);
    print("the exam type are : ${examType}");
    setState(() {});
  }

  Future<void> fetchExamQuestions(String university, String department,
      String subject, String year, String examType) async {
    examQuestions = await fetchingExams.fetchExamQuestions(
        university, department, subject, year, examType);
    print("the exam questions are : ${examQuestions}");
    examTime = await fetchingExams.fetchExamTime(
        university, department, subject, year, examType);
    print("the exam Time is : ${examTime}");
    setState(() {});
  }

  Future<void> onRefresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorCollections.TextColor,
        title: Center(
          child: Column(
            children: [
              ReusableText(
                FromTop: 20,
                FromLeft: 0,
                TextString: 'UniExam Portal',
                FontSize: 23,
                FromBottom: 0,
                TextColor: ColorCollections.WhiteColor,
                TextFontWeight: FontWeight.bold,
              ),
              ReusableText(
                FromBottom: 20,
                FromLeft: 0,
                FromTop: 0,
                TextString: 'Access your university exams',
                FontSize: 18,
                TextColor: ColorCollections.WhiteColor,
                TextFontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: ColorCollections.PageColor,
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: ColorCollections.WhiteColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: ColorCollections.TextColor,
                          ),
                          ReusableText(
                            FromTop: 0,
                            FromLeft: 10,
                            FromBottom: 0,
                            TextString: 'Filter Exams',
                            FontSize: 18,
                            TextFontWeight: FontWeight.w500,
                            TextColor: ColorCollections.SecondaryColor,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              ColorCollections.TextColor.withOpacity(0.5)),
                          maximumSize: WidgetStateProperty.all(Size(100, 50)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                        ),
                        onPressed: () => showExamSelectionHelp(context),
                        child: ReusableText(
                          FromTop: 0,
                          FromLeft: 10,
                          FromBottom: 0,
                          TextString: 'Help',
                          FontSize: 15,
                          TextFontWeight: FontWeight.w500,
                          TextColor: ColorCollections.WhiteColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              FromTop: 0,
                              FromLeft: 0,
                              FromBottom: 0,
                              TextString: 'University',
                              FontSize: 18,
                              TextFontWeight: FontWeight.w500,
                              TextColor: ColorCollections.SecondaryColor,
                            ),
                            CommonDropdownButtons(
                              prifixIcon: Icon(Icons.school_outlined),
                              items: universities,
                              onChanged: (value) {
                                setState(() {
                                  selectedUniversity = value;
                                  fetchDepartments(selectedUniversity!);
                                });
                              },
                              hintText: 'Select university',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ReusableText(
                              FromTop: 0,
                              FromRight: 40,
                              FromBottom: 0,
                              TextString: 'Department',
                              FontSize: 18,
                              TextFontWeight: FontWeight.w500,
                              TextColor: ColorCollections.SecondaryColor,
                            ),
                            CommonDropdownButtons(
                              prifixIcon: Icon(Icons.school_outlined),
                              items: departments,
                              onChanged: (value) {
                                print('Selected: $value');
                                setState(() {
                                  selectedDepartment = value;
                                });
                                fetchCourses(
                                    selectedUniversity!, selectedDepartment!);
                              },
                              hintText: 'Select department',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ReusableText(
                    FromTop: 10,
                    FromRight: 40,
                    FromLeft: 0,
                    FromBottom: 0,
                    TextString: 'Subject',
                    FontSize: 18,
                    TextFontWeight: FontWeight.w500,
                    TextColor: ColorCollections.SecondaryColor,
                  ),
                  CommonDropdownButtons(
                    prifixIcon: Icon(Icons.school_outlined),
                    items: courses,
                    onChanged: (value) {
                      print('Selected: $value');
                      setState(() {
                        selectedCourse = value;
                        fetchYears(selectedUniversity!, selectedDepartment!,
                            selectedCourse!);
                      });
                    },
                    hintText: 'Select subjects',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              FromTop: 0,
                              FromLeft: 0,
                              FromBottom: 0,
                              TextString: 'Year',
                              FontSize: 18,
                              TextFontWeight: FontWeight.w500,
                              TextColor: ColorCollections.SecondaryColor,
                            ),
                            CommonDropdownButtons(
                              prifixIcon: Icon(Icons.school_outlined),
                              items: List.generate(years.length,
                                  (index) => years[index].toString()),
                              onChanged: (value) {
                                setState(() {
                                  selectedYear = value.toString();
                                });
                                fetchExamType(
                                    selectedUniversity!,
                                    selectedDepartment!,
                                    selectedCourse!,
                                    selectedYear!);
                              },
                              hintText: 'Select Year',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ReusableText(
                              FromTop: 0,
                              FromRight: 80,
                              FromBottom: 0,
                              TextString: 'Exam Type',
                              FontSize: 18,
                              TextFontWeight: FontWeight.w500,
                              TextColor: ColorCollections.SecondaryColor,
                            ),
                            CommonDropdownButtons(
                              prifixIcon: Icon(Icons.school_outlined),
                              items: examType,
                              onChanged: (value) {
                                print('Selected: $value');
                                setState(() {
                                  selectedExamType = value;
                                });
                                fetchExamQuestions(
                                    selectedUniversity!,
                                    selectedDepartment!,
                                    selectedCourse!,
                                    selectedYear!,
                                    value!);
                              },
                              hintText: 'Select Exam type',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.menu_book,
                        color: ColorCollections.TextColor,
                      ),
                      ReusableText(
                        FromTop: 0,
                        FromLeft: 10,
                        FromBottom: 0,
                        TextString: 'Available Exams',
                        FontSize: 18,
                        TextFontWeight: FontWeight.w500,
                        TextColor: ColorCollections.SecondaryColor,
                      ),
                    ],
                  ),
                  examQuestions.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            print(examQuestions[index]);
                            QuestionModel questionModel =
                                QuestionModel.fromJson(examQuestions[index]);

                            return ReusableExamContainer(
                              examTitle: selectedCourse!,
                              examYear: int.parse(selectedYear!),
                              examType: selectedExamType ?? "",
                              numQuestion: examQuestions.length,
                              min: int.parse(examTime),
                              startExam: () {
                                //feed questions to bloc
                                context.read<ExamBloc>().add(
                                      ExamLoadedEvent(
                                        questionList: examQuestions,
                                        examTime: examTime,
                                      ),
                                    );
                                Navigator.of(context).pushNamed(
                                    '/exam_started_page',
                                    arguments: [selectedCourse,examTime,examQuestions.length.toString()]);
                              },
                            );
                          })
                      : Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(top: 15, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorCollections.WhiteColor,
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/icons/noData.png",
                                width: 80,
                                height: 80,
                                fit: BoxFit.fill,
                              ),
                              ReusableText(
                                FromTop: 5,
                                FromLeft: 10,
                                FromBottom: 0,
                                TextString:
                                    'There is no available exams on the selected fields.',
                                FontSize: 16,
                                TextFontWeight: FontWeight.w400,
                                TextColor: ColorCollections.SecondaryColor.withOpacity(0.7),
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ReusableExamContainer({
    required String examTitle,
    required int examYear,
    required int numQuestion,
    required int min,
    required VoidCallback startExam,
    required String examType,
  }) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 10, right: 10),
      decoration: BoxDecoration(
        color: ColorCollections.WhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableText(
                FromTop: 0,
                FromLeft: 10,
                FromBottom: 0,
                TextString: examTitle,
                FontSize: 18,
                TextFontWeight: FontWeight.w500,
                TextColor: ColorCollections.SecondaryColor,
              ),
              TextButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(Size(80, 20)),
                  backgroundColor: WidgetStateProperty.all(
                      ColorCollections.TextColor.withOpacity(0.7)),
                ),
                onPressed: () {},
                child: ReusableText(
                  FromTop: 0,
                  FromLeft: 10,
                  FromBottom: 0,
                  TextString: examType,
                  FontSize: 15,
                  TextFontWeight: FontWeight.w500,
                  TextColor: Colors.lightBlue,
                ),
              )
            ],
          ),
          ReusableText(
            FromTop: 0,
            FromLeft: 10,
            FromBottom: 0,
            TextString: 'Year : ${examYear}',
            FontSize: 18,
            TextFontWeight: FontWeight.w400,
            TextColor: ColorCollections.SecondaryColor,
          ),
          ReusableText(
            FromTop: 0,
            FromLeft: 10,
            FromBottom: 0,
            TextString: '${numQuestion} questions • ${min} minutes',
            FontSize: 18,
            TextFontWeight: FontWeight.w400,
            TextColor: ColorCollections.SecondaryColor,
          ),
          InkWell(
            onTap: startExam,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: double.maxFinite,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorCollections.TextColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: ReusableText(
                  FromTop: 0,
                  FromLeft: 10,
                  FromBottom: 0,
                  TextString: 'Start Exam',
                  FontSize: 18,
                  TextFontWeight: FontWeight.w400,
                  TextColor: ColorCollections.WhiteColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
