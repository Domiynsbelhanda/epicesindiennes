import 'package:epicesindiennes/composants/detailAppBar.dart';
import 'package:epicesindiennes/database.dart';
import 'package:flutter/material.dart';
import '../composants/epicesUse.dart';
import '../global.dart';

class QuizDetail extends StatefulWidget {
  final int id;

  const QuizDetail({super.key, required this.id});

  @override
  State<StatefulWidget> createState() {
    return _QuizDetail();
  }
}

class _QuizDetail extends State<QuizDetail> {
  late Quiz quiz;

  @override
  void initState() {
    quiz = quizData.firstWhere((e) => e.id == widget.id);
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
                detailAppBar('${quiz.name}', context),
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
                            quiz.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(top: 8.0, left: 32.0, right: 16.0),
                  child: Text(
                    quiz.question,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),


                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(top: 8.0, left: 32.0, right: 16.0),
                  child: const Text(
                    "Réponses",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Color(0xFFFF9800),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),

                _responseCard(quiz),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6.0),
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
                      child: const Text(
                        "Question Suivante",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),


                    Container(
                      padding: const EdgeInsets.all(6.0),
                      margin: const EdgeInsets.only(top: 24.0, left: 32.0, right: 32.0),
                      decoration: BoxDecoration(
                        color: Colors.white, // Couleur de fond du titre
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                        ),
                        border: Border.all(color: const Color(0xFF263238), width: 2), // Contour de la couleur
                      ),
                      child: const Text(
                        "Question 1/5",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF263238), // Couleur du texte
                          fontSize: 18,
                        ),
                      ),
                    ),

                  ],
                )

              ],
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour construire une carte
  Widget _responseCard(Quiz quiz, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //Type de reponse ici

              ],
            ),
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