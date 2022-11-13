import 'package:super_hero/feature/login/data/models/login_model.dart';

import 'login_model.dart';
import 'login_model.dart';

class LoginModel {
  String jsonrpc = "2.0";
  Params params=Params();
  Map<String, dynamic> toJson() => {
    "params": params.toJson(),
    "jsonrpc": jsonrpc,

  };
}

 class Params {
  String db = "opaints-test";
  String login = "";
  String password="";
  Map<String, dynamic> toJson() => {
    "db": db,
    "login": login,
    "password": password,
  };
}
