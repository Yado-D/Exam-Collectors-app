// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

import 'dart:typed_data';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:examcollectors/Models/UserModels.dart';
import 'package:examcollectors/Pages/chatPage/pages/chatList.dart';
import 'package:examcollectors/Pages/chatPage/pages/chat_right_items.dart';
import 'package:examcollectors/auth/examFetching.dart';
import 'package:examcollectors/global.dart';
import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:examcollectors/utils/constants.dart';
import 'package:examcollectors/widgets/AllCommonWidget.dart';
import 'package:examcollectors/widgets/CommonSnackBar.dart';
import 'package:examcollectors/widgets/pickImages.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ChatWithTeacher extends StatefulWidget {
  String teacherImage;
  String? userName;
  String? userEmail;
  Map<String, dynamic> teacherInfo;
  ChatWithTeacher(
      {super.key,
      this.userEmail,
      required this.teacherImage,
      required this.teacherInfo,
      this.userName});

  @override
  State<ChatWithTeacher> createState() => _ChatWithTeacherState();
}

class _ChatWithTeacherState extends State<ChatWithTeacher> {
  Uint8List? imagePicked;
  TextEditingController _controller = TextEditingController();
  final _scrollController = ScrollController();
  bool _emojiShowing = false;
  TextEditingController emojiEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  UserModels? userModels;
  bool replyMessage = false;
  String? replyedUser = '';
  String? _teacherAnswer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModels = Global.storageServices.getData(AppConstants.USERDATA);
    print(userModels!.userEducationLevel);
    print(userModels!.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorCollections.PageColor,
        appBar: AppBar(
          leading: Container(
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
                color: Color(0xFF003540),
              ),
            ),
          ),
          backgroundColor: ColorCollections.PageColor,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color.fromARGB(255, 203, 203, 203),
                  width: 1.0,
                ),
              ),
            ),
            height: 120,
            padding: EdgeInsets.only(top: 40, left: 70, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CircleAvatar(
                //   radius: 20,
                //   // backgroundImage: NetworkImage(widget.teacherImage),
                //   // child: Image.asset("assets/icons/teacherImage.png",),
                // ),
                Center(
                  child: FittedBox(
                    child: ReusableText(
                      FromLeft: 20,
                      TextString: widget.userName ??
                          widget.teacherInfo["userName"] ??
                          "",
                      FontSize: 18,
                      TextColor: Color(0xFF003540),
                      TextFontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              //fetch the chat with teacher
              FutureBuilder<List<Map<String, dynamic>>?>(
                future: fetchingExams().fetchChatWithTeacher(
                    widget.userEmail ?? userModels!.userEmail),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return Center(
                        child: Text(
                            'Be Respectful When You Communicate with Your Teacher.'));
                  } else {
                    List<Map<String, dynamic>>? data = snapshot.data;

                    // Find all matched questions
                    Map<String, dynamic>? matchedElm;
                    for (int i = 0; i < data!.length; i++) {
                      if (widget.userName != "" && widget.userName != null) {
                        if (data[i]['teacherEmail'] ==
                                widget.teacherInfo['userEmail'] &&
                            data[i]['stuName'] == widget.userName) {
                          matchedElm = data[0];
                          print(data[i]);
                        } else {
                          print(widget.userName);
                          print("username are not matched");
                        }
                      } else {
                        print("----------${widget.userName}");
                        matchedElm = data[0];
                        print(data[i]);
                      }
                      print("${data[i]}--not matched data");
                    }

                    Map<String, dynamic>? firstQuestion =
                        matchedElm != null ? matchedElm : null;
                    String studentAsk = '';
                    String teacherAns = '';
                    // print("this is selected map : ${matchedQuestions.first}");

                    if (firstQuestion != null) {
                      studentAsk = firstQuestion['studentAsk'] ?? '';
                      print("$studentAsk -- student ask");

                      teacherAns = firstQuestion['teacherAns'] == null ||
                              firstQuestion['teacherAns'] == ''
                          ? ''
                          : firstQuestion['teacherAns'];

                      _teacherAnswer = firstQuestion['teacherAns'];
                    } else {
                      print("No matching questions found.");
                    }

                    return ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 2.w, left: 2.w, right: 2.w, bottom: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              studentAsk.isNotEmpty
                                  ? ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minHeight: 40.w,
                                        minWidth: 130,
                                        maxWidth: 230.w,
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 10.w, top: 0.w),
                                        padding: EdgeInsets.only(
                                            bottom: 10.w, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade400,
                                          borderRadius:
                                              BorderRadius.circular(10.w),
                                        ),
                                        child: ReusableText(
                                          TextColor:
                                              ColorCollections.WhiteColor,
                                          FromTop: 10,
                                          FromRight: 0,
                                          FromLeft: 10,
                                          FromBottom: 0,
                                          TextString: studentAsk,
                                          FontSize: 16,
                                          TextFontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        teacherAns != ""
                            ? Container(
                                padding: EdgeInsets.only(
                                    top: 2.w,
                                    left: 2.w,
                                    right: 2.w,
                                    bottom: 10.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minHeight: 40.w,
                                        minWidth: 130,
                                        maxWidth: 230.w,
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 10.w, top: 0.w),
                                        padding: EdgeInsets.only(
                                            bottom: 10.w, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(10.w),
                                        ),
                                        child: ReusableText(
                                          TextColor:
                                              ColorCollections.WhiteColor,
                                          FromTop: 10,
                                          FromRight: 0,
                                          FromLeft: 10,
                                          FromBottom: 0,
                                          TextString: teacherAns,
                                          FontSize: 16,
                                          TextFontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ],
                    );
                  }
                },
              ),

              Positioned(
                bottom: 0.h,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (replyMessage)
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                          color: ColorCollections.TextColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                chatClicked(
                                    "Reply to ${replyedUser}", Icons.reply, () {
                                  print("copied");
                                  // Navigator.pop(context);
                                }),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      replyMessage = false;
                                    });
                                  },
                                  icon: Icon(Icons.cancel),
                                  color: ColorCollections.WhiteColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    if (imagePicked != null)
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 100.h),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorCollections.GreyColor,
                            image: DecorationImage(
                              image: MemoryImage(imagePicked!),
                            ),
                          ),
                        ),
                      ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorCollections.TextColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _emojiShowing = !_emojiShowing;
                              });
                            },
                            icon: Icon(
                              Icons.emoji_emotions,
                              size: 30.w,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              final image =
                                  await pickedImages(ImageSource.gallery);
                              setState(() {
                                imagePicked = image;
                              });
                            },
                            icon: Icon(
                              Icons.photo_outlined,
                              size: 30.w,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            width: 186.w,
                            height: 50.h,
                            child: TextField(
                              focusNode: focusNode,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.multiline,
                              maxLines: 3,
                              controller: _controller,
                              autofocus: false,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 214, 213, 213),
                                ),
                                hintText: "Send messages...",
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              print("this is user name : " +
                                  userModels!.userEmail);
                              if (_teacherAnswer == null &&
                                  widget.userName == null) {
                                // print("this is user email : " + userModels!.userEmail);
                                String res = await fetchingExams()
                                    .chatWithTeacher(
                                        message: _controller.text,
                                        userEmail: userModels!.userEmail,
                                        teacherEmail:
                                            widget.teacherInfo["userEmail"],
                                        userName: userModels!.userName);
                                print(res);
                                setState(() {
                                  chatList.add(_controller.text);
                                  _controller.clear();
                                  replyMessage = false;
                                });
                                setState(() {
                                  imagePicked = null;
                                });
                              } else if (widget.userName != null) {
                                await fetchingExams().teacherChatWithStu(
                                  message: _controller.text,
                                  userEmail: userModels!.userEmail,
                                  teacherEmail: widget.teacherInfo["userEmail"],
                                );
                                print("in teacher part");
                              } else {
                                commonSnackBar(
                                    context,
                                    'Before sending any other message please wait untill the teacher replys you',
                                    ColorCollections.WhiteColor,
                                    ColorCollections.TextColor.withOpacity(
                                        0.7));
                              }
                            },
                            icon: Icon(
                              Icons.send,
                              color: ColorCollections.PrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Offstage(
                      offstage: !_emojiShowing,
                      child: SizedBox(
                        height: 250.h,
                        child: EmojiPicker(
                          onEmojiSelected: (Category? category, Emoji emoji) {
                            // Do something when emoji is tapped (optional)
                          },
                          onBackspacePressed: () {
                            // Do something when the user taps the backspace button (optional)
                          },
                          textEditingController: _controller,
                          config: Config(
                            height: 250.h,
                            checkPlatformCompatibility: true,
                            viewOrderConfig: ViewOrderConfig(),
                            emojiViewConfig: EmojiViewConfig(
                              emojiSizeMax: 28,
                            ),
                            skinToneConfig: SkinToneConfig(),
                            categoryViewConfig: CategoryViewConfig(),
                            bottomActionBarConfig: BottomActionBarConfig(),
                            searchViewConfig: SearchViewConfig(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
