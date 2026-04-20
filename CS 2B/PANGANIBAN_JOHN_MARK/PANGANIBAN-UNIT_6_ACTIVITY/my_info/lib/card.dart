import 'package:flutter/material.dart';

class InfoCard {

  static Container buildTemplateCard(String text) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Text(text),
    );
  }

  static List<Container> buildTemplateCards(int amount) {
    List<Container> newList = [];

    for (int i = 0; i < amount; i++) {
      newList.add(buildTemplateCard('Card $i'));
    }

    return newList;
  }
}