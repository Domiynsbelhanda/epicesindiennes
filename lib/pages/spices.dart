import 'package:epicesindiennes/composants/gridCard.dart';
import 'package:epicesindiennes/composants/listCard.dart';
import 'package:epicesindiennes/database.dart';
import 'package:epicesindiennes/global.dart';
import 'package:epicesindiennes/pages/spiceDetail.dart';
import 'package:flutter/material.dart';

import '../composants/appBar.dart';

Widget spicePage(BuildContext context, int? categoryItem) {
  // Filter spices based on categoryItem, if it is provided
  List<IndianSpice> spicesToDisplay = categoryItem != null
      ? indianSpices.where((e) => e.categoryId == categoryItem).toList()
      : indianSpices; // Show all spices if categoryItem is null

  // Initialize spice variable
  SpiceCategory? spice;
  if (categoryItem != null) {
    // Use try-catch to avoid exceptions when categoryItem is not found
    try {
      spice = spiceCategories.firstWhere((e) => e.id == categoryItem);
    } catch (e) {
      spice = null; // In case the category is not found, spice will remain null
    }
  }

  return Column(
    children: [
      appBar(
        // Provide a default title if spice is null
        categoryItem != null && spice != null
            ? spice.name
            : 'Liste d\'épices',
        context,
      ),

      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16.0),
        child: Column(
          children: spicesToDisplay.map(
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
