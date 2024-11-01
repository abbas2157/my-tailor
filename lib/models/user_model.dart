class UserModel {
  String? token;
  String? userId;
  String? emailVerificationCode;
  String? name;
  String? email;

  UserModel(
      {this.token,
      this.userId,
      this.emailVerificationCode,
      this.name,
      this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'].toString();
    emailVerificationCode = json['email_verification_code'].toString();
    name = json['name'];
    email = json['email'];
  }
}
