

import 'package:super_hero/feature/home_page/data/models/saledata_model.dart';

class SubSale {

 late List<SaleDataModel> data;

 SubSale.fromJson(Map<String, dynamic> json) {

   if (json['data'] != null) {
     data = <SaleDataModel>[];
     json['data'].forEach((v) {
       data!.add(new SaleDataModel.fromJson(v));
     });
   }

 }

 static Map<String, dynamic> toJson(SubSale user) {
   return {

     if (user.data != null)
       'advisor_category': user.data!.map((v) => SaleDataModel.toJson(v)).toList()
   };
 }}
