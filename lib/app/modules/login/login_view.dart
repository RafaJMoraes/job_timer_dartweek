import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/login/controller/login.controller.dart';

class LoginView extends StatefulWidget {
  final LoginController loginController;

  const LoginView({Key? key, required this.loginController}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      listenWhen: (previous, actual)=> previous.loginStatus != actual.loginStatus,
        listener: (context, state){
          if(state.loginStatus == LoginStatus.failure){
            AsukaSnackbar.alert(state.errorMessage ?? "Erro no login").show();
          }
        },
        bloc: widget.loginController,
        child: Scaffold(
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
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * .10),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.8,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey.shade200, fixedSize: Size.fromHeight(56)),
                          onPressed: login,
                          child: Image.asset('assets/images/google.png')),
                    ),
                    BlocSelector<LoginController, LoginState, bool>(
                        bloc: widget.loginController,
                        selector: (state) => state.loginStatus == LoginStatus.loading,
                        builder: (context, show) {
                          return  Visibility(
                              visible: show,
                              child: const  Padding(padding: EdgeInsets.only(top: 20),
                                  child: Center(child: CircularProgressIndicator.adaptive(
                                      backgroundColor: Colors.white)
                                  )
                              )
                          );
                        }
                    )
                  ],
                ),
              ),
            )),
    );
  }

  void login() {
    widget.loginController.signIn();
  }
}
