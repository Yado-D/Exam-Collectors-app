
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examcollectors/Models/chatModel.dart';

import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';

Widget ChatRightItems({
  required Message userMessage,
  required BuildContext context,
  }) {
  Timestamp timestamp = userMessage.timestamp;
  DateTime dateTime = timestamp.toDate();
  String formattedDate = DateFormat.yMMMd().add_jm().format(dateTime);
  String show = "text";
  return  Container(
      padding: EdgeInsets.only(top: 2.w, left: 2.w, right: 2.w, bottom: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 40.w,
              minWidth: 130,
              maxWidth: 230.w,
            ),
            child: Container(
              margin: EdgeInsets.only(right: 10.w, top: 0.w),
              padding: EdgeInsets.only(
                  bottom: 10.w),
              decoration: BoxDecoration(
                color: Colors.blue.shade400,
                borderRadius: BorderRadius.circular(10.w),
              ),

              //check if the file is text or image
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                           // ReusableText(
                           //   TextColor: ColorCollections.WhiteColor,
                           //    FromTop: 2,
                           //    FromRight: 0,
                           //    FromLeft: 4,
                           //    FromBottom: 0,
                           //    TextString: userMessage.userName,
                           //    FontSize: 15,
                           //    TextFontWeight: FontWeight.w400,
                           //  ),
                            userMessage.replyToMessage !=null ?  ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 120.w,
                              ),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(left: 5,top: 8,bottom: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.lightGreen,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      ReusableText(
                                        TextColor: ColorCollections.WhiteColor,
                                        FromTop: 2,
                                        FromRight: 2,
                                        FromLeft: 15,
                                        FromBottom: 2,
                                        TextString: userMessage.replyToMessage!,
                                        FontSize: 12,
                                        TextFontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ):SizedBox(),

                  userMessage.messageImage.isNotEmpty ?   ConstrainedBox(
                    constraints: BoxConstraints(
                      // maxWidth: 90.w,
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.network(userMessage.messageImage,fit: BoxFit.fill,),
                    ),
                  ):SizedBox(),
                  ReusableText(
                    TextColor: ColorCollections.WhiteColor,
                    FromTop: 10,
                    FromRight: 0,
                    FromLeft: 10,
                    FromBottom: 0,
                    TextString: userMessage.message,
                    FontSize: 16,
                    TextFontWeight: FontWeight.w400,

                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ReusableText(
                          TextColor: ColorCollections.WhiteColor,
                          FromTop: 5,
                          FromRight: 10,
                          FromLeft: 60,
                          FromBottom: 0,
                          TextString: formattedDate,
                          FontSize: 14,
                          TextFontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
  );
}


//from left side



Widget ChatLeftItems({
  required BuildContext context,
  required Message userMessage,

}) {
  Timestamp timestamp = userMessage.timestamp;
  DateTime dateTime = timestamp.toDate();
  String formattedDate = DateFormat.yMMMd().add_jm().format(dateTime);
  String show = "text";
  return  Container(
      padding: EdgeInsets.only(top: 2.w, left: 2.w, right: 2.w, bottom: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Container(
          //   margin: EdgeInsets.only( right: 5.w,),
          //   height: 50,
          //   width: 50,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(25),
          //     image: DecorationImage(
          //       fit: BoxFit.fill,
          //         image: userMessage.userImage=='' ? AssetImage('assets/Images/defoult.png'): NetworkImage(userMessage.userImage)),
          //     color: ColorCollections.WhiteColor,
          //
          //   ),
          //   // child: Image.network("src"),
          // ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 40.w,
              minWidth: 130,
              maxWidth: 230.w,
            ),
            child: Container(
                margin: EdgeInsets.only(left: 10.w, top: 0.w,bottom: 25.w),
                padding: EdgeInsets.only(
                    bottom: 10.w),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.w),bottomRight: Radius.circular(10.w),topRight: Radius.circular(10.w)),
                ),

                //check if the file is text or image
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // ReusableText(
                   //    FromTop: 2,
                   //    FromRight: 0,
                   //    FromLeft: 4,
                   //    FromBottom: 0,
                   //    TextString: userMessage.userName,
                   //    FontSize: 15,
                   //   TextColor: Colors.lightBlue.shade200,
                   //   TextFontWeight: FontWeight.w400,
                   //  ),
                    userMessage.replyToMessage !=null ?  ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 120.w,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(left: 5,top: 8,bottom: 8),
                          decoration: BoxDecoration(
                              color: ColorCollections.WhiteColor,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                TextColor: ColorCollections.WhiteColor,
                                FromTop: 2,
                                FromRight: 2,
                                FromLeft: 15,
                                FromBottom: 2,
                                TextString: userMessage.replyToMessage!,
                                FontSize: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ):SizedBox(),
                    userMessage.messageImage.isNotEmpty ?   ConstrainedBox(
                      constraints: BoxConstraints(
                        // maxWidth: 90.w,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Image.network(userMessage.messageImage,fit: BoxFit.fill,),
                      ),
                    ):SizedBox(),
                    ReusableText(
                      FromTop: 10,
                      FromRight: 0,
                      FromLeft: 10,
                      FromBottom: 0,
                      TextString: userMessage.message,
                      FontSize: 16,
                      TextFontWeight: FontWeight.w500,
                      TextColor: ColorCollections.WhiteColor,

                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ReusableText(
                            FromTop: 5,
                            FromRight: 10,
                            FromLeft: 60,
                            FromBottom: 0,
                            TextString: formattedDate,
                            FontSize: 14,
                            TextFontWeight: FontWeight.w500,
                            TextColor: ColorCollections.WhiteColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
        ],
      ),

  );
}


Widget chatClicked(String txt,IconData icon,VoidCallback ontap){
   return InkWell(
     onTap:ontap,
     child: Row(
       children: [
         SizedBox(width: 15,),
         Icon(icon,color: Colors.blueGrey,),
         ReusableText(
           FromLeft: 15,
           TextString: txt,
           FontSize: 16,
           TextColor: ColorCollections.WhiteColor,
         ),
       ],
     ),
   );
}



