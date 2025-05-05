import 'dart:convert';

import 'package:confetti/confetti.dart';
import 'package:examcollectors/Pages/HomePage/widgets/calculatoruiWidget.dart';
import 'package:examcollectors/global.dart';
import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:examcollectors/widgets/CommonSnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/AllCommonWidget.dart';

const double _kMinDropdownHeight = 50.0;

class calculatorUi extends StatefulWidget {
  const calculatorUi({super.key});

  @override
  State<calculatorUi> createState() => _calculatorUiState();
}

class _calculatorUiState extends State<calculatorUi> {
  List<CourseModule>? myCourses = [];
  String courseName = '';
  int crdHour = 0;
  double grade = 0.0;

  List<CourseModule>? allMyCourses = Global.storageServices.getGradeCourses();

  bool isPlaying = false;
  final controller = ConfettiController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    // 2. Retrieve and print
    final allMyCourses = this.allMyCourses;
    if (allMyCourses != null) {
      print("All courses (JSON):");
      print(allMyCourses.map((c) => c.toJson()).toList());
    } else {
      print("No courses found in storage.");
    }
    // if (CalculateGrade() > 3) {
    //   controller.play();
    // }
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 8, bottom: 15),
          child: IconButton(
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pushNamed('/home_page');
              }
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 23,
              color: ColorCollections.WhiteColor,
            ),
          ),
        ),
        backgroundColor: ColorCollections.TextColor,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(),
          height: 120,
          padding: EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: FittedBox(
                  child: ReusableText(
                    FromLeft: 20,
                    TextString: 'GPA Calculator',
                    FontSize: 20,
                    TextColor: ColorCollections.WhiteColor,
                    TextFontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ConfettiWidget(
            emissionFrequency: 0.5,
            minBlastForce: 40,
            gravity: 1,
            maxBlastForce: 50,
            numberOfParticles: 20,
            blastDirectionality: BlastDirectionality.explosive,
            confettiController: controller,
            shouldLoop: isPlaying,
            child: ListView(
              children: [
                ReusableText(
                  FromTop: 10,
                  FromLeft: 20,
                  TextString:
                      'Calculate your GPA and track your academic progress',
                  FontSize: 18,
                  TextColor: ColorCollections.TextColor.withOpacity(0.9),
                  TextFontWeight: FontWeight.w700,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white70,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        FromLeft: 0,
                        TextString: 'Cumulative GPA',
                        FontSize: 16,
                        TextColor: ColorCollections.TextColor.withOpacity(0.9),
                        TextFontWeight: FontWeight.w600,
                      ),
                      Row(
                        children: [
                          ReusableText(
                            FromLeft: 0,
                            TextString: '${CalculateGrade()}',
                            FontSize: 25,
                            TextColor:
                                ColorCollections.TextColor.withOpacity(0.9),
                            TextFontWeight: FontWeight.bold,
                          ),
                          Transform.translate(
                            offset: Offset(0, 7),
                            child: ReusableText(
                              FromLeft: 0,
                              TextString: '/4.0',
                              FontSize: 16,
                              TextColor:
                                  ColorCollections.TextColor.withOpacity(0.9),
                              TextFontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      LinearProgressIndicator(
                        value: normalize(CalculateGrade()),
                        minHeight: 10,
                        backgroundColor: ColorCollections.GreyColor,
                        color: ColorCollections.TextColor,
                        borderRadius: BorderRadius.circular(10),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      FromLeft: 15,
                      TextString: 'Your Courses',
                      FontSize: 16,
                      TextColor: ColorCollections.TextColor.withOpacity(0.9),
                      TextFontWeight: FontWeight.w600,
                    ),
                    ReusableText(
                      FromRight: 15,
                      TextString: '${allMyCourses?.length ?? 0} Courses',
                      FontSize: 16,
                      TextColor: ColorCollections.TextColor.withOpacity(0.9),
                      TextFontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                if (allMyCourses?.length == 0)
                  Center(
                    child: ReusableText(
                      FromRight: 15,
                      TextString: 'No course added yet.',
                      FontSize: 16,
                      TextColor: ColorCollections.TextColor.withOpacity(0.9),
                      TextFontWeight: FontWeight.w600,
                    ),
                  ),
                myCourses?.length != 0 && myCourses != null
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: myCourses?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                top: 15, bottom: 0, right: 15, left: 15),
                            child: commonSubjectContainer(
                              course: myCourses![index],
                              editPressed: (value) async {
                                // Handle selection
                                print('Selected: $value');
                                setState(() {
                                  myCourses![index].grade =
                                      double.parse(value!);
                                });
                                await Global.storageServices
                                    .addGradeCourses(myCourses!);
                              },
                              deletePressed: () async {
                                setState(() {
                                  myCourses!.removeAt(index);
                                });
                                await Global.storageServices
                                    .addGradeCourses(myCourses!);
                              },
                            ),
                          );
                        },
                      )
                    : (allMyCourses?.length != 0 && allMyCourses != null)
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: allMyCourses.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    top: 15, bottom: 0, right: 15, left: 15),
                                child: commonSubjectContainer(
                                  course: allMyCourses[index],
                                  editPressed: (value) async {
                                    // Handle selection
                                    print('Selected: $value');
                                    setState(() {
                                      allMyCourses[index].grade =
                                          double.parse(value!);
                                    });
                                    await Global.storageServices
                                        .addGradeCourses(allMyCourses);
                                  },
                                  deletePressed: () async {
                                    setState(() {
                                      allMyCourses.removeAt(index);
                                    });
                                    await Global.storageServices
                                        .addGradeCourses(allMyCourses);
                                  },
                                ),
                              );
                            },
                          )
                        : SizedBox(),
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white70,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        FromRight: 15,
                        TextString: 'Add New Course',
                        FontSize: 18,
                        TextColor: ColorCollections.TextColor.withOpacity(0.9),
                        TextFontWeight: FontWeight.w700,
                      ),
                      ReusableText(
                        FromRight: 15,
                        TextString: 'Courses Name',
                        FontSize: 16,
                        TextColor: ColorCollections.TextColor.withOpacity(0.9),
                        TextFontWeight: FontWeight.w600,
                      ),
                      reusableTextField(
                        widthOfTextField: 250,
                        WidthOfContainer: 300,
                        hintText: 'Enter course name',
                        textType: 'name',
                        onchange: (onchange) {
                          setState(() {
                            courseName = onchange;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ReusableText(
                                FromLeft: 0,
                                TextString: 'Credits',
                                FontSize: 16,
                                TextColor:
                                    ColorCollections.TextColor.withOpacity(0.9),
                                TextFontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ReusableText(
                                FromLeft: 0,
                                FromRight: 120,
                                TextString: 'Grade',
                                FontSize: 16,
                                TextColor:
                                    ColorCollections.TextColor.withOpacity(0.9),
                                TextFontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CreditHourDropDownButton(
                                context: context,
                                fromTop: 0,
                                left: 0,
                                right: 0,
                                onSelected: (value) {
                                  setState(() {
                                    crdHour = int.parse(value!);
                                  });
                                }),
                          ),
                          Expanded(
                            child: GradeDropDownButton(
                                context: context,
                                fromTop: 0,
                                left: 0,
                                right: 0,
                                onSelected: (value) {
                                  setState(() {
                                    grade = double.parse(value!);
                                  });
                                }),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          if (crdHour == 0) {
                            commonSnackBar(
                                context,
                                "Couldn't add Empty Credit Hour",
                                ColorCollections.WhiteColor,
                                ColorCollections.TextColor.withOpacity(0.7));
                          } else if (grade == 0.0) {
                            commonSnackBar(
                                context,
                                "Couldn't add Empty Grade",
                                ColorCollections.WhiteColor,
                                ColorCollections.TextColor.withOpacity(0.7));
                          } else if (courseName.isEmpty) {
                            commonSnackBar(
                                context,
                                "Couldn't add Empty Subject Name",
                                ColorCollections.WhiteColor,
                                ColorCollections.TextColor.withOpacity(0.7));
                          } else {
                            CourseModule courseModel = CourseModule(
                              courseTitle: courseName,
                              crdHour: crdHour,
                              grade: grade,
                            );

                            print(courseModel.toString());

                            setState(() {
                              myCourses = allMyCourses;
                              myCourses?.add(courseModel);
                            });

                            Global.storageServices.addGradeCourses(myCourses!);

                            commonSnackBar(
                                context,
                                "Course Added",
                                ColorCollections.WhiteColor,
                                ColorCollections.TextColor.withOpacity(0.7));
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.maxFinite,
                          // padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            color: ColorCollections.TextColor,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: ColorCollections.WhiteColor,
                              ),
                              Center(
                                child: ReusableText(
                                  // FromRight: 15,
                                  TextString: 'Add Course',
                                  FontSize: 16,
                                  TextColor: ColorCollections.WhiteColor,
                                  TextFontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

// Helper function to create consistent dropdown items
  double CalculateGrade() {
    List<int> allCrHrs = [];
    List<double> AllGrades = [];
    if (allMyCourses == null) {
      return 0;
    }
    for (int i = 0; i < allMyCourses!.length; i++) {
      allCrHrs.add(allMyCourses![i].crdHour);
      AllGrades.add(allMyCourses![i].grade);
    }

    if (allCrHrs.length != AllGrades.length) {
      print("Error: Mismatched credit hours and grades count.");
      return 0.0;
    }

    double totalGradePoints = 0.0;
    int totalCreditHours = 0;

    for (int i = 0; i < AllGrades.length; i++) {
      double grade = AllGrades[i];
      int creditHour = allCrHrs[i];

      totalGradePoints += grade * creditHour;
      totalCreditHours += creditHour;
    }

    double gpa = totalGradePoints / totalCreditHours;

    if (totalGradePoints == 0 && totalCreditHours == 0) {
      gpa = 0;
    }
    print("Your GPA is: ${gpa.toStringAsFixed(2)}");
    return double.parse(gpa.toStringAsFixed(2));
  }
}

Widget commonSubjectContainer({
  required CourseModule course,
  required VoidCallback deletePressed,
  required ValueChanged<String?> editPressed,
}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white70,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.white70,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              FromRight: 15,
              TextString: course.courseTitle,
              FontSize: 16,
              FromBottom: 0,
              TextColor: ColorCollections.TextColor.withOpacity(0.9),
              TextFontWeight: FontWeight.bold,
            ),
            ReusableText(
              FromTop: 0,
              FromRight: 15,
              TextString: '${course.crdHour} credits',
              FontSize: 16,
              TextColor: ColorCollections.TextColor.withOpacity(0.7),
              TextFontWeight: FontWeight.w600,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              isDense: true,
              value: '${course.grade.toString()}', // Default selected value
              itemHeight: _kMinDropdownHeight, // Reduced item height
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              underline: Container(
                height: 1,
                color: Colors.grey[400],
              ),
              items: [
                _buildGradeItem('A (4.0)', "4.0"),
                _buildGradeItem('A- (3.7)', "3.7"),
                _buildGradeItem('B+ (3.3)', "3.3"),
                _buildGradeItem('B (3.0)', "3.0"),
                _buildGradeItem('B- (2.7)', "2.7"),
                _buildGradeItem('C+ (2.3)', "2.3"),
                _buildGradeItem('C (2.0)', "2.0"),
                _buildGradeItem('C- (1.7)', "1.7"),
                _buildGradeItem('D+ (1.3)', "1.3"),
                _buildGradeItem('D (1.0)', "1.0"),
                _buildGradeItem('F (0.0)', "0.0"),
              ],
              onChanged: editPressed,
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: deletePressed,
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
            )
          ],
        ),
      ],
    ),
  );
}

double normalize(double inputValue) {
  // Clamp the input to ensure it's within [0, 4]
  final clampedValue = inputValue.clamp(0.0, 4.0);
  // Normalize to [0, 1]
  return clampedValue / 4;
}

DropdownMenuItem<String> _buildGradeItem(String text, String value) {
  return DropdownMenuItem(
    value: value,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: TextStyle(fontSize: 14),
      ),
    ),
  );
}

final Map<double, String> gradeMap = {
  4.0: 'A',
  3.7: 'A-',
  3.3: 'B+',
  3.0: 'B',
  2.7: 'B-',
  2.3: 'C+',
  2.0: 'C',
  1.0: 'D',
  0.0: 'F',
};
