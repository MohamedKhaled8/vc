import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vc/widgets/custom_appbar_two.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(110, text: 'Chat', onTap: (){}),

    );
  }
}