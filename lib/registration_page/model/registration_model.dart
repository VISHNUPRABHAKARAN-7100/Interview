// To parse this JSON data, do
//
//     final RegistrationModel = RegistrationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class RegistrationModel {
  RegistrationModel({
    required this.email,
    required this.username,
    required this.password,
  });

  String email;
  String username;
  String password;

  factory RegistrationModel.fromRawJson(String str) =>
      RegistrationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        email: json["email"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
      };
}
