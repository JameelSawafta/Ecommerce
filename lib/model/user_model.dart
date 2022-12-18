class UserModel {
  String? userId;
  String? email;
  String? username;
  String? phoneNumber;

  UserModel({
    this.userId,
    this.email,
    this.username,
    this.phoneNumber,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    username = json['username'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['username'] = this.username;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}