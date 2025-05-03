import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String messageId;
  final String message;
  final String messageImage;
  final String userName;
  final String userImage;
  final Timestamp timestamp;
  final String? replyToMessage;

  Message({
    required this.messageId,
    required this.message,
    required this.messageImage,
    required this.userName,
    required this.userImage,
    required this.timestamp,
    this.replyToMessage,
  });

  // Convert a Message object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'message': message,
      'messageImage': messageImage,
      'userName': userName,
      'userImage': userImage,
      'timestamp': timestamp,
      'replyToMessage': replyToMessage,
    };
  }

  // Create a Message object from a JSON map
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: json['messageId'],
      message: json['message'],
      messageImage: json['messageImage'],
      userName: json['userName'],
      userImage: json['userImage'],
      timestamp: json['timestamp'],
      replyToMessage: json['replyToMessage'],
    );
  }
}
