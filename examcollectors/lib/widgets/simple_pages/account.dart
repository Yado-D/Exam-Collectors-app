import 'dart:ui';

import 'package:examcollectors/Models/UserModels.dart';
import 'package:examcollectors/auth/examFetching.dart';
import 'package:examcollectors/global.dart';
import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:examcollectors/utils/constants.dart';
import 'package:examcollectors/widgets/AllCommonWidget.dart';
import 'package:examcollectors/widgets/pickImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class account_page extends StatefulWidget {
  final Map<String, dynamic>? alpha;
  const account_page({
    this.alpha,
    super.key,
  });

  @override
  State<account_page> createState() => _account_pageState();
}

class _account_pageState extends State<account_page> {
  UserModels? userModels = UserModels(
      userName: "",
      userEmail: "",
      userPassword: "",
      userPhone: "",
      userEducationLevel: "",
      userUniversity: "",
      userType: "",
      userCurrentStatus: "",
      userImage: "");

  bool isUploaded = true;
  @override
  void initState() {
    getUserAllInfo();
    // TODO: implement initState
    super.initState();
  }

  Future<void> getUserAllInfo() async {
    userModels = await Global.storageServices.getData(AppConstants.USERDATA);
    print(userModels!.userEducationLevel);
    print(userModels!.userName);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        leading: Container(
          // color: Colors.blue,
          margin: EdgeInsets.all(15),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
              ),
            ),
          ),
        ),
        title: ReusableText(
          TextString: 'Accounts',
          FontSize: 20,
          FromTop: 24,
          FromLeft: 20,
          TextFontWeight: FontWeight.w900,
          TextColor: ColorCollections.SecondaryColor,
        ),
      ),
      body: Stack(
        children: [
          // const FullPageContainer(),
          Align(
            alignment: AlignmentDirectional(0, -0.97),
            child: Container(
              height: 200,
              width: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF004F59),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 100.0,
              sigmaY: 100.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    userModels!.userImage != ""
                        ? Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(userModels!.userImage),
                            ),
                          )
                        : Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage("assets/Images/defoult.png"),
                            ),
                          ),
                    GestureDetector(
                      // onTap: ()async{
                      //   Uint8List pickImage = await pickedImages(ImageSource.gallery);
                      //   setState(() {
                      //     isUploaded = false;
                      //   });
                      //   String userImage = await  uploadingimage("userProfileImage", pickImage);
                      //       setState(() {
                      //         userModels!.userImage = userImage;
                      //         print(userModels!.userImage);
                      //       });
                      //
                      //     await Global.storageServices.setData(AppConstants.USERDATA, userModels!);
                      //   print(" user image is : ${userModels!.userImage}");
                      //   if(userModels!.userCurrentStatus == "teacher"){
                      //     String res =  await fetchingExams().updateTeacherImage(userModels!.userImage, widget.alpha!['userEmail']);
                      //
                      //   }else{
                      //     String res =  await fetchingExams().updateUserImage(userModels!.userImage, widget.alpha!['userEmail']);
                      //   }
                      //  setState(() {
                      //    isUploaded = true;
                      //  });
                      // },
                      child: ReusableText(
                        TextString: 'Upload a photo',
                        FontSize: 17,
                        TextColor: Colors.blue,
                        TextFontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ColorCollections.TextColor.withOpacity(0.2),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Header
                      Container(
                        padding: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color:
                                  ColorCollections.TextColor.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.person_outline,
                                size: 20, color: ColorCollections.TextColor),
                            SizedBox(width: 8),
                            Text(
                              'Account Information',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorCollections.TextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),

                      // User Details
                      Column(
                        children: [
                          _buildDetailRow('Name', userModels!.userName ?? "-"),
                          SizedBox(height: 10),
                          _buildDetailRow(
                              'Email', userModels!.userEmail ?? "-"),
                          SizedBox(height: 10),
                          _buildDetailRow(
                              'Phone', userModels!.userPhone ?? "-"),
                          SizedBox(height: 10),
                          _buildDetailRow(
                              'Role', userModels!.userCurrentStatus ?? "-"),
                          SizedBox(height: 10),
                          _buildDetailRow(
                              'University', userModels!.userUniversity ?? "-"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (!isUploaded)
            Positioned.fill(
              child: Container(
                color:
                    Colors.black.withOpacity(0.1), // Semi-transparent overlay
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white, // Optional: Customize indicator color
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget accountTexts({
    required String text,
    required String title,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 0, right: 0),
      child: Row(
        children: [
          ReusableText(
            TextString: title,
            FromRight: 40,
            FontSize: 18,
            FromTop: 0,
            FromBottom: 0,
            TextFontWeight: FontWeight.bold,
            TextColor: ColorCollections.SecondaryColor,
          ),
          ReusableText(
            TextString: text,
            FontSize: 18,
            FromTop: 0,
            FromBottom: 0,
            TextFontWeight: FontWeight.w500,
            TextColor: ColorCollections.SecondaryColor,
          ),
        ],
      ),
    );
  }

  // Reusable detail row widget
  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100, // Fixed width for labels
          child: Text(
            '$label :',
            style: TextStyle(
              fontSize: 14,
              color: ColorCollections.TextColor.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: ColorCollections.TextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
