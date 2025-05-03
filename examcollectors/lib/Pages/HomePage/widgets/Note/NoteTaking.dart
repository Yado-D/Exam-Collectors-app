import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examcollectors/Pages/HomePage/widgets/Note/seeNotes.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Models/UserModels.dart';
import '../../../../auth/examFetching.dart';
import '../../../../global.dart';
import '../../../../utils/AppColorCollections.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/AllCommonWidget.dart';
import 'addNote.dart';

class classSchedule extends StatefulWidget {
  const classSchedule({super.key});

  @override
  State<classSchedule> createState() => _classScheduleState();
}

class _classScheduleState extends State<classSchedule> {
  Map<String, dynamic> userNotes = {};
  String userEmail = '';
  UserModels? userData;

  @override
  void initState() {
    super.initState();
    getNotes(); // Fetch notes during initialization
  }

  Future<void> getNotes() async {
    try {
      userData = await Global.storageServices.getData(AppConstants.USERDATA);
      if (userData != null) {
        setState(() {
          userEmail = userData!.userEmail ?? '';
        });
      } else {
        print('User data is null');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  String formatTimestamp(Timestamp timestamp) {
    try {
      DateTime dateTime = timestamp.toDate(); // Convert Timestamp to DateTime
      String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
      return formattedDate;
    } catch (e) {
      print('Error formatting timestamp: $e');
      return "Invalid date";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        backgroundColor:ColorCollections.TextColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: ColorCollections.WhiteColor),
        ),
        title: ReusableText(
          TextString: 'Note',
          FontSize: 20,
          TextColor: ColorCollections.WhiteColor,
          TextFontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddSchedule()),
              ).then((value) {
                if (value == true) {
                  setState(() {
                    // Trigger your refresh logic here
                  });
                }
              });
            },
            icon: Icon(Icons.add, color: ColorCollections.WhiteColor),
          ),
        ],
      ),
      body: userEmail.isEmpty
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder(
        future: fetchingExams().GetPostNotes(userEmail: userEmail),
        builder: (context, snap) {
          if (snap.hasError) {
            return Center(
              child: ReusableText(
                TextString: 'Something went wrong please check your network',
                FontSize: 16,
                TextColor: Colors.red,
              ),
            );
          } else if (snap.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snap.hasData || (snap.data as Map<String, dynamic>)['userNote'] == null) {
            return Center(
              child: ReusableText(
                TextString: 'No notes found!',
                FontSize: 18,
                TextColor: Colors.grey,
              ),
            );
          } else {
            userNotes = snap.data as Map<String, dynamic>;
            List<dynamic> notes = userNotes['userNote'];
            print("has data");
            return ListView.builder(
              itemCount: userNotes['userNote'] != null ? userNotes['userNote'].length : 0,
              itemBuilder: (context, index) {
                var note = userNotes['userNote'][index]; // Fetch the note object
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => seeSchedule(
                          userNotes: note,
                          userEmail: userEmail,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 70,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Images/note.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableText(
                              TextFontWeight: FontWeight.w500,
                              TextString: "${userNotes['Title'][index]}" ?? "", // Access Title
                              FontSize: 18,
                            ),
                            SizedBox(height: 5),
                            ReusableText(
                              FromTop: 0,
                              TextString:formatTimestamp(userNotes['Date'][index]), // Access Date
                              FontSize: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
