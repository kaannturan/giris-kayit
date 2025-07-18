class UserModel {
  String? email;
  String? password;
  String? token;
  int? id;

  UserModel({this.email, this.password, this.token, this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      token: json['token'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['token'] = token;
    data['id'] = id;
    return data;
  }

  Map<String, dynamic> toLoginJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  Map<String, dynamic> toRegisterJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
