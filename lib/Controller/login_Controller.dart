import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  var userData;

  Future fetchData(
      String userName, String password, BuildContext context) async {
    final response =
        await http.post(Uri.parse('https://dummyjson.com/auth/login'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'username': userName,
              'password': password,
            }));
    if (response.statusCode == 200) {
      userData = jsonDecode(response.body);
      update();
      return userData;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              const Text('Error in User name or Password please try again...'),
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(80)),
          duration: const Duration(milliseconds: 1500),
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
  }
}


