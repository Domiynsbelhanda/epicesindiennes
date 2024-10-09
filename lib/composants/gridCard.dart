import 'package:flutter/material.dart';

import '../global.dart';

class GridCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int id;
  final dynamic onClick;

  const GridCard({
    required this.imageUrl,
    required this.title,
    required this.id,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context) / 2.3,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Make column fill the card
          children: [
            // Flexible or Expanded allows the image to take as much space as needed
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                imageUrl,
                height: width(context) / 3,
                width: double.infinity,
                fit: BoxFit.cover, // Cover ensures the image fits well
              ),
            ),
            GestureDetector(
              onTap: onClick,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF263238), // Background color for the title
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white, // Text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
