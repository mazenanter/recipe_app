class UserModel {
  final String uId;
  final String userName;
  final String email;

  UserModel({required this.uId, required this.userName, required this.email});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      userName: json['userName'],
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'userName': userName,
      'email': email,
    };
  }
}
