import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
      title: 'quizzler_flutter',
));

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer({required bool userPickedAnswer}) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {

        Alert(context: context, title: 'Finished!', desc: 'You\'ve reached the end of the quiz.',).show();
        quizBrain.reset();
        scoreKeeper.clear();
      } else {
        if (correctAnswer == userPickedAnswer) {
          quizBrain.nextQuestion();
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green,));
        } else {
          quizBrain.nextQuestion();
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red,));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff222222),
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Center(
                    child: Text(
                      quizBrain.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      // the user picked true.
                      checkAnswer(userPickedAnswer: true);
                    },
                    child: const Text(
                      'True',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      // the user picked false.
                      checkAnswer(userPickedAnswer: false);
                    },
                    child: const Text(
                      'False',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Row(children: scoreKeeper),
            ],
          ),
        ),
    );
  }
}
