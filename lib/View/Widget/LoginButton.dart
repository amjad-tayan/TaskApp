import 'package:flutter/material.dart';

import '../../Model/Constant.dart';

class LoginButton extends StatelessWidget {
  void Function()? onPressed;

  LoginButton({
    super.key,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        heroTag: 'Login',
        onPressed: onPressed,
        label: const Text('Login'),
        icon: const Icon(Icons.login_sharp),
        backgroundColor: secondary);
  }
}
