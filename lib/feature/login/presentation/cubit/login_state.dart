part of 'login_cubit.dart';


@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginGoodBye extends LoginState {}
class OnLoginSuccess extends LoginState {
  UserModel userModel;

  OnLoginSuccess(this.userModel);
}

class OnError extends LoginState {
  String error;
  OnError(this.error);
}




class LoginLoading extends LoginState {}
class LoginSuccessfully extends LoginState {}


class LoginLoadedError extends LoginState {
  final String message;

  LoginLoadedError({required this.message});

  @override
  List<Object> get props => [message];
}
