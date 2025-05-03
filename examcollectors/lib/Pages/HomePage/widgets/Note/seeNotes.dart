
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../auth/examFetching.dart';
import '../../../../utils/AppColorCollections.dart';
import '../../../../widgets/AllCommonWidget.dart';

class seeSchedule extends StatefulWidget {
  String userNotes;
  String userEmail;
   seeSchedule({super.key,required this.userNotes,required this.userEmail,});

  @override
  State<seeSchedule> createState() => _seeScheduleState();
}

class _seeScheduleState extends State<seeSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.TextColor,
        leading: Container(
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorCollections.WhiteColor,
            ),
          ),
        ),
        title: ReusableText(
          FromTop: 10,
          TextString: 'Note',
          FontSize: 20,
          TextColor: ColorCollections.WhiteColor,
          TextFontWeight: FontWeight.w500,
        ),

      ),
       body: ReusableText(
         FromTop: 15,
         FromLeft: 15,
         TextString: '${widget.userNotes}',
         FontSize: 20,
         TextFontWeight: FontWeight.w500,
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          await fetchingExams().deleteNote(userNote: widget.userNotes,userEmail: widget.userEmail);
          Navigator.pop(context);
          print('clicked');
        },
        child:  Icon(Icons.delete,color: ColorCollections.RedColor,),

      ),
    );
  }
}
