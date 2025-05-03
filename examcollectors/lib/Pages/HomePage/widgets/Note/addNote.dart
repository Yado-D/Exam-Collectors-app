
import 'package:flutter/material.dart';

import '../../../../Models/UserModels.dart';
import '../../../../auth/examFetching.dart';
import '../../../../global.dart';
import '../../../../utils/AppColorCollections.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/AllCommonWidget.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({super.key});

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  final TextEditingController _controller = TextEditingController();
  UserModels? userModels;
  String? title;

  @override
  void initState() {
    super.initState();
    // Fetch user data safely and update state if mounted
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          userModels = Global.storageServices.getData(AppConstants.USERDATA);
          print("this is username => ${userModels?.userName ?? "Unknown"}");
        });
      }
    });
  }

  @override
  void dispose() {
    // Dispose controller to release resources
    _controller.dispose();
    super.dispose();
  }

  Future<void> saveNote() async {
    if (title != null) {
      await fetchingExams().postNotes(
        userEmail: userModels?.userEmail ?? '',
        userNote: _controller.text,
        title: title!,
      );
      if (mounted) {
        Navigator.pop(context,true); // Navigate back safely
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,

      appBar: AppBar(
        backgroundColor: ColorCollections.TextColor,
        leading: IconButton(
          onPressed: () {
            if (mounted) Navigator.pop(context);
          },
          icon:  Icon(Icons.arrow_back, color: ColorCollections.WhiteColor),
        ),
        title: ReusableText(
          TextString: 'New Note',
          FontSize: 20,
          TextColor: ColorCollections.WhiteColor,
          TextFontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (mounted) Navigator.pop(context,true);
            },
            icon: const Icon(Icons.delete, color: ColorCollections.RedColor),
          ),
          IconButton(
            onPressed: saveNote,
            icon:  Icon(Icons.check, color: ColorCollections.WhiteColor),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: ()async{
          setState(() {

          });
          return true;
        },
        child: ListView(
          children: [
            reusableTextField(
              FromTop: 15,
              FromLeft: 5,
              FromRight: 5,
              hintText: 'Title',
              textType: 'textType',
              onchange: (onchange) {
                if (mounted) {
                  setState(() {
                    title = onchange;
                  });
                }
              },
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 70),
              child: TextField(
                controller: _controller,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Type the Description',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
