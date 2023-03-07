import 'package:flutter/material.dart';
import 'package:vc/widgets/custom_appbar_two.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          CustomAppBarOne(110, text: 'Order History')
        ],
      ),
    );
  }
}
