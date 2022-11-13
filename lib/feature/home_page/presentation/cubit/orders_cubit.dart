import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../service.dart';
import '../../../login/data/models/user.dart';
import '../../../login/data/models/user_model.dart';
import '../../data/models/sale_model.dart';
import '../../data/models/saledata_model.dart';
import '../../data/models/send_model.dart';



part 'orders_state.dart';

class NewOrdersCubit extends Cubit<OrdersState> {
  late ServiceApi api;
  late List<SaleDataModel> list;

  NewOrdersCubit() : super(IsLoading()) {
    api = ServiceApi();
    list = [];
  }

  void getOrderData(SendModel sendModel) async {
    try {

      UserModel model = await getUserModel();
      String user_token = '';
   sendModel.id=model.result.user_id[0].toString();
   sendModel.params.sales_id=model.result.user_id[0];
      emit(IsLoading());
      SaleModel response = await api.getHomeData(sendModel);
      //print("lklkkk${response.status.code}");
      // print(response.data.messages.length);
      if (response.result!=null) {
        list = response.result.data;
        emit(OnDataSuccess(list));
      }
    } catch (e) {
      print("dddd${e.toString()}");
      OnError(e.toString());
    }
  }
  Future<UserModel> getUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('user');
    UserModel userModel;
    if (jsonData != null) {
      userModel = UserModel.fromJson(jsonDecode(jsonData));
    }else{
      userModel = UserModel();
      User user = User(user_id: []);
      userModel.result = user;

    }

    return userModel;
  }

}
