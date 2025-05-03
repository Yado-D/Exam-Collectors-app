import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examcollectors/Models/UserModels.dart';
import 'package:examcollectors/Pages/AskTeacher/chatWithTeacher.dart';
import 'package:examcollectors/Pages/AskTeacher/lookAskedUserList.dart';
import 'package:examcollectors/global.dart';
import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:examcollectors/utils/constants.dart';
import 'package:examcollectors/widgets/AllCommonWidget.dart';

import 'package:flutter/material.dart';

class TeachersProfileView extends StatefulWidget {
  String teacherImage;
  Map<String,dynamic> teacherInfo;
  TeachersProfileView({super.key,required this.teacherImage,required this.teacherInfo,});

  @override
  State<TeachersProfileView> createState() => _TeachersProfileViewState();
}

class _TeachersProfileViewState extends State<TeachersProfileView> {

  UserModels? userData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  Future<void> getUserData()async{
    userData = await Global.storageServices.getData(AppConstants.USERDATA);
    setState(() {

    });
  }
  double _rating = 0;  // Store the rating
  int _maxRating = 5;  // Maximum rating value (5 stars)
  bool _isHalfStar = false;

  // Method to handle when a star is tapped
  void _updateRating(double rating) {
    setState(() {
      _rating = rating;  // Update the rating
    });

    if(widget.teacherInfo['userCurrentStatus']!='teacher'){
      _saveRatingToDatabase(rating);
    }
    // Store the rating in Firestore
  }

  // Save the rating to the database (Firestore)
  Future<void> _saveRatingToDatabase(double rating) async {
    try {

      await FirebaseFirestore.instance.collection('TeacherInfo').doc(widget.teacherInfo['userEmail']).update({
        'badge': widget.teacherInfo['badge']+rating,
      },); // Merge to avoid overwriting other data

      print('Rating saved: $rating');
    } catch (e) {
      print('Error saving rating: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.WhiteColor,
      body:  ListView(
                children: [

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8, bottom: 15),
                        child: IconButton(
                          onPressed: () {
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            } else {
                              Navigator.of(context).pushNamed('/home_page');
                            }
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 23,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.only(top: 30),
                          padding: EdgeInsets.only(top: 250,left: 15,right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                          color: ColorCollections.PageColor,
                        ),
                        child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              ReusableText(
                                  TextString: "Biography",
                                  FontSize: 20,
                                TextFontWeight: FontWeight.w700,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10,bottom: 10),
                                height: 1.5,
                                color: ColorCollections.GreyColor,
                              ),

                              ReusableText(
                                FromTop: 10,
                                TextString: widget.teacherInfo["biography"],
                                FontSize: 18,
                                TextColor: ColorCollections.TextColor,
                                TextFontWeight: FontWeight.w400,
                              ),
                              ReusableText(
                                FromTop: 15,
                                FromBottom: 5,
                                TextString: "Achievements",
                                FontSize: 20,
                                TextFontWeight: FontWeight.w700,
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 10,bottom: 10),
                                height: 1.5,
                                color: ColorCollections.GreyColor,
                              ),
                              Container(
                                height: 700,
                                child: GridView.builder(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,  // Number of columns
                                    crossAxisSpacing: 10, // Spacing between columns
                                    mainAxisSpacing: 10, // Spacing between rows
                                  ),
                                  itemCount: widget.teacherInfo["achievement"]?.length ?? 0, // Safely check for null or empty
                                  itemBuilder: (context, i) {
                                    var achievements = widget.teacherInfo["achievement"] as List<dynamic>?;

                                    // If achievements is null or empty, return an empty widget
                                    if (achievements == null || achievements.isEmpty) {
                                      return SizedBox();
                                    }

                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 4,
                                      child: Center(
                                        child: ReusableText(
                                          TextString: achievements[i] ?? '', // Safely access the achievement item
                                          FontSize: 16,
                                          TextFontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                            ],
                         )
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only( left: 10),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: ColorCollections.WhiteColor,
                                  radius: 40,
                                  child: Image.asset(
                                    "assets/icons/phone-call(1).png",
                                    color: ColorCollections.TextColor,
                                  ),
                                ),
                                ReusableText(
                                  TextString: "Call",
                                  FontSize: 16,
                                  TextFontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          // Middle container
                          Container(
                            margin: EdgeInsets.only(top:0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 80,
                                  backgroundImage: widget.teacherImage=="" ?
                                  AssetImage("assets/Images/defoult.png"):
                                  NetworkImage(widget.teacherImage),
                                  // child: Image.asset(
                                  //   "assets/icons/teacherImage.png",
                                  // ),
                                ),
                                ReusableText(
                                  TextString: widget.teacherInfo["userName"],
                                  FontSize: 20,
                                  TextFontWeight: FontWeight.w700,
                                ),
                                // ReusableText(
                                //   TextString:  widget.teacherInfo["role"],
                                //   FontSize: 16,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ReusableText(
                                      TextString: '${widget.teacherInfo["badge"]}',
                                      FontSize: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                        _maxRating,
                                            (index) => InkWell(
                                          onTap: () {
                                            _updateRating(0.5);  // Full star rating (1 to 5)
                                          },
                                          onLongPress: () {
                                            // Handle half-star rating
                                            _updateRating( 0.5);  // Half star rating (1.5, 2.5, 3.5, etc.)
                                          },
                                          child: Icon(
                                            Icons.star,
                                            size: 18,
                                            color: widget.teacherInfo["badge"] > index
                                                ? Colors.blue// Filled star color
                                                : Colors.black54, // Empty star color
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Third part
                          InkWell(
                            onTap: (){
                              if(widget.teacherInfo['userName']==userData!.userName){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>lookAskedUserList(teacherEmail: widget.teacherInfo['userEmail'],teacherInfo: widget.teacherInfo,)));
                              }else{
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatWithTeacher(teacherImage:widget.teacherImage,teacherInfo: widget.teacherInfo)));
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 20, right: 10),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorCollections.WhiteColor,
                                    radius: 40,
                                    child: Image.asset(
                                      "assets/icons/message-square.png",
                                      color: ColorCollections.TextColor,
                                    ),
                                  ),
                                  ReusableText(
                                    TextString: "Message",
                                    FontSize: 16,
                                    TextFontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),


                ],
      ),
    );
  }
}
