import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examcollectors/Pages/AskTeacher/StudentAskModel.dart';
import 'package:examcollectors/Pages/AskTeacher/chatWithTeacher.dart';
import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:examcollectors/widgets/AllCommonWidget.dart';

import 'package:flutter/material.dart';

class lookAskedUserList extends StatefulWidget {
  final String teacherEmail;
  final Map<String, dynamic> teacherInfo;

  const lookAskedUserList({
    super.key,
    required this.teacherEmail,
    required this.teacherInfo,
  });

  @override
  State<lookAskedUserList> createState() => _lookAskedUserListState();
}

class _lookAskedUserListState extends State<lookAskedUserList> {
  late Future<List<StuAskModel>> _futureQuestions;

  @override
  void initState() {
    super.initState();
    _futureQuestions = fetchUserRequested();
  }

  Future<List<StuAskModel>> fetchUserRequested() async {
    try {
      // Fetch all documents from the "AskTeacher" collection
      QuerySnapshot qs = await FirebaseFirestore.instance.collection('AskTeacher').get();

      // List to store matching StuAskModel instances
      List<StuAskModel> result = [];

      // Loop through each document
      for (var doc in qs.docs) {
        // Ensure data is a Map<String, dynamic>
        final data = doc.data() as Map<String, dynamic>?;

        if (data == null) continue; // Skip if no data is found

        // Retrieve the QuestionMap field as a list of maps
        final questionMap = data['QuestionMap'];
          print(questionMap);
        if (questionMap is List) {
          // Loop through each map in the QuestionMap list
          for (var question in questionMap) {
            if (question is Map<String, dynamic> &&
                question['teacherEmail'] == widget.teacherEmail) {
              // Create a StuAskModel for matching questions
              result.add(
                StuAskModel(
                  stuName: question['stuName'] ?? '',
                  stuQu: question['stuQu'] ?? '',
                  stuEmail:question['stuEmail']??"",
                  teacherEmail: question['teacherEmail'] ?? '',
                  teacherAns: question['teacherAns'] ?? '',
                  teacherImg: question['teacherImg'] ?? '',
                ),
              );
            }
          }
        }
      }

      return result;
    } catch (e) {
      debugPrint("Error fetching data: $e");
      return [];
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: SimpleAppBars(context, 'Asked Users'),
      body: FutureBuilder<List<StuAskModel>>(
        future: _futureQuestions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return  Center(
              child: ReusableText(
                TextString: 'An error occurred. Please try again later.',
                FontSize: 20,
              ),
            );
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return  Center(
              child: ReusableText(
                TextString: 'No data found',
                FontSize: 20,
              ),
            );
          }

          final questionUserInfo = snapshot.data!;
          return ListView.builder(
            itemCount: questionUserInfo.length,
            itemBuilder: (context, i) {
              final question = questionUserInfo[i];
              print("${question.stuName}  user name");
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatWithTeacher(
                      teacherImage: question.teacherImg,
                      teacherInfo: widget.teacherInfo,
                      userName: question.stuName,
                      userEmail: question.stuEmail,
                    ),
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      CircleAvatar(
                        backgroundColor: ColorCollections.WhiteColor,
                        radius: 25,
                        backgroundImage: question.teacherImg.isNotEmpty
                            ? NetworkImage(question.teacherImg)
                            : null,
                        child: question.teacherImg.isEmpty
                            ? const Icon(Icons.person,color:  ColorCollections.TextColor,)
                            : null,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            TextColor: ColorCollections.TextColor,
                            FromLeft: 30,
                            TextFontWeight: FontWeight.w500,
                            TextString: question.stuName ?? "",
                            FontSize: 18,
                          ),
                          ReusableText(
                            FromLeft: 30,
                            FromTop: 0,
                            TextFontWeight: FontWeight.w500,
                            TextString: question.stuQu,
                            FontSize: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
