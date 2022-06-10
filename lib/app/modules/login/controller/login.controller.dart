import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/services/auth/auth.service.dart';

part  'login.state.dart';

class LoginController extends Cubit<LoginState>{
  final AuthService _authService;


  LoginController({required AuthService authService}) :
          _authService = authService,
        super(const LoginState.initial());

  Future<void> signIn()async{
    try{
       emit(state.copyWith(loginStatus: LoginStatus.loading));

       await _authService.signIn();
    }catch(e, s){
      log('Erro ao fazer o login $e $s');
      emit(state.copyWith(loginStatus: LoginStatus.failure, errorMessage: 'Erro ao realizar o login'));
    }
  }

}