class UserModel {
  String? token;
  int? userId;
  int? emailVerificationCode;
  String? name;

  UserModel({this.token, this.userId, this.emailVerificationCode, this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    emailVerificationCode = json['email_verification_code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_id'] = this.userId;
    data['email_verification_code'] = this.emailVerificationCode;
    data['name'] = this.name;
    return data;
  }
}
