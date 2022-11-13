
class SaleDataModel {
 late int  id;
 late String name;
 late String customer;
 late String phone;
 late String expected_closing;
 late String latitude;
 late String longitude;

  SaleDataModel.fromJson(Map<String, dynamic> json) {
    id =
    json['id'] != null ? json['id'] as int : 0;
    name =
    json['name'] != null ? json['name'] as String : '';
    customer =
    json['customer'] != null ? json['customer'] as String : '';
    phone =
    json['phone'] != null ? json['phone'] as String : '';
    expected_closing =
    json['expected_closing'] != null ? json['expected_closing'] as String : '';
    latitude =
    json['latitude'] != null ? json['latitude'] as String : '';
    longitude =
    json['longitude'] != null ? json['longitude'] as String : '';

  }


  static Map<String, dynamic> toJson(SaleDataModel user) {
    return {
      'id': user.id,
      'name': user.name,
      'phone': user.phone,
      'customer': user.customer,
      'latitude': user.latitude,
      'longitude': user.longitude
      ,
    };
  }
}
