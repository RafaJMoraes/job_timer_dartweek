import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff0092b9),
        Color(0xff0167b2),
      ])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/logo.png'),
            SizedBox(height: MediaQuery.of(context).size.height * .10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(primary: Colors.grey.shade200, fixedSize: Size.fromHeight(56)),
                  onPressed: login,
                  child: Image.asset('assets/images/google.png')),
            )
          ],
        ),
      ),
    ));
  }

  void login() {}
}
