import 'package:examcollectors/auth/examFetching.dart';
import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:examcollectors/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';

class SeeSchedule extends StatefulWidget {
  final String noteId; // Add document ID
  final String userNotes;
  final String userEmail;

  const SeeSchedule({
    super.key,
    required this.noteId,
    required this.userNotes,
    required this.userEmail,
  });

  @override
  State<SeeSchedule> createState() => _SeeScheduleState();
}

class _SeeScheduleState extends State<SeeSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.TextColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorCollections.WhiteColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: ReusableText(
          FromTop: 10,
          TextString: 'Note',
          FontSize: 20,
          TextColor: ColorCollections.WhiteColor,
          TextFontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Text(
            widget.userNotes,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorCollections.WhiteColor,
        onPressed: () async {
          await _confirmDelete();
        },
        child: Icon(Icons.delete, color: ColorCollections.RedColor),
      ),
    );
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Note'),
        content: const Text('Are you sure you want to delete this note?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              'Cancel',
              style: TextStyle(color: ColorCollections.TextColor),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Delete',
              style: TextStyle(color: ColorCollections.TextColor),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await fetchingExams().deleteNote(
          noteId: widget.noteId, // Pass document ID instead of content
          userEmail: widget.userEmail,
        );
        setState(() {

        });
        Navigator.pop(context); // Close note view after deletion
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete: $e')),
        );
      }
    }
  }
}
