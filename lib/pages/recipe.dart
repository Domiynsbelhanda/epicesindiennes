import 'package:epicesindiennes/composants/gridCard.dart';
import 'package:epicesindiennes/composants/listCard.dart';
import 'package:epicesindiennes/database.dart';
import 'package:epicesindiennes/global.dart';
import 'package:epicesindiennes/pages/recipeDetail.dart';
import 'package:epicesindiennes/pages/spiceDetail.dart';
import 'package:flutter/material.dart';

import '../composants/appBar.dart';

Widget recipePage(BuildContext context) {

  return Column(
    children: [
      appBar(
        "Recettes",
        context,
      ),

      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16.0),
        child: Column(
          children: recipes.map(
                (Recipe e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SpiceCard(
                name: e.name,
                description: e.description,
                imagePath: e.image, // Chemin de l'image
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RecipeDetail(id: e.id)),
                  );
                },
              ),
            ),
          ).toList(),
        ),
      ),
    ],
  );
}
