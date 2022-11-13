

import 'dart:convert';

import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/login_model.dart';
import '../models/user_model.dart';

abstract class BaseLoginDataSource {
  Future<UserModel> postLoginData(LoginModel loginModel);
}
class LoginDataSource extends BaseLoginDataSource{
  final BaseApiConsumer apiConsumer;

  LoginDataSource({required this.apiConsumer});

  @override
  Future<UserModel> postLoginData(LoginModel loginDataModel) async {
    final response = await apiConsumer.post(EndPoints.loginUrl,
        body: loginDataModel.toJson()
    );
    return UserModel.fromJson(response);
  }
}

