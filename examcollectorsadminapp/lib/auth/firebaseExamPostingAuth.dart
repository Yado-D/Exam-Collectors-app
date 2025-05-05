import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examcollectorsadminapp/auth/uploadingImage.dart';
import 'package:examcollectorsadminapp/models/answer_model.dart';
import 'package:uuid/uuid.dart';

class AuthMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<String> PostQuestionsToFireaseDatabase({
    required String university,
    required String department,
    required String courseName,
    required String year,
    required String examType,
    required examTime,
    required String questions,
  }) async {
    String res = "Some error occured";
    try {
      print({
        "subjectName": courseName,
        // "ExamImage": ExamImage.map((image) => image?.toList()).toList(),
        "year": year,
        "universityName": university,
        "department": department,
      });
      final examRef =
          FirebaseFirestore.instance.collection('Exams').doc("7253ExamId");

      // 2. Create all parent documents explicitly with a dummy field
      await examRef
          .set({'_exists': true, 'createdAt': FieldValue.serverTimestamp()});

      final universityRef = examRef.collection('University').doc(university);
      await universityRef.set({'_exists': true, 'name': university});

      final departmentRef =
          universityRef.collection('Department').doc(department);
      await departmentRef.set({'_exists': true, 'name': department});

      final subjectRef = departmentRef.collection('Subjects').doc(courseName);
      await subjectRef.set({'_exists': true, 'name': courseName});

      final yearRef = subjectRef.collection('Year').doc(year);
      await yearRef.set({'_exists': true, 'year': year});

      // 3. Finally create the exam document with actual data
      final dynamicList = jsonDecode(questions) as List;

      // Step 2: Cast each item to Map<String, dynamic>
      dynamicList.map((item) => item as Map<String, dynamic>).toList();
      await yearRef.collection('ExamType').doc(examType).set({
        'examTime': examTime,
        'questions': dynamicList,
        'createdAt': FieldValue.serverTimestamp(),
      });
      res = "Posted";
      return res;
    } catch (e) {
      res = "Error posting : ${e.toString()}";
      return res;
    }
  }

  //post carousel images

  Future<String> carouselImagePost(
      {required List<String> carouselImage}) async {
    try {
      // String uuid = Uuid().v1();
      final result =
          await _firestore.collection('CarouselImage').doc("Image").set({
        'carouselImage': carouselImage,
      });
      return 'successfull';
    } catch (e) {
      return e.toString();
    }
  }
}
