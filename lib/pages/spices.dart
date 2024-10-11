import 'package:epicesindiennes/composants/gridCard.dart';
import 'package:epicesindiennes/composants/listCard.dart';
import 'package:epicesindiennes/database.dart';
import 'package:epicesindiennes/global.dart';
import 'package:epicesindiennes/pages/spiceDetail.dart';
import 'package:flutter/material.dart';

import '../composants/appBar.dart';

Widget spicePage(BuildContext context) {
  return Column(
    children: [
      appBar("Liste d'épices", context),

      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16.0),
        child: Column(
          children: indianSpices.map(
                (IndianSpice e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SpiceCard(
                name: e.name,
                description: e.description,
                imagePath: e.image, // Chemin de l'image
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SpiceDetail(id: e.id)),
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
