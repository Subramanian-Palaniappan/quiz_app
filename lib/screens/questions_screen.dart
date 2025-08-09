import 'package:flutter/material.dart';
import 'package:quiz_app/utils/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onAnswerSelected});
  final void Function(String answer) onAnswerSelected;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onAnswerSelected(answer);

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
    // else: do nothing. Parent will take care of changing the screen.
  }

  @override
  Widget build(BuildContext context) {
    // Avoid crashing if index overflows
    if (currentQuestionIndex >= questions.length) {
      return const Center(child: CircularProgressIndicator());
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.nunito(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currentQuestion.getShuffeldAnswers().map(
              (answer) => AnswerButton(
                answerText: answer,
                onTap: () => answerQuestion(answer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:quiz_app/answer_button.dart';
// import 'package:quiz_app/data/questions.dart';
// import 'package:google_fonts/google_fonts.dart';

// class QuestionScreen extends StatefulWidget {
//   const QuestionScreen({super.key, required this.onAnswerSelected});
//   final void Function(String answer) onAnswerSelected;
//   @override
//   State<StatefulWidget> createState() {
//     return _QuestionScreenState();
//   }
// }

// class _QuestionScreenState extends State<QuestionScreen> {
//   var currentQuestionIndex = 0;

//   void answeQuestion(String answer) {
//     widget.onAnswerSelected(
//       answer, // Pass the selected answer to the parent widget
//     );

//     setState(() {
//       // Move to the next question
//       currentQuestionIndex++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentQuestion =
//         questions[currentQuestionIndex]; // For now, just showing the first question
//     return Center(
//       child: Container(
//         margin: EdgeInsets.all(20),
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               currentQuestion.question,
//               style: GoogleFonts.nunito(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ...currentQuestion.getShuffeldAnswers().map((answer) {
//               return AnswerButton(
//                 answerText: answer,
//                 onTap: () {
//                   answeQuestion(answer);
//                 },
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
