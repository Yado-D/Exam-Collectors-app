
import 'package:examcollectors/Pages/AskTeacher/teacherProfileView.dart';
import 'package:examcollectors/auth/examFetching.dart';
import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:examcollectors/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';

class AskTeacher extends StatefulWidget {
  const AskTeacher({super.key});

  @override
  State<AskTeacher> createState() => _AskTeacherState();
}

class _AskTeacherState extends State<AskTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: SimpleAppBars(context, 'Ask Teacher'),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 5),
            child: FittedBox(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: Center(
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/icons/teacherImage.png",
                          color: ColorCollections.WhiteColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, ),
                    height: 45,
                    child: reusableTextField(
                      widthOfTextField: 200,
                      WidthOfContainer: 260,
                      FromTop: 0,
                      FromBottom: 0,
                      icon_name: "search",
                      hintText: 'Search Teachers',
                      textType: 'textType',
                      onchange: (onchange) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          ReusableText(
            FromLeft: 15,
            FromTop: 15,
            TextString: 'Available Assistance Teachers',
            FontSize: 18,
            TextColor: Colors.black87,
            TextFontWeight: FontWeight.w700,
          ),
          SizedBox(height: 20),

          //available teachers

          FutureBuilder(
            future: fetchingExams().fetchTeacherInfo(),
            builder: (context,snap){
               if(snap.connectionState == ConnectionState.waiting){
                 return Center(child: CircularProgressIndicator(),);
               }
               if(snap.hasError){
                 return Center(
                   child: ReusableText(
                       TextString: "Something went wrong please check your internet connection",
                       FontSize: 20,
                   ),
                 );
               }
              return Flexible(
                child: ListView.builder(
                  itemCount: snap.data!.length?? 0,
                  itemBuilder: (context, index) {
                    String teacherImage = snap.data![index]["userImage"];
                    String teacherName = snap.data![index]["userName"];

                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>TeachersProfileView(teacherImage:teacherImage,teacherInfo:snap.data![index],)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: teacherImage=="" ?
                              AssetImage("assets/Images/defoult.png"):
                              NetworkImage(teacherImage),
                              // child: Image.network(teacherImage,fit:BoxFit.fill),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(
                                  FromLeft: 30,
                                  TextFontWeight: FontWeight.w500,
                                  TextString: teacherName,
                                  FontSize: 18,
                                ),
                                Container(
                                  height: 1,
                                  width: 250,
                                  color: ColorCollections.GreyColor,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          // SizedBox(height: 100),
        ],
      ),
    );
  }
}
