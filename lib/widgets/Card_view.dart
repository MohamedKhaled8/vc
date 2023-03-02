import 'package:flutter/material.dart';

import '../model/model_card.dart';

class CardView extends StatelessWidget {
  final ModelCard modelCard;
  const CardView({
    Key? key,
     required this.modelCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 5),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(15.0),
        image: DecorationImage(
          image: AssetImage(
              modelCard.image!),
          fit: BoxFit.cover,
        ),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0),
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(
                      horizontal: 40),
              child: Center(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .stretch,
                  children: [
                    Text(
                      modelCard.title!,
                      style: const TextStyle(
                          fontSize: 30),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}