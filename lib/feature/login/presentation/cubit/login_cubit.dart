import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../service.dart';
import '../../data/models/login_model.dart';
import '../../data/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  late ServiceApi api;

  LoginModel loginModel = LoginModel();

  LoginCubit() : super(LoginInitial()) {
    api = ServiceApi();
  }

  void login(BuildContext context) async {
    //  AppWidget.createProgressDialog(context, 'wait'.tr());

    try {
      UserModel response = await api.login(loginModel);
      // Navigator.pop(context);

      if (response != null) {
        print("oooooooooooooooooo");
        storeUser(response);
        emit(OnLoginSuccess(response));
      }
      // else if (response.status.code == 406) {
      //   emit(OnSignUp(loginModel));
      // } else {
      //   print("errorCode=>${response.status.code}");
      // }
    } catch (e) {
      print("error${e.toString()}");
      Navigator.pop(context);
      emit(OnError(e.toString()));
    }
  }
  storeUser(UserModel loginModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(loginModel));
  }
}
