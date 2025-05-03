import 'dart:typed_data';
import 'dart:ui';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Models/UserModels.dart';
import '../../../Models/chatModel.dart';
import '../../../auth/examFetching.dart';
import '../../../global.dart';
import '../../../utils/AppColorCollections.dart';
import '../../../utils/constants.dart';
import '../../../widgets/AllCommonWidget.dart';
import '../../../widgets/pickImages.dart';
import 'chatList.dart';
import 'chat_right_items.dart';

class chatPage extends StatefulWidget {
  const chatPage({super.key});

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  Uint8List? imagePicked;
  TextEditingController _controller = TextEditingController();
  final _scrollController = ScrollController();
  bool _emojiShowing = false;
  TextEditingController emojiEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  UserModels? userModels;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModels = Global.storageServices.getData(AppConstants.USERDATA);
    print(userModels!.userEducationLevel);
    print(userModels!.userName);
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  bool replyMessage = false;
  String? replyedUser = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PageColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.TextColor,
        title: Center(
          child: ReusableText(
            FromLeft: 0,
            TextString: 'Community Chat',
            FontSize: 25,
            TextColor: ColorCollections.WhiteColor,
          ),
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            FutureBuilder(
              future: fetchingExams().fetchAllMessages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No messages found'));
                }
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 70),
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final snap = snapshot.data!;
                          print(snap[index].userName);
                          return InkWell(
                              onTap: () {
                                showDialogPage(context, snap[index].messageId,
                                    snap[index]);
                              },
                              child: snapshot.data![index].userName ==
                                      userModels!.userName
                                  ? ChatRightItems(
                                      userMessage: snap[index],
                                      context: context)
                                  : ChatLeftItems(
                                      userMessage: snap[index],
                                      context: context));
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 60,
                      child: IconButton(
                        onPressed: () => _scrollToBottom(),
                        icon: Icon(
                          Icons.arrow_downward_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
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
                        color: Colors.black54,
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
                            await fetchingExams().PostCommunityChat(
                                message: _controller.text,
                                userName: userModels!.userName ?? " ",
                                userImage: userModels!.userImage ?? "",
                                messageImage: imagePicked);
                            setState(() {
                              chatList.add(_controller.text);
                              _controller.clear();
                              replyMessage = false;
                            });
                            setState(() {
                              imagePicked = null;
                            });
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
      ),
    );
  }

  void showDialogPage(BuildContext context, String messageId, Message snap) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          width: 100,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pop(); // Dismiss the dialog when tapped outside
            },
            child: Opacity(
              opacity: 1, // Adjust opacity to make the background interactive
              child: Material(
                color: Colors.transparent, // Make sure the color is transparent
                child: Center(
                  child: SimpleDialog(
                    alignment: Alignment.centerRight,
                    backgroundColor: Colors.black,
                    surfaceTintColor: Colors.grey,
                    children: [
                      Column(
                        children: [
                          chatClicked("Reply", Icons.reply, () {
                            setState(() {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (mounted) {
                                  focusNode.requestFocus();
                                }
                              });
                              replyMessage = true;
                              replyedUser = snap.userName;
                            });
                            print("replyed");

                            Navigator.pop(context);
                          }),
                          SizedBox(
                            height: 4,
                          ),
                          chatClicked("Copy", Icons.copy, () {
                            print("copied");
                            Navigator.pop(context);
                          }),
                          SizedBox(
                            height: 4,
                          ),
                          snap.userName == userModels!.userName
                              ? chatClicked("Delete", Icons.delete, () async {
                                  print("delete");
                                  await fetchingExams()
                                      .deleteCommunityChatMessage(messageId);
                                  Navigator.pop(context);
                                  setState(() {});
                                })
                              : SizedBox(),
                          SizedBox(
                            height: 4,
                          ),
                          chatClicked("Report", Icons.report, () {
                            print("reported");
                            Navigator.pop(context);
                          }),
                          SizedBox(
                            height: 4,
                          ),
                          chatClicked("Translate", Icons.translate, () {
                            print("translated");
                            Navigator.pop(context);
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
