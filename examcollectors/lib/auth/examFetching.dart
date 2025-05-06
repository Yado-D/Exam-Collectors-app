import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examcollectors/Models/chatModel.dart';

import 'package:uuid/uuid.dart';

class fetchingExams {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //fetch universities

  static Future<List<String>> fetchUniversities() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("Exams")
          .doc("7253ExamId")
          .collection("University")
          .get();

      snapshot.docs.forEach((doc) {
        print("Document ID for universities are : ${doc.id}");
      });
      return snapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  //fetch Departments

  static Future<List<String>> fetchDepartments(String university) async {
    try {
      QuerySnapshot departmentSnapshot = await FirebaseFirestore.instance
          .collection('Exams')
          .doc("7253ExamId")
          .collection("University")
          .doc(university)
          .collection("Department")
          .get();
      departmentSnapshot.docs.forEach((doc) {
        print("Document ID for departments are : ${doc.id}");
      });
      return departmentSnapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      print('Error fetching departments: $e');
      return [];
    }
  }

  //fetch subjects

  static Future<List<String>> fetchCourses(
      String university, String department) async {
    try {
      QuerySnapshot courseSnapshot = await FirebaseFirestore.instance
          .collection('Exams')
          .doc("7253ExamId")
          .collection("University")
          .doc(university)
          .collection("Department")
          .doc(department)
          .collection("Subjects")
          .get();

      return courseSnapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      print('Error fetching courses: $e');
      return [];
    }
  }

  //fetch year

  static Future<List<int>> fetchYears(
      String university, String department, String subject) async {
    try {
      QuerySnapshot yearSnapshot = await FirebaseFirestore.instance
          .collection('Exams')
          .doc("7253ExamId")
          .collection("University")
          .doc(university)
          .collection("Department")
          .doc(department)
          .collection("Subjects")
          .doc(subject)
          .collection("Year")
          .get();

      return yearSnapshot.docs.map((doc) => int.parse(doc.id)).toList();
    } catch (e) {
      print('Error fetching years: $e');
      return [];
    }
  }

  //fetch examType

  //fetch year

  static Future<List<String>> fetchExamType(
      String university, String department, String subject, String year) async {
    try {
      QuerySnapshot examTypeSnapshot = await FirebaseFirestore.instance
          .collection('Exams')
          .doc("7253ExamId")
          .collection("University")
          .doc(university)
          .collection("Department")
          .doc(department)
          .collection("Subjects")
          .doc(subject)
          .collection("Year")
          .doc(year)
          .collection("ExamType")
          .get();

      return examTypeSnapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      print('Error fetching years: $e');
      return [];
    }
  }

  //fetch exam questions

  static Future<List<Map<String, dynamic>>> fetchExamQuestions(
      String university,
      String department,
      String subject,
      String year,
      String examType) async {
    try {
      DocumentSnapshot examTypeSnapshot = await FirebaseFirestore.instance
          .collection('Exams')
          .doc("7253ExamId")
          .collection("University")
          .doc(university)
          .collection("Department")
          .doc(department)
          .collection("Subjects")
          .doc(subject)
          .collection("Year")
          .doc(year)
          .collection("ExamType")
          .doc(examType)
          .get();

      return (examTypeSnapshot["questions"] as List<dynamic>)
          .map((item) => item as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error fetching years: $e');
      return [];
    }
  }

  //fetch examTime

  static Future<String> fetchExamTime(String university, String department,
      String subject, String year, String examType) async {
    try {
      DocumentSnapshot examTypeSnapshot = await FirebaseFirestore.instance
          .collection('Exams')
          .doc("7253ExamId")
          .collection("University")
          .doc(university)
          .collection("Department")
          .doc(department)
          .collection("Subjects")
          .doc(subject)
          .collection("Year")
          .doc(year)
          .collection("ExamType")
          .doc(examType)
          .get();

      return (examTypeSnapshot["examTime"] as String);
    } catch (e) {
      print('Error fetching years: $e');
      return '';
    }
  }

  //update user photos

  Future<String> updateUserImage(String userImage, String userEmail) async {
    try {
      print(userEmail);
      print("check :  1");
      final snapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(userEmail)
          .update({
        'userImage': userImage,
      });
      print("success");
      return "success";
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  //update user photos

  Future<String> updateTeacherImage(String userImage, String userEmail) async {
    try {
      print(userEmail);
      print("check :  1");
      final snapshot = await FirebaseFirestore.instance
          .collection("TeacherInfo")
          .doc(userEmail)
          .update({
        'userImage': userImage,
      });
      print("success");
      return "success";
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  //fetch carousel slider image

  Future<List> GetCarouselImage() async {
    try {
      // Initialize an empty list to store image URLs
      List carouselImage = [];

      // Fetch documents from the 'CarouselImage' Firestore collection
      final result =
          await _firestore.collection('CarouselImage').doc('Image').get();

      // Iterate through the documents and add their IDs to the list

      Map<String, dynamic> imageId = result.data()!;
      print("$imageId  +++++++++");
      carouselImage = imageId['carouselImage'];

      return carouselImage;
    } catch (e) {
      // Log the error and return an empty list
      print("Error fetching carousel images: $e");
      return [];
    }
  }

//fetch the course

  Future<List<String>> getCourseNames() async {
    List<String> courseNames = [];

    try {
      // Reference to the 'Exams' collection -> 'University' subcollection
      var universityCollection = FirebaseFirestore.instance
          .collection("Exams")
          .doc("7253ExamId") // Make sure to use the appropriate exam ID
          .collection("University");

      // Fetch all universities
      var universitySnapshot = await universityCollection.get();

      // Iterate through each university document
      for (var universityDoc in universitySnapshot.docs) {
        String universityName =
            universityDoc.id; // University name is the document ID

        // Reference to the 'Subject' subcollection of the current university
        var subjectCollection = universityDoc.reference.collection("Subject");

        // Fetch all subject (course) documents for the current university
        var subjectSnapshot = await subjectCollection.get();

        // Iterate through each subject document and add the subject name to the list
        for (var subjectDoc in subjectSnapshot.docs) {
          String subjectName =
              subjectDoc.id; // Assuming the subject name is the document ID
          courseNames.add(subjectName);
        }
      }
    } catch (e) {
      print("Error fetching course names: $e");
    }

    return courseNames;
  }

  //deleting a post message

  Future<void> deleteCommunityChatMessage(String messageId) async {
    final _firestore = FirebaseFirestore.instance;

    try {
      await _firestore.collection('CommunityChat').doc(messageId).delete();
      print("Message successfully deleted");
    } catch (e) {
      print('Error deleting community chat message: $e');
    }
  }

  // post the chat page

  Future<void> PostCommunityChat({
    required String message,
    Uint8List? messageImage,
    required String userName,
    required String userImage,
    String? replyToMessageId,
  }) async {
    final _firestore = FirebaseFirestore.instance;
    String messageImageUrl = "";
    // String userImageUrl = "";

    try {
      // Upload message image if provided
      // if (messageImage != null) {
      //   messageImageUrl = await uploadingimage( 'message_images',messageImage);
      // }

      // Upload user image if provided

      // Generate a unique ID for the message
      String messageId = const Uuid().v1();

      // Prepare message data
      Map<String, dynamic> messageData = {
        'messageId': messageId,
        'message': message,
        'messageImage': messageImageUrl,
        'userName': userName,
        'userImage': userImage,
        'timestamp': FieldValue.serverTimestamp(),
        "replyToMessage": replyToMessageId,
      };

      // Add reply information if provided
      if (replyToMessageId != null) {
        messageData['replyToMessageId'] = replyToMessageId;
      }

      // Post message to Firestore
      await _firestore
          .collection('CommunityChat')
          .doc(messageId)
          .set(messageData);
      print("Successfull");
    } catch (e) {
      print('Error posting community chat message: $e');
    }
  }

  //fetching user posts

  Future<List<Message>> fetchAllMessages() async {
    final _firestore = FirebaseFirestore.instance;
    List<Message> messageList = [];

    try {
      // Fetch the documents from Firestore
      QuerySnapshot snapshot = await _firestore
          .collection('CommunityChat')
          .orderBy('timestamp', descending: false)
          .get();

      // Convert each document to a Message object and add to the list
      snapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        messageList.add(Message.fromJson(data));
      });

      return messageList;
    } catch (e) {
      print('Error fetching messages: $e');
      return [];
    }
  }

// Post a note - creates/updates individual documents
  Future<void> postNote({
    required String title,
    required String userEmail,
    required String userNote,
  }) async {
    try {
      await _firestore
          .collection("Users")
          .doc(userEmail)
          .collection('UserNotes')
          .doc() // Auto-generate ID
          .set({
        'title': title,
        'content': userNote,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      print("posted");
    } catch (e) {
      print('Error posting note: $e');
    }
  }

// Delete a specific note
  Future<void> deleteNote({
    required String userEmail,
    required String noteId, // Pass document ID instead of content
  }) async {
    try {
      await _firestore
          .collection("Users")
          .doc(userEmail)
          .collection('UserNotes')
          .doc(noteId)
          .delete();
    } catch (e) {
      print('Error deleting note: $e');
    }
  }

// Get all notes (properly ordered)
  Future<List<Map<String, dynamic>>> getNotes(String userEmail) async {
    final snapshot = await _firestore
        .collection("Users")
        .doc(userEmail)
        .collection('UserNotes')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => {
              'id': doc.id,
              ...doc.data(),
            })
        .toList();
  }

//fetch opportunity data

  Future<List<Map<String, dynamic>>> fetchOpportunity() async {
    try {
      // Fetch the document containing opportunities
      DocumentSnapshot<Map<String, dynamic>> res =
          await _firestore.collection("opportunity").doc("opportunity").get();

      // Check if the document exists
      if (res.exists) {
        final data = res.data();

        // Ensure 'opp' key exists and is a list
        if (data != null && data['opp'] is List) {
          // Cast 'opp' to a list of maps
          List<Map<String, dynamic>> opportunities =
              List<Map<String, dynamic>>.from(data['opp']);
          print("Fetched opportunities: $opportunities");
          return opportunities;
        } else {
          print("Key 'opp' is missing or not a list.");
        }
      } else {
        print("Document does not exist.");
      }

      // Return an empty list if no opportunities are found
      return [];
    } catch (e) {
      print("Error fetching opportunities: $e");
      return [];
    }
  }

  //fetch opportunity data

  Future<List<Map<String, dynamic>>> fetchResources() async {
    try {
      // Fetch the document containing opportunities
      DocumentSnapshot<Map<String, dynamic>> res =
          await _firestore.collection("Resources").doc("resources").get();

      // Check if the document exists
      if (res.exists) {
        final data = res.data();

        // Ensure 'opp' key exists and is a list
        if (data != null && data['res'] is List) {
          // Cast 'opp' to a list of maps
          List<Map<String, dynamic>> resources =
              List<Map<String, dynamic>>.from(data['res']);
          print("Fetched Resources: $resources");
          return resources;
        } else {
          print("Key 'res' is missing or not a list.");
        }
      } else {
        print("Document does not exist.");
      }
      // Return an empty list if no opportunities are found
      return [];
    } catch (e) {
      print("Error fetching Resources: $e");
      return [];
    }
  }

//get user notes

  Future<List<Map<String, dynamic>>> GetPostNotes({
    required String userEmail,
  }) async {
    try {
      final querySnapshot = await _firestore
          .collection("Users")
          .doc(userEmail)
          .collection('UserNotes')
          .get();

      return querySnapshot.docs.map((doc) {
        return {
          'id': doc.id, // Include document ID
          ...doc.data(), // Spread all document fields
        };
      }).toList();
    } catch (e) {
      print('Error fetching notes: $e');
      return []; // Return empty list instead of map
    }
  }

  //teacher chat with student

  Future<void> teacherChatWithStu({
    required String message,
    required String userEmail,
    required String teacherEmail,
  }) async {
    try {
      // Fetch the document from Firestore
      DocumentSnapshot ds =
          await _firestore.collection('AskTeacher').doc(userEmail).get();

      // Ensure data is a Map<String, dynamic>
      final data = ds.data() as Map<String, dynamic>?;

      if (data == null) {
        print("No data found for the document.");
        return;
      }

      // Safely retrieve the QuestionMap as a list of maps
      final questionMap = data['QuestionMap'];
      if (questionMap is List) {
        // Cast and process the list
        List<Map<String, dynamic>> questionList =
            questionMap.map((e) => e as Map<String, dynamic>).toList();
        // print("${questionList} ${questionList.length}");
        // Find the specific question by teacherEmail
        for (int i = 0; i < questionList.length; i++) {
          print("${questionList[i]['teacherEmail']} $i");
          if (questionList[i]['teacherEmail'] == teacherEmail) {
            // Update the specific question's answer
            questionList[i]['teacherAns'] = message;

            // Write the updated list back to Firestore
            await _firestore.collection('AskTeacher').doc(userEmail).update({
              'QuestionMap': questionList,
            });

            print("Teacher's answer updated successfully.");
            return; // Exit the loop after updating
          }
        }
        print("No matching teacherEmail found in QuestionMap.");
      } else {
        print("QuestionMap is not a valid list.");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

// chat with teacher

  Future<String> chatWithTeacher({
    required String message,
    required String userName,
    required String userEmail,
    required String teacherEmail,
  }) async {
    try {
      final result =
          await _firestore.collection("AskTeacher").doc(userEmail).set({
        "QuestionMap": FieldValue.arrayUnion([
          {
            "stuName": userName,
            "studentAsk": message,
            "stuEmail": userEmail,
            "teacherAns": "",
            "teacherEmail": teacherEmail,
          }
        ])
      });
      return "success";
    } catch (e) {
      return "Error";
    }
  }

  Future<List<Map<String, dynamic>>?> fetchChatWithTeacher(
      String userEmail) async {
    try {
      // Fetch the document from Firestore
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await _firestore.collection('AskTeacher').doc(userEmail).get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Retrieve data from the document
        Map<String, dynamic>? data = documentSnapshot.data();

        // Ensure QuestionMap exists and is a List of maps
        final questionMap = data?['QuestionMap'];
        if (questionMap is List) {
          // Safely cast and return the list of maps
          return questionMap.map((e) => e as Map<String, dynamic>).toList();
        } else {
          print("QuestionMap is not a valid list.");
          return null;
        }
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching chat with teacher: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> fetchTeacherInfo() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('TeacherInfo').get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}

// Stream<List<Map<String, dynamic>>> getContactDetails() {
//   return FirebaseFirestore.instance
//       .collection('chatAppUser')
//       .snapshots()
//       .map((snapshot) {
//     return snapshot.docs.map((snap) {
//       final user = snap.data();
//       return user;
//     }).toList();
//   });
// }
