import 'package:epicesindiennes/composants/detailAppBar.dart';
import 'package:epicesindiennes/database.dart';
import 'package:epicesindiennes/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../composants/epicesUse.dart';
import '../composants/listCard.dart';
import '../global.dart';

class CategoryList extends StatefulWidget {

  const CategoryList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CategoryList();
  }
}

class _CategoryList extends State<CategoryList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            detailAppBar("Categorie d'épices", context),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16.0),
              child: Column(
                children: spiceCategories.map(
                      (SpiceCategory e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SpiceCard(
                      name: e.name,
                      description: e.description,
                      imagePath: e.image, // Chemin de l'image
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage(selectedIndex: 1, categoryItem: e.id,)),
                        );
                      },
                    ),
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}