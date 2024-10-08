import 'package:epicesindiennes/composants/gridCard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GridCard(imageUrl: "", title: "Cucurama")
        ],
      ),
    );
  }
}