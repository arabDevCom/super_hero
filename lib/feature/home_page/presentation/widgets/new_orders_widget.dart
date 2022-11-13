import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_hero/feature/home_page/data/models/saledata_model.dart';
import 'package:super_hero/feature/home_page/data/models/send_model.dart';

import '../cubit/orders_cubit.dart';
import 'ItemsOrder.dart';

class NewOrderScreenWidget extends StatefulWidget {

  const NewOrderScreenWidget({Key? key}) : super(key: key);

  @override
  State<NewOrderScreenWidget> createState() => _NewOrderScreenWidgetState();
}

class _NewOrderScreenWidgetState extends State<NewOrderScreenWidget> {
  @override
  Widget build(BuildContext context) {
    NewOrdersCubit cubit = BlocProvider.of<NewOrdersCubit>(context);
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider.value(
        value: cubit,
        child: BlocBuilder<NewOrdersCubit, OrdersState>(
          builder: (context, state) {
            if (state is OnError) {
              return Expanded(
                child: Center(

                ),
              );
            }
            else {
              List<SaleDataModel> list = cubit.list;

              if (list.isNotEmpty) {
                return RefreshIndicator(
                    onRefresh: () async {
                      print("refreshing");
                    },
                    child:

                    SingleChildScrollView(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              ...List.generate(
                                list.length,
                                    (index) =>  ItemsOrders(saleDataModel: list[index]),
                              ),
                            ],
                          ),
                          Container(height: 800,)
                        ],
                      ),
                    )
                );
              }
              else {
                return Container(
                );
              }
            }
          },
        ));
  }
  }
