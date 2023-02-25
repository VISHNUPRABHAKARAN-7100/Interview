import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationProvider with ChangeNotifier {
  // API link for register
  final String registerUrl = 'https://test-auth-final.vercel.app/user/signup';

  // Function to register the user
  register(String email, String userName, String password,
      BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registerUrl),
          body: {'email': email, 'username': userName, 'password': password});
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User Registerd'),
        ),
      );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error'),
        ),
      );
    }
  }
}
