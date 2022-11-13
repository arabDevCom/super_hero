
import 'package:super_hero/feature/home_page/data/models/sub_sale.dart';

class SaleModel {
  late String jsonrpc;
  late SubSale result;

  SaleModel.fromJson(Map<String, dynamic> json) {
    result = SubSale.fromJson(json['result']);

    jsonrpc =
    json['jsonrpc'] != null ? json['jsonrpc'] as String : '';
  }


  static Map<String, dynamic> toJson(SaleModel user) {
    return {
      'result': SubSale.toJson(user.result),

      'jsonrpc': user.jsonrpc,

    };
  }
}
