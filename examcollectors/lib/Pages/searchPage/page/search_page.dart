
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/examFetching.dart';
import '../../../utils/AppColorCollections.dart';
import '../../../widgets/AllCommonWidget.dart';

class search_page extends StatefulWidget {
  const search_page({super.key});

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  Future<List<String>>? courseName;
  String? searchCourse;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   courseName =  fetchingExams().getCourseNames();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7F6F2),
      body: Container(
        // margin: EdgeInsets.only(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF003540),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    30,
                  ),
                  bottomRight: Radius.circular(
                    30,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableTextField(
                    FromTop: 70.sp,
                    FromLeft: 40.sp,
                    WidthOfContainer: 260.w,
                    widthOfTextField: 200.w,
                    icon_name: 'search',
                    hintText: 'type course name to search',
                    textType: 'course',
                    onchange: (value) {
                      setState(() {
                        searchCourse = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            ReusableText(
              TextString: 'Recent Search',
              FontSize: 25,
              FromTop: 30,
              FromLeft: 30,
              TextFontWeight: FontWeight.w700,
              TextColor: ColorCollections.TextColor ,
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
                future: courseName,
                builder: (context,snap){
               if(snap.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
               }
              else if(snap.hasError){
                 return Center(child: ReusableText(TextString: 'Some Error happened. please try again', FontSize: 16),);

               }
               else if(snap.hasData){
                 if(searchCourse==null){
                   return Center(
                     child: ReusableText(
                         TextString: "You can Search Courses that available in our app.",
                         FontSize: 17,
                         TextColor: ColorCollections.TextColor,
                     ),
                   );
                 }
                else if(snap.data!.any((test) => test == searchCourse) && searchCourse!=null){
                   return Container(
                     margin: EdgeInsets.all(10),
                     height: 50,
                     width:MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       color: ColorCollections.WhiteColor,
                       border: Border.all(color: ColorCollections.WhiteColor),
                     ),
                     child: ReusableText(
                         FromLeft: 20,
                         FromRight: 10,
                         TextString: searchCourse??"",
                         FontSize: 18,
                         TextFontWeight: FontWeight.w500,
                     ),
                   );
                 }else{
                   return Center(
                     child: ReusableText(
                       TextString: "sorry,No course available by \"$searchCourse\" name.",
                       FontSize: 16),
                   );
                 }
               }
               return Center(
                 child: ReusableText(
                     TextString: "Something Unexpected occured.please try again later",
                    FontSize: 16),
               );

            }),
          ],
        ),
      ),
    );
  }
}
