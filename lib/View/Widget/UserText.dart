import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/login_Controller.dart';

class UserText extends StatelessWidget {
  UserText({
    super.key,
  });
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GetBuilder<LoginController>(
        builder: (controller) {
          return Text(
            'Welcome ${controller.userData['username']}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          );
        },
      ),
    );
  }
}
