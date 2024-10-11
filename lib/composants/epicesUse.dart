import 'package:flutter/material.dart';

import '../database.dart';
import '../global.dart';
import '../main.dart';
import '../pages/spiceDetail.dart';
import 'gridCard.dart';

Widget epicesUse(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left : 16.0, right: 16.0, top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Les épices les plus utilisés",
              style: TextStyle(
                fontSize: width(context) / 20,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(selectedIndex: 1)),
                );
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
              imageUrl: indianSpices[2].image,
              title: indianSpices[2].name,
              id: indianSpices[2].id, onClick: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpiceDetail(id: indianSpices[2].id)),
              );
            },
            ),

            GridCard(
              imageUrl: indianSpices[4].image,
              title: indianSpices[4].name,
              id: indianSpices[4].id,
              onClick: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SpiceDetail(id: indianSpices[4].id)),
                );
              },
            ),
          ],
        ),
      ),
    ],
  );
}