import 'package:flutter/material.dart';
import 'ItemsOrder.dart';

class CompleteOrdersScreenWidget extends StatelessWidget {
  const CompleteOrdersScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          print("refreshing");
        },
        child:  SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  ...List.generate(
                    1,
                        (index) =>  ItemsOrders(),
                  ),
                ],
              ),
              Container(height: 800,)
            ],
          ),
        )
    );

  }
}
