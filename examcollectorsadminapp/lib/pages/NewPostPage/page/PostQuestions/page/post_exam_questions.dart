import 'package:examcollectorsadminapp/auth/firebaseExamPostingAuth.dart';
import 'package:examcollectorsadminapp/pages/NewPostPage/page/PostQuestions/page/post_image_of_exam.dart';
import 'package:examcollectorsadminapp/pages/NewPostPage/page/PostQuestions/widgets/all_post_page_widget.dart';
import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
import 'package:examcollectorsadminapp/utils/common_snackbar.dart';
import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
import 'package:flutter/material.dart';

class postExamInfo extends StatefulWidget {
  const postExamInfo({super.key});

  @override
  State<postExamInfo> createState() => _postExamInfoState();
}

class _postExamInfoState extends State<postExamInfo> {
  String examTime = "";

  // In your state class
  final TextEditingController _questionController = TextEditingController();

  void _postQuestion({
    required String question,
    required String university,
    required String department,
    required String courseName,
    required String year,
    required String examType,
    required String examTime,
  }) async {
    try {
      final result = await AuthMethod.PostQuestionsToFireaseDatabase(
        university: university,
        department: department,
        courseName: courseName,
        year: year,
        examType: examType,
        examTime: examTime,
        questions: question,
      );
      if (result == "Posted") {
        commonSnackBar(
          context,
          "Exam Uploaded successfully",
          ColorCollections.TextColor.withOpacity(0.5),
        );
        Navigator.pushNamed(context, "/result_page");
      } else {
        commonSnackBar(
          context,
          result,
          ColorCollections.TextColor.withOpacity(0.5),
        );
      }
    } catch (e) {
      commonSnackBar(
        context,
        "Error: ${e.toString()}",
        ColorCollections.TextColor.withOpacity(0.5),
      );
    }

    debugPrint('Posted question: $question');
  }

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        (ModalRoute.of(context)!.settings.arguments as List).cast<String?>();

    return Scaffold(
      appBar: SimpleAppBars(context, false, 'Post Question'),
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
                  TextString: 'Exam Time',
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
                      hintText: 'type the exam time',
                      textType: 'course',
                      onchange: (onchange) {
                        setState(() {
                          examTime = onchange.trim();
                        });
                      }),
                ),
                ReusableText(
                  FromLeft: 10,
                  FromTop: 20,
                  TextString: 'Exam Question',
                  FontSize: 18,
                  TextColor: ColorCollections.TextColor,
                  TextFontWeight: FontWeight.w600,
                ),
                Container(
                  height: 320,
                  margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorCollections.WhiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      TextField(
                        controller: _questionController,
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(16),
                          hintText: 'Type your question here...',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorCollections.TextColor,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: IconButton(
                          icon: Icon(Icons.send,
                              color: ColorCollections.PrimaryColor),
                          onPressed: () {
                            if (_questionController.text.trim().isNotEmpty &&
                                examTime.isNotEmpty) {
                              _postQuestion(
                                question: _questionController.text,
                                university: args[0]!,
                                department: args[1]!,
                                courseName: args[2]!,
                                year: args[3]!,
                                examType: args[4]!,
                                examTime: examTime,
                              );
                              _questionController.clear();
                            } else {
                              commonSnackBar(
                                context,
                                "Please fill the required field first!",
                                ColorCollections.WhiteColor,
                                ColorCollections.TextColor.withOpacity(0.5),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<String> examTypeList = ["final", "mid", "test", "quiz"];
}
