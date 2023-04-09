// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:vc/theme/constant/sized.dart';

import '../model/payment/all_payment_mdel.dart';

class CredetCard extends StatelessWidget {
  final bool deleate;
  final Data paymentCard;
  const CredetCard({
    Key? key,
    this.deleate = false,
    required this.paymentCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenUtil.setHeight(85),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            colors: paymentCard.brand == 'Visa' ? visColor : masterColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Name Required',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                width: screenUtil.setWidth(50),
              ),
              paymentCard.brand == 'Visa'
                  ? Image.asset('assets/icons/visa.png')
                  : Image.asset('assets/icons/master.png'),
            ],
          ),
          SizedBox(
            height: screenUtil.setHeight(15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '•••• •••• •••• ${paymentCard.last4}',
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(
                width: screenUtil.setWidth(50),
              ),
              Text(
                '${paymentCard.expMonth}/${paymentCard.expYear}',
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<Color> masterColor = [
  const Color(0xffF2A91B),
  const Color.fromARGB(255, 205, 126, 37),
  const Color(0xffBC6907),
];
List<Color> visColor = [
  const Color(0xff0099D6),
  const Color.fromARGB(255, 7, 154, 212),
  const Color.fromARGB(255, 7, 154, 212),
  const Color(0xff017BAB),
];
