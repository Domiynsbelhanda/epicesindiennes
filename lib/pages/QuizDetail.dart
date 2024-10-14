import 'package:epicesindiennes/composants/detailAppBar.dart';
import 'package:epicesindiennes/database.dart';
import 'package:epicesindiennes/pages/recipeDetail.dart';
import 'package:flutter/material.dart';
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
  int? selectedAnswer; // Variable to hold the selected radio button
  List<int> selectedAnswers = []; // Liste dynamique pour les réponses sélectionnées
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    quiz = quizData.firstWhere((e) => e.id == widget.id);
    // selectedAnswers est initialisée comme une liste vide, permettant des modifications
    selectedAnswers = [];
  }

  // Function to check if the answer is correct
  void checkAnswer() {
    if (quiz.questionType == "radio") {
      if (selectedAnswer != null && quiz.correctAnswers.contains(selectedAnswer)) {
        _showNotification(true);
      } else {
        _showNotification(false);
      }
    } else if (quiz.questionType == "button") {
      // Vérifie si les réponses sélectionnées sont correctes
      if (selectedAnswers.length == quiz.correctAnswers.length &&
          selectedAnswers.every((answer) => quiz.correctAnswers.contains(answer))) {
        _showNotification(true);
      } else {
        _showNotification(false);
      }
    } else if (quiz.questionType == "checkbox") {
      // Vérifie si toutes les réponses sélectionnées sont correctes
      if (selectedAnswers.length == quiz.correctAnswers.length &&
          selectedAnswers.every((answer) => quiz.correctAnswers.contains(answer))) {
        _showNotification(true);
      } else {
        _showNotification(false);
      }
    } else {
      if (selectedAnswers.every((answer) => quiz.correctAnswers.contains(answer)) &&
          quiz.correctAnswers.length == selectedAnswers.length) {
        _showNotification(true);
      } else {
        _showNotification(false);
      }
    }
  }

  // Notification to show whether the answer is correct
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
                      onTap: checkAnswer,
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        margin: const EdgeInsets.only(top: 24.0, left: 32.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFF263238),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                    ),
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      margin: const EdgeInsets.only(top: 24.0, left: 32.0, right: 32.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: const Color(0xFF263238), width: 2),
                      ),
                      child: const Text(
                        "Question 1/5",
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                backgroundColor: isSelected ? Colors.orange : Colors.grey, // Change la couleur du bouton sélectionné
              ),
              onPressed: () {
                setState(() {
                  if (isSelected) {
                    selectedAnswers.remove(index); // Désélectionne si déjà sélectionné
                  } else {
                    if (selectedAnswers.length < 2) { // Limite à deux réponses
                      selectedAnswers.add(index); // Sélectionne ce bouton
                    }
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
