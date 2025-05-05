// import 'dart:typed_data';
//
// import 'package:examcollectorsadminapp/auth/firebaseExamPostingAuth.dart';
// import 'package:examcollectorsadminapp/auth/uploadingImage.dart';
// import 'package:examcollectorsadminapp/models/answer_model.dart';
// import 'package:examcollectorsadminapp/pages/NewPostPage/page/PostQuestions/widgets/all_post_page_widget.dart';
// import 'package:examcollectorsadminapp/utils/AppColorCollections.dart';
// import 'package:examcollectorsadminapp/utils/pickImages.dart';
// import 'package:examcollectorsadminapp/widgets/allCommonWidgets.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class postExamImagePage extends StatefulWidget {
//   String subjectName;
//   String universityName;
//   String year;
//   String department;
//
//   postExamImagePage({
//     super.key,
//     required this.subjectName,
//     required this.universityName,
//     required this.year,
//     required this.department,
//   });
//
//   @override
//   State<postExamImagePage> createState() => _postExamImagePageState();
// }
//
// class _postExamImagePageState extends State<postExamImagePage> {
//   Uint8List? examImage;
//   List<Uint8List?> images = [];
//   List<answerModel> ExamAnswer = [];
//   answerModel aModel = answerModel(txt: '', videoLink: '', image: null); // Initialized
//
//   @override
//   void initState() {
//     super.initState();
//     print(widget.subjectName);
//     print(widget.universityName);
//     print(widget.year);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: SimpleAppBars(context, true, 'Select Image'),
//       backgroundColor: ColorCollections.PageColor,
//       body: ListView(
//         children: [
//           Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(right: 15),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: ColorCollections.TeritiaryColor,
//                       ),
//                       child: Row(
//                         children: [
//                           Center(
//                             child: ReusableText(
//                               TextString: "Exam Question",
//                               FontSize: 20,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () async {
//                               final image = await pickedImages(ImageSource.gallery);
//                               if (image != null) {
//                                 setState(() {
//                                   images.add(image);
//                                 });
//                               }
//                             },
//                             icon: Icon(Icons.add_a_photo, color: ColorCollections.WhiteColor),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   margin: const EdgeInsets.all(10),
//                   height: 300,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: ColorCollections.GreyColor,
//                   ),
//                   child: images.isNotEmpty
//                       ? ListView.builder(
//                     itemCount: images.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: const EdgeInsets.all(10),
//                         height: 100,
//                         color: ColorCollections.WhiteColor,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Image.memory(images[index]!, height: 70, width: 80),
//                             IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   images.removeAt(index);
//                                 });
//                               },
//                               icon: const Icon(Icons.delete),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   )
//                       : const Center(
//                     child: Icon(
//                       Icons.add_a_photo,
//                       size: 60,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//
//                 // Section for adding answers
//
//                 Center(child: ReusableText(TextString: "Answer field", FontSize: 20)),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(right: 15),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: ColorCollections.TeritiaryColor,
//                       ),
//                       child: Row(
//                         children: [
//                           Center(
//                             child: ReusableText(
//                               TextString: "Exam Answer",
//                               FontSize: 20,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () async {
//                               final image = await pickedImages(ImageSource.gallery);
//                               if (image != null) {
//                                 String url = await uploadingimage('product', image);
//                                 setState(() {
//
//                                   aModel.image = url;
//                                 });
//                               }
//                             },
//                             icon: Icon(Icons.add_a_photo, color: ColorCollections.WhiteColor),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Center(
//                   child: PostReusableTextField(
//                       FromTop: 10,
//
//                       FromRight: 0,
//                       context: context,
//                       icon_name: 'edit',
//                       hintText: 'Add answer video',
//                       textType: 'text',
//                       onchange: (onchange){
//                         print(onchange);
//                         setState(() {
//                           aModel.videoLink = onchange;
//                         });
//                       }
//                   ),
//                 ),
//
//                Center(
//                  child: PostReusableTextField(
//                    FromTop: 10,
//
//                    FromRight: 0,
//                    context: context,
//                    icon_name: 'edit',
//                    hintText: 'Add answer text',
//                    textType: 'text',
//                    onchange: (onchange){
//                      print(onchange);
//                      setState(() {
//                        aModel.txt = onchange;
//                      });
//                    }
//                  ),
//                ),
//
//                 Center(
//                   child: MaterialButton(
//                     color: ColorCollections.WhiteColor,
//                     onPressed: () {
//                       if (aModel.image != null && aModel.txt.isNotEmpty && aModel.videoLink.isNotEmpty) {
//                         setState(() {
//                           print(aModel.image);
//                           print(aModel.videoLink);
//                           ExamAnswer.add(aModel);
//                           aModel = answerModel(txt: '', videoLink: '', image: null); // Reset after adding
//                         });
//                       }
//                     },
//                     child: ReusableText(TextString: 'Add', FontSize: 20),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.all(10),
//                   height: 300,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: ColorCollections.GreyColor,
//                   ),
//                   child: ExamAnswer.isNotEmpty
//                       ? ListView.builder(
//                     itemCount: ExamAnswer.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: const EdgeInsets.all(10),
//                         height: 100,
//                         color: ColorCollections.WhiteColor,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Image.network(ExamAnswer[index].image!, height: 70, width: 80),
//                             IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   ExamAnswer.removeAt(index);
//                                 });
//                               },
//                               icon: const Icon(Icons.delete),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   )
//                       : const Center(
//                     child: Icon(
//                       Icons.add_a_photo,
//                       size: 60,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//
//                 // Submit and cancel buttons
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Center(
//                         child: Container(
//                           margin: const EdgeInsets.only(right: 30),
//                           height: 50,
//                           width: 130,
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                 blurRadius: 7,
//                                 offset: const Offset(5, 5),
//                                 color: ColorCollections.TeritiaryColor,
//                                 blurStyle: BlurStyle.inner,
//                               ),
//                             ],
//                             color: Colors.green,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: ReusableText(
//                               TextString: 'Cancel',
//                               FontSize: 20,
//                               TextColor: ColorCollections.WhiteColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () async {
//                         if (images.isNotEmpty) {
//                           String res = await AuthMethod().PostQuestionsToFireaseDatabase(
//                             subjectName: widget.subjectName,
//                             universityName: widget.universityName,
//                             year: int.parse(widget.year),
//                             ExamImage: images,
//                             department: widget.department,
//                             aModel: ExamAnswer,
//                           );
//                           print(res);
//                           if (res == "SuccessFully Posted") {
//                             Navigator.of(context).pushNamed('/result_page');
//                             print("$res posted");
//                           }
//                         } else {
//                           print("No image selected");
//                         }
//                       },
//                       child: Center(
//                         child: Container(
//                           margin: const EdgeInsets.only(right: 30),
//                           height: 50,
//                           width: 130,
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                 blurRadius: 7,
//                                 offset: const Offset(5, 5),
//                                 color: ColorCollections.TeritiaryColor,
//                                 blurStyle: BlurStyle.inner,
//                               ),
//                             ],
//                             color: Colors.red.shade700,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: ReusableText(
//                               TextString: 'SUBMIT',
//                               FontSize: 20,
//                               TextColor: ColorCollections.WhiteColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
