class UserModels {
   String userName;
  final String userEmail;
   String userPassword;
  final String userPhone;
  final String userEducationLevel; // having a degree,or diploma,phd....
  final String userUniversity;
   String userCurrentStatus;
  String userType;
   String userImage;

  UserModels({
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userPhone,
    required this.userEducationLevel,
    required this.userUniversity,
    required this.userType,
    required this.userCurrentStatus,
    required this.userImage,
  });


  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userPassword': userPassword,
      'userEducationLevel': userEducationLevel,
      'userUniversity': userUniversity,
      'userType': userType,
      'userCurrentStatus': userCurrentStatus,
      'userPhone': userPhone,
      "userImage":userImage,
    };
  }

  // Convert a UserModels object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userPassword': userPassword,
      'userPhone': userPhone,
      'userEducationLevel': userEducationLevel,
      'userUniversity': userUniversity,
      'userType': userType,
      'userCurrentStatus': userCurrentStatus,
      "userImage":userImage,
    };
  }

  // Create a UserModels object from a JSON map
  factory UserModels.fromJson(Map<String, dynamic> json) {
    return UserModels(
      userName: json['userName'],
      userEmail: json['userEmail'],
      userPassword: json['userPassword'],
      userPhone: json['userPhone'],
      userEducationLevel: json['userEducationLevel'],
      userUniversity: json['userUniversity'],
      userType: json['userType'],
      userCurrentStatus: json['userCurrentStatus'],
      userImage: json['userImage'],
    );
  }
}
