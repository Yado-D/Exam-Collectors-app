import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Models/UserModels.dart';
import '../../../../auth/examFetching.dart';
import '../../../../global.dart';
import '../../../../utils/AppColorCollections.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/AllCommonWidget.dart';
import 'addNote.dart';
import 'seeNotes.dart';

class classSchedule extends StatefulWidget {
  const classSchedule({super.key});

  @override
  State<classSchedule> createState() => _classScheduleState();
}

class _classScheduleState extends State<classSchedule> {
  String userEmail = '';
  UserModels? userData;
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
    setState(() {});
  }

  Future<void> _loadUserData() async {
    try {
      userData = await Global.storageServices.getData(AppConstants.USERDATA);
      if (userData != null) {
        setState(() {
          userEmail = userData!.userEmail ?? '';
        });
        _fetchNotes();
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> _fetchNotes() async {
    try {
      final result = await fetchingExams().GetPostNotes(userEmail: userEmail);
      if (result.isNotEmpty) {
        setState(() {
          notes = List<Map<String, dynamic>>.from(result);
        });
      }
    } catch (e) {
      print('Error fetching notes: $e');
    }
  }

  String _formatTimestamp(Timestamp timestamp) {
    try {
      return DateFormat('yyyy-MM-dd – kk:mm').format(timestamp.toDate());
    } catch (e) {
      print('Error formatting timestamp: $e');
      return "Invalid date";
    }
  }

  Future<void> onRefresh() async {
    Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.TextColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: ReusableText(
          TextString: 'Notes',
          FontSize: 20,
          TextColor: Colors.white,
          TextFontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddSchedule()),
              );
              _fetchNotes(); // Refresh after adding new note
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: _buildNotesList(),
      ),
    );
  }

  Widget _buildNotesList() {
    if (userEmail.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (notes.isEmpty) {
      return Center(
        child: ReusableText(
          TextString: 'No notes found!',
          FontSize: 18,
          TextColor: Colors.grey,
        ),
      );
    }

    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SeeSchedule(
                noteId: note['id'],
                userNotes: note['content'],
                userEmail: userEmail,
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 70,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Images/note.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                        TextFontWeight: FontWeight.w500,
                        TextString: note['title'] ?? "Untitled",
                        FontSize: 18,
                      ),
                      ReusableText(
                        TextString: _formatTimestamp(note['createdAt']),
                        FontSize: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
