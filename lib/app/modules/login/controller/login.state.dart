part of 'login.controller.dart';


enum LoginStatus {initial,loading, failure, success}


class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final String? errorMessage;
  const LoginState._({
    required this.loginStatus,
    this.errorMessage});

  const LoginState.initial() : this._(loginStatus:  LoginStatus.initial);


  @override
  // TODO: implement props
  List<Object?> get props => [loginStatus, errorMessage];

  LoginState copyWith({
    LoginStatus? loginStatus,
    String? errorMessage,
  }) {
    return LoginState._(
      loginStatus: loginStatus ?? this.loginStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}