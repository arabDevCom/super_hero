import 'package:super_hero/feature/login/data/models/login_model.dart';



class SendModel {
  String jsonrpc = "2.0";
  String id="";
  Params params=Params();
  Map<String, dynamic> toJson() => {
    "params": params.toJson(),
    "jsonrpc": jsonrpc,
    "id": id,
  };
}

 class Params {

  int sales_id = 0;

  Map<String, dynamic> toJson() => {
    "sales_id": sales_id,

  };
}
