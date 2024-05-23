import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Tasks_Controller.dart';
import '../../Controller/login_Controller.dart';
import '../../Model/Constant.dart';
import 'FormInput.dart';
import 'LoginButton.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);

  LoginController loginController = Get.put(LoginController(), permanent: true);
  Tasks tasks = Get.put(Tasks(), permanent: true);

  final _key = GlobalKey<FormState>();
  String? _username;

  String? _password;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: primary,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Form(
          key: _key,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text('Login',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white, fontSize: 22)),
              FormInput(
                key: const ValueKey('User_Name'),
                text: 'User Name',
                textcolor: Colors.white,
                icon: Icons.verified_user_outlined,
                keyboardType: TextInputType.text,
                obscureText: false,
                onChanged: (p0) {
                  _username = p0;
                },
              ),
              FormInput(
                key: const ValueKey('Password'),
                text: 'Password',
                textcolor: Colors.white,
                icon: Icons.password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (p0) {
                  _password = p0;
                },
              ),
              const SizedBox(height: 10),
              LoginButton(onPressed: () async {
                if (_username != null && _password != null) {
                  var result = await loginController.fetchData(
                      _username!, _password!, context);
                  if (result != null) {
                    tasks.getAllTasks(loginController.userData['id']);
                    Get.offNamed('/TasksPage');
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                          'Missing filed, please enter username and password'),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(80)),
                      duration: const Duration(milliseconds: 1500),
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
