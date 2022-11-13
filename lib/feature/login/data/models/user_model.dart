


import 'package:super_hero/feature/login/data/models/user.dart';

class UserModel {
  late String jsonrpc;
  late User result;

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {
    result = User.fromJson(json['result']);

    jsonrpc =
    json['jsonrpc'] != null ? json['jsonrpc'] as String : '';
  }


  static Map<String, dynamic> toJson(UserModel user) {
    return {
      'result': User.toJson(user.result),

      'jsonrpc': user.jsonrpc,

    };
  }
}
