import 'package:epicesindiennes/composants/detailAppBar.dart';
import 'package:epicesindiennes/database.dart';
import 'package:epicesindiennes/pages/recipeDetail.dart';
import 'package:flutter/material.dart';
import '../global.dart';
import 'dart:math';

import '../main.dart'; // Importer le package pour utiliser Random

class QuizResult extends StatefulWidget {
  final int result;

  const QuizResult({super.key, required this.result});

  @override
  State<StatefulWidget> createState() {
    return _QuizResult();
  }
}

class _QuizResult extends State<QuizResult> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: CurvedClipper(),
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
              ),
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                detailAppBar('Résultat du Quiz', context),

                const SizedBox(
                  height: 150,
                ),

                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(top: 8.0, left: 32.0, right: 16.0),
                  child: Text(
                    "Vous avez obtenus ${widget.result} / 5 à ce Quiz.", // Affiche le nombre de réponses attendues
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFFF9800),
                      fontWeight: FontWeight.w500,
                      fontSize: 45,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(selectedIndex: 3)),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    margin: const EdgeInsets.only(top: 24.0, left: 32.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFF263238),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Text(
                      "Retour à l'accueil",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
