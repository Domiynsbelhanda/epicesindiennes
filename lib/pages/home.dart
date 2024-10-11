import 'package:epicesindiennes/composants/epicesUse.dart';
import 'package:epicesindiennes/composants/gridCard.dart';
import 'package:epicesindiennes/database.dart';
import 'package:epicesindiennes/global.dart';
import 'package:epicesindiennes/main.dart';
import 'package:epicesindiennes/pages/spiceDetail.dart';
import 'package:flutter/material.dart';

import '../composants/appBar.dart';

Widget homePage(BuildContext context){
  return Column(
    children: [
      appBar("Accueil", context),


      epicesUse(context),



      Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Catégorie d'épice",
              style: TextStyle(
                fontSize: width(context) / 20,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                // Action when "Voir plus" is pressed
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: primaryColor), // Border color
              ),
              child: Text(
                "Voir plus",
                style: TextStyle(color: secondaryColor), // Text color
              ),
            ),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GridCard(
              imageUrl: spiceCategories[3].image,
              title: spiceCategories[3].name,
              id: spiceCategories[3].id, onClick: null,
            ),

            GridCard(
              imageUrl: spiceCategories[2].image,
              title: spiceCategories[2].name,
              id: spiceCategories[2].id, onClick: null,
            ),
          ],
        ),
      ),




      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quiz les plus fréquents",
              style: TextStyle(
                fontSize: width(context) / 20,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                // Action when "Voir plus" is pressed
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: primaryColor), // Border color
              ),
              child: Text(
                "Voir plus",
                style: TextStyle(color: secondaryColor), // Text color
              ),
            ),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GridCard(
              imageUrl: quizData[2].image,
              title: quizData[2].name,
              id: quizData[2].id, onClick: null,
            ),

            GridCard(
              imageUrl: quizData[4].image,
              title: quizData[4].name,
              id: quizData[4].id, onClick: null,
            ),
          ],
        ),
      )
    ],
  );
}