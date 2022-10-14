import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? name;
  String? email;
  String? photoUrl;
  UserModel({
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    photoUrl = map['photoUrl'];
  }

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        email: json['email'],
        photoUrl: json['photoUrl'],
      );
}
