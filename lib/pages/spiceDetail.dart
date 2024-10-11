import 'package:epicesindiennes/composants/detailAppBar.dart';
import 'package:epicesindiennes/database.dart';
import 'package:flutter/material.dart';
import '../composants/epicesUse.dart';
import '../global.dart';

class SpiceDetail extends StatefulWidget {
  final int id;

  const SpiceDetail({super.key, required this.id});

  @override
  State<StatefulWidget> createState() {
    return _SpiceDetail();
  }
}

class _SpiceDetail extends State<SpiceDetail> {
  late IndianSpice epice;

  @override
  void initState() {
    epice = indianSpices.firstWhere((e) => e.id == widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: CurvedClipper(),
              child: Container(
                height: 300.0,
                decoration: BoxDecoration(
                  color: primaryColor, // Couleur principale du background
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                detailAppBar('Detail ${epice.name}', context),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      width: width(context) / 1.2, // Ajuster selon votre design
                      height: width(context) / 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Bordure blanche
                          borderRadius: BorderRadius.circular(20), // Bordure extérieure
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), // Couleur de l'ombre
                              spreadRadius: 3, // Étendue de l'ombre
                              blurRadius: 6, // Lissage des bords de l'ombre
                              offset: const Offset(0, 3), // Position de l'ombre (x, y)
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15), // Rayon de coin de l'image
                          child: Image.asset(
                            epice.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.only(top: 24.0, left: 32.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF263238), // Couleur de fond du titre
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    epice.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white, // Couleur du texte
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(top: 8.0, left: 32.0),
                  child: Text(
                    epice.description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                // Carte pour Utilisations
                _buildCard('Utilisations', epice.utilization),
                // Carte pour Avantages
                _buildCard('Avantages', epice.advantage, color: Colors.green),
                // Carte pour Inconvénients
                _buildCard('Inconvénients', epice.inconvenient, color: Colors.red),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: epicesUse(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour construire une carte
  Widget _buildCard(String title, String content, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: color ?? Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 100);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}