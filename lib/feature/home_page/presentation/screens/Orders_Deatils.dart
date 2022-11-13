import 'package:flutter/material.dart';
import '../widgets/order_details_body_widget.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0XFF282828),
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Order Details',
          style: TextStyle(
              color: Color(0XFF282828),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body:  orderDetailsBodyWidget(),
    );
  }
}
