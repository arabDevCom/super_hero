
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/map_failure_message.dart';
import '../../data/models/login_model.dart';
import '../../data/models/user_model.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  late PostLoginUseCase postLoginUseCase;
  LoginCubit() : super(LoginInitial()) {
    // TODO: implement LoginCubit
    throw UnimplementedError();
  }

  LoginModel loginModel=LoginModel();
  Future<void> postLoginData(
      ) async {
    emit(LoginLoading());

    Either<Failure, UserModel> response =
        await postLoginUseCase(loginModel);
    emit(state);

  }

  storeUser( UserModel loginModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(loginModel));
  }

  loginSuccessfully() {
    emit(LoginInitial());
  }
}
