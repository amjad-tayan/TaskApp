import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Widget/UserForm.dart';

class LoginPage extends StatelessWidget {
  static const routePage = '/LoginRegisterPage';

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: mediaQuery.height,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              left: 0,
              top: 0,
              width: mediaQuery.width * 0.3,
              child: Image.asset('images/main_top.png')),
          Positioned(
              bottom: 0,
              right: 0,
              width: mediaQuery.width * 0.3,
              child: Image.asset('images/login_bottom.png')),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 5),
                  child: SvgPicture.asset('images/sign_In.svg',
                      width: mediaQuery.width * 0.5, height: 160),
                ),
                UserForm()
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
