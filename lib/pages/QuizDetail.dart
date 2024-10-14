import 'package:epicesindiennes/composants/detailAppBar.dart';
import 'package:epicesindiennes/database.dart';
import 'package:epicesindiennes/pages/QuizResult.dart';
import 'package:epicesindiennes/pages/recipeDetail.dart';
import 'package:flutter/material.dart';
import '../global.dart';
import 'dart:math'; // Importer le package pour utiliser Random

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
  int? selectedAnswer; // Variable to hold the selected radio button
  List<int> selectedAnswers = []; // Liste dynamique pour les réponses sélectionnées
  int questionCount = 0; // Compteur de questions
  int correctAnswersCount = 0; // Compteur de réponses correctes
  final random = Random(); // Instance de Random pour la sélection aléatoire

  @override
  void initState() {
    super.initState();
    quiz = quizData.firstWhere((e) => e.id == widget.id);
    selectedAnswers = [];
  }

  // Fonction pour sélectionner une question aléatoire
  void selectRandomQuestion() {
    if (questionCount < 5) {
      setState(() {
        quiz = quizData[random.nextInt(quizData.length)]; // Sélectionne une question aléatoire
        selectedAnswers.clear(); // Réinitialise les réponses sélectionnées
        selectedAnswer = null; // Réinitialise la réponse sélectionnée
      });
    }
  }

  void checkAnswer() {
    bool correct = false; // Variable pour vérifier si la réponse est correcte

    if (quiz.questionType == "radio") {
      correct = selectedAnswer != null && quiz.correctAnswers.contains(selectedAnswer);
    } else if (quiz.questionType == "button") {
      correct = selectedAnswers.length == quiz.correctAnswers.length &&
          selectedAnswers.every((answer) => quiz.correctAnswers.contains(answer));
    } else if (quiz.questionType == "checkbox") {
      correct = selectedAnswers.length == quiz.correctAnswers.length &&
          selectedAnswers.every((answer) => quiz.correctAnswers.contains(answer));
    } else {
      correct = selectedAnswers.every((answer) => quiz.correctAnswers.contains(answer)) &&
          quiz.correctAnswers.length == selectedAnswers.length;
    }

    if (correct) {
      correctAnswersCount++; // Incrémente le compteur de réponses correctes
    }

    _showNotification(correct);
    questionCount++; // Incrémente le compteur de questions

    // Si 5 questions sont répondues, afficher le résultat
    if (questionCount >= 5) {
      // Affiche le score
      print("Votre score: $correctAnswersCount/5");
    } else {
      selectRandomQuestion(); // Sélectionne une nouvelle question
    }
  }

  void _showNotification(bool correct) {
    final snackBar = SnackBar(
      content: Text(correct ? "Réponse correcte !" : "Réponse incorrecte !"),
      backgroundColor: correct ? Colors.green : Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  color: primaryColor,
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
                      width: width(context) / 1.2,
                      height: width(context) / 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
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
                  child: Text(
                    "Réponses (attendues : ${quiz.correctAnswers.length})", // Affiche le nombre de réponses attendues
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Color(0xFFFF9800),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: _responseCard(quiz),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (questionCount <= 4) {
                            checkAnswer();
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => QuizResult(result: correctAnswersCount)),
                            );
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        margin: const EdgeInsets.only(top: 24.0, left: 32.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFF263238),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(
                          questionCount <= 4 ? "Question Suivante" : "Voir le Résultat",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      margin: const EdgeInsets.only(top: 24.0, left: 32.0, right: 32.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: const Color(0xFF263238), width: 2),
                      ),
                      child: Text(
                        questionCount <= 4 ? "Question ${questionCount + 1}/5" : "Question 5/5", // Affiche le nombre de questions répondues
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF263238),
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

  Widget _responseCard(Quiz quiz) {
    switch (quiz.questionType) {
      case "radio":
        return Column(
          children: quiz.options.asMap().entries.map((entry) {
            int index = entry.key;
            String option = entry.value;
            return RadioListTile(
              value: index,
              groupValue: selectedAnswer,
              onChanged: (value) {
                setState(() {
                  selectedAnswer = value as int;
                  selectedAnswers.clear(); // Réinitialise les réponses sélectionnées pour les radio
                });
              },
              title: Text(option),
            );
          }).toList(),
        );
      case "checkbox":
        return Column(
          children: quiz.options.asMap().entries.map((entry) {
            int index = entry.key;
            String option = entry.value;
            return CheckboxListTile(
              value: selectedAnswers.contains(index),
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    selectedAnswers.add(index);
                  } else {
                    selectedAnswers.remove(index);
                  }
                });
              },
              title: Text(option),
            );
          }).toList(),
        );
      case "button":
        return Column(
          children: quiz.options.asMap().entries.map((entry) {
            int index = entry.key;
            String option = entry.value;
            bool isSelected = selectedAnswers.contains(index); // Vérifie si le bouton est sélectionné
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.green : Colors.grey, // Change la couleur en fonction de la sélection
              ),
              onPressed: () {
                setState(() {
                  if (isSelected) {
                    selectedAnswers.remove(index); // Désélectionne si déjà sélectionné
                  } else {
                    selectedAnswers.add(index); // Ajoute à la sélection
                  }
                });
              },
              child: Text(option),
            );
          }).toList(),
        );
      default:
        return Container();
    }
  }
}
