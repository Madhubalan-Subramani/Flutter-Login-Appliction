class SignUpUserModel {
  final String userName;
  final String userEmail;
  final String userPhoneNo;
  final String userPassword;

  SignUpUserModel({
    required this.userName,
    required this.userEmail,
    required this.userPhoneNo,
    required this.userPassword,
  });

  // Convert SignUpUserModel to a Map to store it in Firebase
  Map<String, dynamic> toMap() {
    return {
      'user_name': userName,
      'user_email': userEmail,
      'user_PhoneNo': userPhoneNo,
      'user_Password': userPassword,
    };
  }
}
